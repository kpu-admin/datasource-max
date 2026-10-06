package cn.lmx.kpu.system.strategy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import cn.lmx.basic.database.properties.DatabaseProperties;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.kpu.system.vo.save.tenant.DefTenantInitVO;

import java.util.List;
import java.util.Map;

/**
 * 初始化系统上下文
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Component
public class InitSystemContext {
    @Autowired
    private Map<String, InitSystemStrategy> initSystemStrategyMap;
    @Autowired
    private DatabaseProperties databaseProperties;

    /**
     * 初始化链接
     *
     * @param tenantConnect 链接参数
     */
    public boolean initData(DefTenantInitVO tenantConnect) {
        InitSystemStrategy initSystemStrategy = getInitSystemStrategy();

        return initSystemStrategy.initData(tenantConnect);
    }

    private InitSystemStrategy getInitSystemStrategy() {
        InitSystemStrategy initSystemStrategy = initSystemStrategyMap.get(databaseProperties.getMultiTenantType().name());
        ArgumentAssert.notNull(initSystemStrategy, "您配置的租户模式:{}不可用", databaseProperties.getMultiTenantType().name());
        return initSystemStrategy;
    }

    /**
     * 重置系统
     *
     * @param tenant 租户编码
     */
    public boolean reset(String tenant) {
        InitSystemStrategy initSystemStrategy = getInitSystemStrategy();
        return initSystemStrategy.reset(tenant);
    }

    /**
     * 删除租户数据
     *
     * @param ids 租户id
     */
    public boolean delete(List<Long> ids) {
        InitSystemStrategy initSystemStrategy = getInitSystemStrategy();

        return initSystemStrategy.delete(ids);
    }
}
