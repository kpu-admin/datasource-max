package cn.lmx.kpu.base.biz.system;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.kpu.base.entity.system.BaseRole;
import cn.lmx.kpu.base.service.system.BaseRoleService;
import cn.lmx.kpu.model.enumeration.base.RoleCategoryEnum;
import cn.lmx.kpu.model.enumeration.system.DataTypeEnum;
import cn.lmx.kpu.system.manager.application.DefTenantResourceRelManager;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */

@Service
@RequiredArgsConstructor
public class BaseRoleBiz {
    private final BaseRoleService baseRoleService;
    private final DefTenantResourceRelManager defTenantResourceRelManager;

    /**
     * 查询角色拥有的资源
     * 1. 系统管理员 拥有该租户下的所有资源
     * 2. 其他管理员 拥有分配给他的资源
     *
     * @param roleId 角色ID
     * @return java.util.Map<java.lang.Long, java.util.Collection < java.lang.Long>>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00] [lmx] [初始创建]
     */
    public Map<Long, Collection<Long>> findResourceIdByRoleId(Long roleId) {
        BaseRole baseRole = baseRoleService.getById(roleId);
        if (baseRole == null) {
            return Collections.emptyMap();
        }
//        系统管理员有全部权限(管理员在 base_role_resource_rel 表无数据)
        if (DataTypeEnum.SYSTEM.eq(baseRole.getType())) {
            return defTenantResourceRelManager.findResourceIdByTenantId(ContextUtil.getTenantId());
        }

        return baseRoleService.findResourceIdByRoleId(roleId, RoleCategoryEnum.FUNCTION);
    }
}
