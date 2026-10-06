package cn.lmx.kpu.system.manager.tenant;

import cn.lmx.basic.base.manager.SuperCacheManager;
import cn.lmx.kpu.system.entity.tenant.DefUserTenantRel;
import cn.lmx.kpu.system.vo.result.tenant.DefUserTenantRelResultVO;

import java.util.List;

/**
 * <p>
 * 通用业务接口
 * 员工
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface DefUserTenantRelManager extends SuperCacheManager<DefUserTenantRel> {
    /**
     * 根据用户id查询员工
     *
     * @param userId 用户id
     * @return
     */
    List<DefUserTenantRelResultVO> listEmployeeByUserId(Long userId);
}
