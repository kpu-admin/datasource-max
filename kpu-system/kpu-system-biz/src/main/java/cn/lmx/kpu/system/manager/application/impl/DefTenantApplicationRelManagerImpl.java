package cn.lmx.kpu.system.manager.application.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.basic.cache.redis2.CacheResult;
import cn.lmx.basic.cache.repository.CacheOps;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.kpu.common.cache.tenant.tenant.TenantApplicationCacheKeyBuilder;
import cn.lmx.kpu.system.entity.application.DefApplication;
import cn.lmx.kpu.system.entity.application.DefResource;
import cn.lmx.kpu.system.entity.application.DefTenantApplicationRel;
import cn.lmx.kpu.system.entity.application.DefTenantResourceRel;
import cn.lmx.kpu.system.entity.tenant.DefUserTenantRel;
import cn.lmx.kpu.system.manager.application.DefApplicationManager;
import cn.lmx.kpu.system.manager.application.DefResourceManager;
import cn.lmx.kpu.system.manager.application.DefTenantApplicationRelManager;
import cn.lmx.kpu.system.manager.application.DefTenantResourceRelManager;
import cn.lmx.kpu.system.manager.tenant.DefUserTenantRelManager;
import cn.lmx.kpu.system.mapper.application.DefTenantApplicationRelMapper;

import java.time.LocalDateTime;
import java.util.ArrayList;
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
public class DefTenantApplicationRelManagerImpl extends SuperManagerImpl<DefTenantApplicationRelMapper, DefTenantApplicationRel> implements DefTenantApplicationRelManager {
    private final DefApplicationManager defApplicationManager;
    private final DefResourceManager defResourceManager;
    private final DefTenantResourceRelManager defTenantResourceRelManager;
    private final DefUserTenantRelManager defUserTenantRelManager;
    private final CacheOps cacheOps;

    @Override
    public void grantGeneralApplication(Long tenantId) {
        List<DefApplication> list = defApplicationManager.findGeneral();
        if (CollUtil.isEmpty(list)) {
            return;
        }
        List<Long> applicationIds = new ArrayList<>();
        List<DefTenantApplicationRel> tarList = list.stream().map(application -> {
            DefTenantApplicationRel tar = new DefTenantApplicationRel();
            tar.setTenantId(tenantId);
            tar.setApplicationId(application.getId());
            applicationIds.add(application.getId());
            return tar;
        }).toList();
        saveBatch(tarList);

        List<DefResource> resourceList = defResourceManager.findByApplicationId(applicationIds);
        if (CollUtil.isEmpty(resourceList)) {
            return;
        }
        List<DefTenantResourceRel> trrList = resourceList.stream().map(resource -> {
            DefTenantResourceRel trr = new DefTenantResourceRel();
            trr.setTenantId(tenantId);
            trr.setApplicationId(resource.getApplicationId());
            trr.setResourceId(resource.getId());
            return trr;
        }).toList();
        defTenantResourceRelManager.saveBatch(trrList);
    }


    @Override
    public List<Long> findApplicationByEmployeeId(Long employeeId) {
        DefUserTenantRel employee = defUserTenantRelManager.getByIdCache(employeeId);
        ArgumentAssert.notNull(employee, "用户不存在");
        Long tenantId = employee.getTenantId();
        CacheKey key = TenantApplicationCacheKeyBuilder.builder(tenantId);
        CacheResult<List<Long>> applicationIds = cacheOps.get(key, k -> listObjs(
                Wraps.<DefTenantApplicationRel>lbQ().select(DefTenantApplicationRel::getApplicationId)
                        .eq(DefTenantApplicationRel::getTenantId, tenantId)
                        .and(w ->
                                w.gt(DefTenantApplicationRel::getExpirationTime, LocalDateTime.now()).or().isNull(DefTenantApplicationRel::getExpirationTime)
                        ), Convert::toLong));
        return applicationIds.asList();
    }

    @Override
    public void deleteByTenantId(List<Long> ids) {
        if (CollUtil.isEmpty(ids)) {
            return;
        }
        remove(Wraps.<DefTenantApplicationRel>lbQ().in(DefTenantApplicationRel::getTenantId, ids));

        cacheOps.del(ids.stream().map(TenantApplicationCacheKeyBuilder::builder).toList());
    }
}
