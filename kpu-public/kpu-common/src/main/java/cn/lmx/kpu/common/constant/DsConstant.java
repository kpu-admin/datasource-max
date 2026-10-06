package cn.lmx.kpu.common.constant;

import static cn.lmx.basic.context.ContextConstants.TENANT_BASE_POOL_NAME_HEADER;
import static cn.lmx.basic.context.ContextConstants.TENANT_EXTEND_POOL_NAME_HEADER;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
public interface DsConstant {
    /**
     * 默认数据源
     */
    String DEFAULTS = "0";
    /**
     * 动态租户数据源
     */
    String BASE_TENANT = "#thread." + TENANT_BASE_POOL_NAME_HEADER;
    String EXTEND_TENANT = "#thread." + TENANT_EXTEND_POOL_NAME_HEADER;
}
