package cn.lmx.kpu.system.strategy;

import cn.lmx.kpu.system.vo.save.tenant.DefTenantInitVO;

import java.util.List;

/**
 * 初始化系统
 * <p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface InitSystemStrategy {

    /**
     * 初始化 服务链接
     *
     * @param tenantConnect 链接信息
     * @return 是否成功
     */
    boolean initData(DefTenantInitVO tenantConnect);

    /**
     * 重置系统
     *
     * @param tenant 租户编码
     * @return 是否成功
     */
    boolean reset(String tenant);

    /**
     * 删除租户数据
     *
     * @param ids 租户id
     * @return 是否成功
     */
    boolean delete(List<Long> ids);
}
