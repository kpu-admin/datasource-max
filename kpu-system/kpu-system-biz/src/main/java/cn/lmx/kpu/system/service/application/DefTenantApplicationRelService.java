package cn.lmx.kpu.system.service.application;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.model.entity.system.SysUser;
import cn.lmx.kpu.system.entity.application.DefTenantApplicationRel;
import cn.lmx.kpu.system.vo.result.application.DefTenantApplicationRelResultVO;
import cn.lmx.kpu.system.vo.save.application.DefTenantApplicationRelSaveVO;
import cn.lmx.kpu.system.vo.update.application.DefTenantApplicationRelUpdateVO;

import java.util.List;

/**
 * <p>
 * 业务接口
 * 租户的应用
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface DefTenantApplicationRelService extends SuperService<Long, DefTenantApplicationRel> {
    /**
     * 授权
     *
     * @param saveVO  saveVO
     * @param sysUser 系统用户信息
     * @return java.lang.Boolean
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00] [lmx] [初始创建]
     */
    Boolean grant(DefTenantApplicationRelSaveVO saveVO, SysUser sysUser);

    /**
     * 取消授权
     *
     * @param ids     ids
     * @param sysUser 系统用户信息
     * @return java.lang.Boolean
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00] [lmx] [初始创建]
     */
    Boolean cancel(List<Long> ids, SysUser sysUser);

    /**
     * 续期
     *
     * @param updateVO updateVO
     * @param sysUser  系统用户信息
     * @return java.lang.Boolean
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00] [lmx] [初始创建]
     */
    Boolean renewal(DefTenantApplicationRelUpdateVO updateVO, SysUser sysUser);

    /**
     * 查询授权信息
     *
     * @param id id
     * @return cn.lmx.kpu.tenant.vo.result.tenant.DefTenantApplicationRelResultVO
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00] [lmx] [初始创建]
     */
    DefTenantApplicationRelResultVO getDetailById(Long id);
}
