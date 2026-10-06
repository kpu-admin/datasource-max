package cn.lmx.kpu.system.manager.application;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.system.entity.application.DefTenantApplicationRel;

import java.util.List;

/**
 * <p>
 * 通用业务层
 * 租户的应用
 * </p>
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
public interface DefTenantApplicationRelManager extends SuperManager<DefTenantApplicationRel> {
    /**
     * 给指定租户授权 公共应用
     *
     * @param tenantId 租户id
     */
    void grantGeneralApplication(Long tenantId);


    /**
     * 查询员工拥有的应用
     *
     * @param employeeId 员工id
     * @return
     */
    List<Long> findApplicationByEmployeeId(Long employeeId);

    /**
     * 删除指定租户的应用
     *
     * @param ids ids
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00] [lmx] [初始创建]
     */
    void deleteByTenantId(List<Long> ids);
}
