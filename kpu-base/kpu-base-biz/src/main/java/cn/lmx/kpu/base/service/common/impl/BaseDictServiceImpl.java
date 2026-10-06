package cn.lmx.kpu.base.service.common.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import com.baomidou.dynamic.datasource.annotation.DS;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.basic.cache.repository.CachePlusOps;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.model.cache.CacheHashKey;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.kpu.base.entity.common.BaseDict;
import cn.lmx.kpu.base.manager.common.BaseDictManager;
import cn.lmx.kpu.base.service.common.BaseDictService;
import cn.lmx.kpu.base.vo.save.common.BaseDictSaveVO;
import cn.lmx.kpu.base.vo.update.common.BaseDictUpdateVO;
import cn.lmx.kpu.common.cache.base.common.BaseDictCacheKeyBuilder;
import cn.lmx.kpu.common.constant.DefValConstants;
import cn.lmx.kpu.common.constant.DsConstant;
import cn.lmx.kpu.model.enumeration.system.DictClassifyEnum;
import cn.lmx.kpu.system.entity.system.DefDict;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 业务实现类
 * 字典
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
@DS(DsConstant.BASE_TENANT)
public class BaseDictServiceImpl extends SuperServiceImpl<BaseDictManager, Long, BaseDict> implements BaseDictService {

    private final CachePlusOps cachePlusOps;

    @Override
    public boolean checkByKey(String key, Long id) {
        ArgumentAssert.notEmpty(key, "请填写字典标识");
        return superManager.count(Wraps.<BaseDict>lbQ().eq(BaseDict::getKey, key)
                .eq(BaseDict::getParentId, DefValConstants.PARENT_ID).ne(BaseDict::getId, id)) > 0;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public <SaveVO> BaseDict save(SaveVO saveVO) {
        BaseDictSaveVO dictSaveVO = (BaseDictSaveVO) saveVO;
        ArgumentAssert.isFalse(checkByKey(dictSaveVO.getKey(), null), "字典标识已存在");
        BaseDict dict = BeanPlusUtil.toBean(dictSaveVO, BaseDict.class);
        dict.setClassify(DictClassifyEnum.BUSINESS.getCode());
        dict.setParentId(DefValConstants.PARENT_ID);
        superManager.save(dict);
        return dict;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteDict(List<Long> ids) {
        List<BaseDict> list = superManager.listByIds(ids);
        if (CollUtil.isEmpty(list)) {
            return false;
        }
        if (CollUtil.isNotEmpty(ids)) {
            superManager.remove(Wraps.<BaseDict>lbQ().in(BaseDict::getParentId, ids));
        }
        boolean flag = removeByIds(ids);
        CacheHashKey[] typeKeys = list.stream().map(type -> BaseDictCacheKeyBuilder.builder(type.getKey())).toArray(CacheHashKey[]::new);
        cachePlusOps.del(typeKeys);
        return flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public <UpdateVO> BaseDict updateById(UpdateVO updateVO) {
        BaseDictUpdateVO dictUpdateVO = (BaseDictUpdateVO) updateVO;
        BaseDict dict = BeanPlusUtil.toBean(dictUpdateVO, BaseDict.class);
        dict.setParentId(DefValConstants.PARENT_ID);
        superManager.updateById(dict);
        return dict;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean saveDictAndItem(DefDict defDict, List<DefDict> itemList) {
        BaseDict baseDict = BeanUtil.toBean(defDict, BaseDict.class);
        boolean flag = superManager.save(baseDict);
        if (!itemList.isEmpty()) {
            List<BaseDict> baseItemList = new ArrayList<>();
            itemList.forEach(item -> {
                BaseDict baseItem = new BaseDict();
                BeanUtil.copyProperties(item, baseItem);
                baseItem.setParentId(baseDict.getId());
                baseItemList.add(baseItem);
            });

            superManager.saveBatch(baseItemList);

            // 删除
            cachePlusOps.del(BaseDictCacheKeyBuilder.builder(defDict.getKey()));

            baseItemList.forEach(item -> {
                CacheHashKey hashKey = BaseDictCacheKeyBuilder.builder(item.getParentKey(), item.getKey());
                cachePlusOps.hSet(hashKey, item);
            });
        }
        return flag;
    }
}