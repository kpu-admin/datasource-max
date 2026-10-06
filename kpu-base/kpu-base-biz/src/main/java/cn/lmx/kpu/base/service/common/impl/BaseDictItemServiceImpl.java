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
import cn.lmx.kpu.base.entity.common.BaseDict;
import cn.lmx.kpu.base.manager.common.BaseDictManager;
import cn.lmx.kpu.base.service.common.BaseDictItemService;
import cn.lmx.kpu.base.vo.save.common.BaseDictItemSaveVO;
import cn.lmx.kpu.base.vo.update.common.BaseDictItemUpdateVO;
import cn.lmx.kpu.common.cache.base.common.BaseDictCacheKeyBuilder;
import cn.lmx.kpu.common.constant.DsConstant;
import cn.lmx.kpu.model.enumeration.system.DictClassifyEnum;

import java.util.Collection;
import java.util.List;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
@DS(DsConstant.BASE_TENANT)
public class BaseDictItemServiceImpl extends SuperServiceImpl<BaseDictManager, Long, BaseDict> implements BaseDictItemService {

    private final CachePlusOps cachePlusOps;

    @Override
    public boolean checkItemByKey(String key, Long dictId, Long id) {
        ArgumentAssert.notEmpty(key, "请填写字典项标识");
        ArgumentAssert.notNull(dictId, "字典不能为空");
        return superManager.count(Wraps.<BaseDict>lbQ().eq(BaseDict::getKey, key)
                .eq(BaseDict::getParentId, dictId).ne(BaseDict::getId, id)) > 0;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public <SaveVO> BaseDict save(SaveVO saveVO) {
        BaseDictItemSaveVO itemSaveVO = (BaseDictItemSaveVO) saveVO;
        BaseDict model = BeanUtil.toBean(itemSaveVO, BaseDict.class);
        ArgumentAssert.isFalse(checkItemByKey(model.getKey(), model.getParentId(), null), "字典[{}]已经存在，请勿重复创建", model.getKey());
        BaseDict parent = getById(model.getParentId());
        ArgumentAssert.notNull(parent, "字典不存在");
        model.setParentKey(parent.getKey());
        model.setClassify(DictClassifyEnum.BUSINESS.getCode());
        superManager.save(model);
        CacheHashKey hashKey = BaseDictCacheKeyBuilder.builder(model.getParentKey(), model.getKey());
        cachePlusOps.hSet(hashKey, model);
        return model;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public <UpdateVO> BaseDict updateById(UpdateVO updateVO) {
        BaseDictItemUpdateVO itemUpdateVO = (BaseDictItemUpdateVO) updateVO;
        BaseDict model = BeanUtil.toBean(itemUpdateVO, BaseDict.class);
        BaseDict parent = getById(model.getParentId());
        ArgumentAssert.notNull(parent, "字典不存在");
        model.setParentKey(parent.getKey());
        superManager.updateById(model);
        CacheHashKey hashKey = BaseDictCacheKeyBuilder.builder(model.getParentKey(), model.getKey());
        cachePlusOps.hSet(hashKey, model);
        return model;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean removeByIds(Collection<Long> idList) {
        List<BaseDict> list = superManager.listByIds(idList);
        if (CollUtil.isEmpty(list)) {
            return false;
        }
        boolean flag = superManager.removeByIds(idList);

        CacheHashKey[] hashKeys = list.stream().map(model -> BaseDictCacheKeyBuilder.builder(model.getParentKey(), model.getKey())).toArray(CacheHashKey[]::new);
        cachePlusOps.del(hashKeys);
        return flag;
    }

}
