package cn.lmx.kpu.system.mapper.tenant;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.system.entity.tenant.DefTenant;
import cn.lmx.kpu.system.vo.result.tenant.DefTenantResultVO;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * 企业
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Repository
@InterceptorIgnore(tenantLine = "true", dynamicTableName = "true")
public interface DefTenantMapper extends SuperMapper<DefTenant> {
    /**
     * 查询用户的可用企业
     *
     * @param userId 用户id
     * @return
     */
    List<DefTenantResultVO> listTenantByUserId(@Param("userId") Long userId);
}
