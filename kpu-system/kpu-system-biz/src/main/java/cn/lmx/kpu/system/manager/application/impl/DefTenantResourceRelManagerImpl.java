package cn.lmx.kpu.system.manager.application.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.dynamic.datasource.annotation.DS;
import com.google.common.collect.Multimap;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.basic.cache.repository.CacheOps;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.query.LbQueryWrap;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.utils.CollHelper;
import cn.lmx.basic.utils.StrPool;
import cn.lmx.kpu.common.cache.tenant.tenant.TenantResourceCacheKeyBuilder;
import cn.lmx.kpu.common.constant.DsConstant;
import cn.lmx.kpu.system.entity.application.DefTenantResourceRel;
import cn.lmx.kpu.system.manager.application.DefTenantResourceRelManager;
import cn.lmx.kpu.system.mapper.application.DefTenantResourceRelMapper;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
public class DefTenantResourceRelManagerImpl extends SuperManagerImpl<DefTenantResourceRelMapper, DefTenantResourceRel> implements DefTenantResourceRelManager {
    private final CacheOps cacheOps;

    @Override
    @DS(DsConstant.DEFAULTS)
    public Map<Long, Collection<Long>> findResourceIdByTenantId(Long tenantId) {
        List<DefTenantResourceRel> list = list(Wraps.<DefTenantResourceRel>lbQ().eq(DefTenantResourceRel::getTenantId, tenantId));
        Multimap<Long, Long> map = CollHelper.iterableToMultiMap(list, DefTenantResourceRel::getApplicationId, DefTenantResourceRel::getResourceId);
        return map.asMap();
    }

    @Override
    public void deleteByTenantId(List<Long> ids) {
        if (CollUtil.isEmpty(ids)) {
            return;
        }
        LbQueryWrap<DefTenantResourceRel> wrap = Wraps.<DefTenantResourceRel>lbQ().in(DefTenantResourceRel::getTenantId, ids);
        List<DefTenantResourceRel> list = list(wrap);
        remove(wrap);

        List<CacheKey> keys = new ArrayList<>();
        Set<String> set = new HashSet<>();
        for (DefTenantResourceRel defTenantResourceRel : list) {
            String key = defTenantResourceRel.getTenantId() + StrPool.DOT + defTenantResourceRel.getApplicationId();
            if (!set.contains(key)) {
                keys.add(TenantResourceCacheKeyBuilder.builder(defTenantResourceRel.getTenantId(), defTenantResourceRel.getApplicationId()));
                set.add(key);
            }
        }
        cacheOps.del(keys);
        cacheOps.del(ids.stream().map(id -> TenantResourceCacheKeyBuilder.builder(id, null)).toArray(CacheKey[]::new));
    }
}
