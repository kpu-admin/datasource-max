package cn.lmx.kpu.system.manager.application.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.manager.impl.SuperCacheManagerImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.query.LbQueryWrap;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.tenant.application.ResourceApiCacheKeyBuilder;
import cn.lmx.kpu.model.vo.result.ResourceApiVO;
import cn.lmx.kpu.system.entity.application.DefResourceApi;
import cn.lmx.kpu.system.manager.application.DefResourceApiManager;
import cn.lmx.kpu.system.mapper.application.DefResourceApiMapper;

import java.util.Collections;
import java.util.List;

/**
 * 应用管理
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
@RequiredArgsConstructor
@Service
@Slf4j
public class DefResourceApiManagerImpl extends SuperCacheManagerImpl<DefResourceApiMapper, DefResourceApi> implements DefResourceApiManager {
    @Override
    protected CacheKeyBuilder cacheKeyBuilder() {
        return new ResourceApiCacheKeyBuilder();
    }

    @Override
    public List<ResourceApiVO> findAllApi() {
        return baseMapper.findAllApi();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void removeByResourceId(List<Long> resourceIdList) {
        LbQueryWrap<DefResourceApi> wrap = Wraps.<DefResourceApi>lbQ().select(DefResourceApi::getId).in(DefResourceApi::getResourceId, resourceIdList);
        List<Long> apiIds = listObjs(wrap, Convert::toLong);
        remove(wrap);

        CacheKey[] keys = apiIds.stream().map(ResourceApiCacheKeyBuilder::builder).toArray(CacheKey[]::new);
        cacheOps.del(keys);

    }

    @Override
    public List<DefResourceApi> findByResourceId(Long resourceId) {
        if (resourceId == null) {
            return Collections.emptyList();
        }
        return list(Wraps.<DefResourceApi>lbQ().eq(DefResourceApi::getResourceId, resourceId));
    }

    @Override
    public List<DefResourceApi> findByResourceId(List<Long> resourceIds) {
        if (CollUtil.isEmpty(resourceIds)) {
            return Collections.emptyList();
        }
        return list(Wraps.<DefResourceApi>lbQ().in(DefResourceApi::getResourceId, resourceIds));
    }
}
