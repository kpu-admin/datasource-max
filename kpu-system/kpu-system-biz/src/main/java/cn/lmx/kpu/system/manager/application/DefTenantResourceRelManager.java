package cn.lmx.kpu.system.manager.application;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.system.entity.application.DefTenantResourceRel;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 通用业务层
 * 租户的资源
 * </p>
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
public interface DefTenantResourceRelManager extends SuperManager<DefTenantResourceRel> {
    /**
     * 查询指定企业的应用和资源
     *
     * @param tenantId 企业id
     * @return
     */
    Map<Long, Collection<Long>> findResourceIdByTenantId(Long tenantId);

    /**
     * 删除指定租户的资源
     *
     * @param ids ids
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00] [lmx] [初始创建]
     */
    void deleteByTenantId(List<Long> ids);
}
