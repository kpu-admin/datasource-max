package cn.lmx.kpu.system.mapper.application;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.system.entity.application.DefTenantResourceRel;

/**
 * <p>
 * Mapper 接口
 * 租户的资源
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Repository
@InterceptorIgnore(tenantLine = "true", dynamicTableName = "true")
public interface DefTenantResourceRelMapper extends SuperMapper<DefTenantResourceRel> {

}
