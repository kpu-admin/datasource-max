package cn.lmx.kpu.system.manager.tenant.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.system.entity.tenant.DefTenantDatasourceConfigRel;
import cn.lmx.kpu.system.manager.tenant.DefTenantDatasourceConfigRelManager;
import cn.lmx.kpu.system.mapper.tenant.DefTenantDatasourceConfigRelMapper;

/**
 * 应用管理
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
@RequiredArgsConstructor
@Service
public class DefTenantDatasourceConfigRelManagerImpl extends SuperManagerImpl<DefTenantDatasourceConfigRelMapper, DefTenantDatasourceConfigRel> implements DefTenantDatasourceConfigRelManager {

}
