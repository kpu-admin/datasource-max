package cn.lmx.kpu.system.vo.save.tenant;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import cn.lmx.kpu.model.enumeration.system.TenantConnectTypeEnum;

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
@Schema(title = "DefTenantInitVO", description = "初始化租户")
public class DefTenantInitVO {
    @Schema(description = "企业ID")
    @NotNull(message = "ID不能为空")
    private Long id;

    /**
     * LOCAL： 同一个数据库(物理)，链接不同的数据库实例. 从database.yml中读取master数据源来自动新增其他数据库
     * REMOTE： 不同的数据库(物理)，需要先在DatasourceConfig表配置链接源信息，然后指定以下字段（xxxDatasource）
     */
    @Schema(description = "连接类型", example = "SYSTEM,CUSTOM")
    @NotNull(message = "连接类型不能为空")
    private TenantConnectTypeEnum connectType;

    /**
     * 数据源id
     */
    @Schema(description = "基础库数据源配置")
    private Long baseDatasourceId;
    @Schema(description = "扩展库数据源配置")
    private Long extendDatasourceId;

}
