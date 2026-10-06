package cn.lmx.kpu.base.manager.common.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.map.MapBuilder;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.dynamic.datasource.annotation.DS;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.basic.cache.redis2.CacheResult;
import cn.lmx.basic.cache.repository.CachePlusOps;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.query.LbQueryWrap;
import cn.lmx.basic.echo.properties.EchoProperties;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.utils.CollHelper;
import cn.lmx.kpu.base.entity.common.BaseDict;
import cn.lmx.kpu.base.manager.common.BaseDictManager;
import cn.lmx.kpu.base.mapper.common.BaseDictMapper;
import cn.lmx.kpu.common.cache.base.common.BaseDictCacheKeyBuilder;
import cn.lmx.kpu.common.constant.DefValConstants;
import cn.lmx.kpu.common.constant.DsConstant;
import cn.lmx.kpu.system.vo.result.system.DefDictItemResultVO;

import java.io.Serializable;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;

import static java.util.stream.Collectors.groupingBy;
import static java.util.stream.Collectors.toList;

/**
 * 基础字典
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@RequiredArgsConstructor
@Service
public class BaseDictManagerImpl extends SuperManagerImpl<BaseDictMapper, BaseDict> implements BaseDictManager {

    private final CachePlusOps cachePlusOps;
    private final EchoProperties ips;

    @Override
    @DS(DsConstant.BASE_TENANT)
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public Map<Serializable, BaseDict> findByIds(Set<Serializable> dictKeys) {
        if (dictKeys.isEmpty()) {
            return Collections.emptyMap();
        }
        Map<Serializable, BaseDict> codeValueMap = MapUtil.newHashMap();
        dictKeys.forEach(dictKey -> {
            Function<CacheKey, Map<String, BaseDict>> fun = ck -> {
                LbQueryWrap<BaseDict> wrap = Wraps.<BaseDict>lbQ().eq(BaseDict::getParentKey, dictKey).eq(BaseDict::getState, true)
                        .orderByAsc(BaseDict::getSortValue);
                List<BaseDict> list = baseMapper.selectList(wrap);
                if (CollUtil.isNotEmpty(list)) {
                    return CollHelper.uniqueIndex(list, BaseDict::getKey, item -> item);
                } else {
                    return MapBuilder.<String, BaseDict>create().put(DefValConstants.DICT_NULL_VAL_KEY, new BaseDict()).build();
                }
            };
            Map<String, CacheResult<BaseDict>> map = cachePlusOps.hGetAll(BaseDictCacheKeyBuilder.builder(dictKey), fun);
            map.forEach((itemKey, itemName) -> {
                if (!DefValConstants.DICT_NULL_VAL_KEY.equals(itemKey)) {
                    codeValueMap.put(StrUtil.join(ips.getDictSeparator(), dictKey, itemKey), itemName.getValue());
                }
            });
        });
        return codeValueMap;
    }

    @Override
    @DS(DsConstant.BASE_TENANT)
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public Map<String, List<DefDictItemResultVO>> findDictMapItemListByKey(List<String> dictKeys) {
        if (CollUtil.isEmpty(dictKeys)) {
            return Collections.emptyMap();
        }
        LbQueryWrap<BaseDict> query = Wraps.<BaseDict>lbQ().in(BaseDict::getParentKey, dictKeys).orderByAsc(BaseDict::getSortValue);
        List<BaseDict> list = super.list(query);
        List<DefDictItemResultVO> voList = BeanUtil.copyToList(list, DefDictItemResultVO.class);

        //key 是类型
        return voList.stream().collect(groupingBy(DefDictItemResultVO::getParentKey, LinkedHashMap::new, toList()));
    }

}
