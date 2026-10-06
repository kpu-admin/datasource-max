package cn.lmx.kpu.system.manager.application.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperCacheManagerImpl;
import cn.lmx.basic.cache.redis2.CacheResult;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.query.LbQueryWrap;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.basic.utils.TreeUtil;
import cn.lmx.kpu.common.cache.tenant.application.ResourceCacheKeyBuilder;
import cn.lmx.kpu.common.cache.tenant.tenant.TenantResourceCacheKeyBuilder;
import cn.lmx.kpu.system.entity.application.DefResource;
import cn.lmx.kpu.system.entity.application.DefTenantResourceRel;
import cn.lmx.kpu.system.manager.application.DefResourceManager;
import cn.lmx.kpu.system.manager.application.DefTenantResourceRelManager;
import cn.lmx.kpu.system.mapper.application.DefResourceMapper;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.function.Function;

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
public class DefResourceManagerImpl extends SuperCacheManagerImpl<DefResourceMapper, DefResource> implements DefResourceManager {

    private final DefTenantResourceRelManager defTenantResourceRelManager;

    @Override
    protected CacheKeyBuilder cacheKeyBuilder() {
        return new ResourceCacheKeyBuilder();
    }

    @Override
    public List<DefResource> findResourceListByTenantIdAndApplicationIds(Long tenantId, List<Long> applicationIdList, final Collection<String> resourceTypeList) {
        Set<Long> resourceIdSet = new HashSet<>();
        if (CollUtil.isEmpty(applicationIdList)) {
            LbQueryWrap<DefTenantResourceRel> wrap = Wraps.<DefTenantResourceRel>lbQ().select(DefTenantResourceRel::getResourceId).eq(DefTenantResourceRel::getTenantId, tenantId);
            CacheKey cacheKey = TenantResourceCacheKeyBuilder.builder(tenantId, null);
            CacheResult<List<Long>> resourceResults = cacheOps.get(cacheKey, k -> defTenantResourceRelManager.listObjs(wrap, Convert::toLong));
            resourceIdSet.addAll(resourceResults.asList());
        } else {
            // 新旧方法
            // 旧方法
//            for (Long applicationId : applicationIdList) {
//                CacheResult<List<Long>> resourceResults = getTenantResourceIdList(tenantId, applicationId);
//                resourceIdSet.addAll(resourceResults.asList());
//            }

            // 新方法
            resourceIdSet = addTenantApplicationResourceIdList(tenantId, applicationIdList);
        }

        return findByIdsAndType(resourceIdSet, resourceTypeList);
    }

    private Set<Long> addTenantApplicationResourceIdList(Long tenantId, List<Long> applicationIdList) {
        // 版本1
        /*List<CacheKey> cacheKeys = applicationIdList.stream().map(applicationId -> TenantResourceCacheKeyBuilder.builder(tenantId, applicationId)).toList();
        List<CacheResult<List<Long>>> resultList = cacheOps.find(cacheKeys);

        for (int i = 0; i < resultList.size(); i++) {
            CacheResult<List<Long>> result = resultList.get(i);
            List<Long> trIds = result.asList();
            if (result.isNull()) {
                Long applicationId = applicationIdList.get(i);
                LbQueryWrap<DefTenantResourceRel> wrap = Wraps.<DefTenantResourceRel>lbQ().select(DefTenantResourceRel::getResourceId)
                        .eq(DefTenantResourceRel::getTenantId, tenantId).eq(DefTenantResourceRel::getApplicationId, applicationId);
                List<Long> trIdList = defTenantResourceRelManager.listObjs(wrap, Convert::toLong);

                if (CollUtil.isNotEmpty(trIdList)) {
                    CacheKey cacheKey = cacheKeys.get(i);
                    cacheOps.set(cacheKey, trIdList);
                }
                trIds = trIdList;
            }

            resourceIdSet.addAll(trIds);
        }*/
        // 版本1 end


        // 版本2
        // 生成key的回调
        Function<Long, CacheKey> cacheBuilder = applicationId -> TenantResourceCacheKeyBuilder.builder(tenantId, applicationId);

        // 缓存中不存在时，回调函数
        Function<Long, List<Long>> loader = applicationId -> {
            LbQueryWrap<DefTenantResourceRel> wrap = Wraps.<DefTenantResourceRel>lbQ().select(DefTenantResourceRel::getResourceId)
                    .eq(DefTenantResourceRel::getTenantId, tenantId).eq(DefTenantResourceRel::getApplicationId, applicationId);
            return defTenantResourceRelManager.listObjs(wrap, Convert::toLong);
        };
        return findCollectByIds(applicationIdList, cacheBuilder, loader);
        // 版本2 end
    }


