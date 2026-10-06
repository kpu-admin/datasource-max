package cn.lmx.kpu.system.mapper.tenant;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.system.entity.tenant.DefUserTenantRel;
import cn.lmx.kpu.system.vo.result.tenant.DefUserTenantRelResultVO;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * 员工
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Repository
@InterceptorIgnore(tenantLine = "true", dynamicTableName = "true")
public interface DefUserTenantRelMapper extends SuperMapper<DefUserTenantRel> {
    /**
     * 根据用户id查询员工
     *
     * @param userId 用户id
     * @return
     */
    List<DefUserTenantRelResultVO> listEmployeeByUserId(@Param("userId") Long userId);
}
