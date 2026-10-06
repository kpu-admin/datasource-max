package cn.lmx.kpu.system.manager.application.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.system.entity.application.DefTenantApplicationRecord;
import cn.lmx.kpu.system.manager.application.DefTenantApplicationRecordManager;
import cn.lmx.kpu.system.mapper.application.DefTenantApplicationRecordMapper;

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
public class DefTenantApplicationRecordManagerImpl extends SuperManagerImpl<DefTenantApplicationRecordMapper, DefTenantApplicationRecord> implements DefTenantApplicationRecordManager {

}
