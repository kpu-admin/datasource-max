package cn.lmx.kpu.system.vo.save.tenant;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 租户连接
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@Builder
@Schema(title = "DefTenantServiceInitVO", description = "初始化租户服务")
public class DefTenantServiceInitVO {
    /**
     * 数据源id
     */
    private Long datasourceConfigId;

    /**
     * 库前缀
     */
    private String database;
}