    private CacheResult<List<Long>> getTenantResourceIdList(Long tenantId, Long applicationId) {
        LbQueryWrap<DefTenantResourceRel> wrap = Wraps.<DefTenantResourceRel>lbQ().select(DefTenantResourceRel::getResourceId)
                .eq(DefTenantResourceRel::getTenantId, tenantId).eq(DefTenantResourceRel::getApplicationId, applicationId);
        CacheKey cacheKey = TenantResourceCacheKeyBuilder.builder(tenantId, applicationId);
        CacheResult<List<Long>> resourceResults = cacheOps.get(cacheKey, k -> defTenantResourceRelManager.listObjs(wrap, Convert::toLong));
        return resourceResults;
    }

    @Override
    public List<DefResource> findByIdsAndType(Long tenantId, Long applicationId, Collection<Long> idList, Collection<String> types) {
        // 查询租户拥有的资源
        CacheResult<List<Long>> resourceResults = getTenantResourceIdList(tenantId, applicationId);
        List<Long> tenantResourceIdList = resourceResults.asList();

        // 租户拥有的资源 和 角色拥有的资源 取交集 （应用资源取消授权时，没有淘汰角色拥有的资源）
        Collection<Long> intersection = CollUtil.intersection(tenantResourceIdList, new ArrayList<>(idList));

        List<DefResource> list = findByIds(intersection, null);
        return list.stream()
                // 过滤数据状态
                .filter(Objects::nonNull).filter(DefResource::getState).filter(item -> !CollUtil.isNotEmpty(types) || (CollUtil.contains(types, item.getResourceType())))
                // 按sortValue排序，null排在最后
                .sorted(Comparator.comparing(DefResource::getSortValue, Comparator.nullsLast(Integer::compareTo))).toList();
    }


    @Override
    public List<DefResource> findByIdsAndType(Collection<? extends Serializable> idList, Collection<String> types) {
        List<DefResource> list = findByIds(idList, null);
        return list.stream()
                // 过滤数据状态
                .filter(Objects::nonNull).filter(DefResource::getState).filter(item -> !CollUtil.isNotEmpty(types) || (CollUtil.contains(types, item.getResourceType())))
                // 按sortValue排序，null排在最后
                .sorted(Comparator.comparing(DefResource::getSortValue, Comparator.nullsLast(Integer::compareTo))).toList();
    }

    @Override
    public int deleteRoleResourceRelByResourceId(List<Long> resourceIds) {
        return baseMapper.deleteRoleResourceRelByResourceId(resourceIds);
    }

    @Override
    public Integer maxSortValueByParentIdAndApplicationId(Long parentId, Long applicationId) {
        return baseMapper.maxSortValueByParentIdAndApplicationId(parentId, applicationId);
    }

    @Override
    public Integer maxSortValueByTypeAndParentIdAndApplicationId(List<String> types, Long parentId, Long applicationId) {
        return baseMapper.maxSortValueByTypeAndParentIdAndApplicationId(types, parentId, applicationId);

    }

    @Override
    public List<DefResource> findByApplicationId(List<Long> applicationIds) {
        ArgumentAssert.notEmpty(applicationIds, "applicationIds 不能为空");
        return list(Wraps.<DefResource>lbQ().in(DefResource::getApplicationId, applicationIds).orderByAsc(DefResource::getSortValue));
    }

    @Override
    public List<DefResource> findChildrenByParentId(Long parentId) {
        ArgumentAssert.notNull(parentId, "parentId 不能为空");
        return list(Wraps.<DefResource>lbQ().in(DefResource::getParentId, parentId).orderByAsc(DefResource::getSortValue));
    }

    @Override
    public List<DefResource> findAllChildrenByParentId(Long parentId) {
        ArgumentAssert.notNull(parentId, "parentId 不能为空");
        return list(Wraps.<DefResource>lbQ().like(DefResource::getTreePath, TreeUtil.buildTreePath(parentId)).orderByAsc(DefResource::getSortValue));
    }


}
