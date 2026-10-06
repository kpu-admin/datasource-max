package cn.lmx.kpu.system.manager.tenant;

import cn.lmx.basic.base.manager.SuperCacheManager;
import cn.lmx.basic.interfaces.echo.LoadService;
import cn.lmx.kpu.system.entity.tenant.DefTenant;
import cn.lmx.kpu.system.vo.result.tenant.DefTenantResultVO;

import java.util.List;

/**
 * <p>
 * 通用业务层
 * 企业
 * </p>
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
public interface DefTenantManager extends SuperCacheManager<DefTenant>, LoadService {
    /**
     * 查询所有可用的租户
     *
     * @return
     */
    List<DefTenant> listNormal();

    /**
     * 查询用户的可用企业
     *
     * @param userId 用户id
     * @return
     */
    List<DefTenantResultVO> listTenantByUserId(Long userId);
}
