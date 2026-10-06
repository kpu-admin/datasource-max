package cn.lmx.kpu.system.biz.application;

import io.seata.spring.annotation.GlobalTransactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.kpu.system.entity.tenant.DefTenant;
import cn.lmx.kpu.system.service.application.DefResourceService;
import cn.lmx.kpu.system.service.tenant.DefTenantService;

import java.util.List;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class DefResourceBiz {
    private final DefResourceService defResourceService;
    private final DefTenantService defTenantService;


    @GlobalTransactional
    public boolean removeByIdWithCache(List<Long> ids) {
        boolean result = defResourceService.removeByIdWithCache(ids);

        // TODO 删除租户下的 角色资源关系表 员工资源关系表
        List<DefTenant> list = defTenantService.findNormalTenant();
        list.forEach(item -> {
            ContextUtil.setTenantBasePoolName(item.getId());
            defResourceService.deleteRoleResourceRelByResourceId(ids);
        });
        return result;
    }


}
