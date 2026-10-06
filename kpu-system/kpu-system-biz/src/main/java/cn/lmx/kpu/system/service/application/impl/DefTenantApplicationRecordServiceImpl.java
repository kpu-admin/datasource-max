package cn.lmx.kpu.system.service.application.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.common.constant.DsConstant;
import cn.lmx.kpu.system.entity.application.DefTenantApplicationRecord;
import cn.lmx.kpu.system.manager.application.DefTenantApplicationRecordManager;
import cn.lmx.kpu.system.service.application.DefTenantApplicationRecordService;

/**
 * <p>
 * 业务实现类
 * 租户应用授权记录
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
@DS(DsConstant.DEFAULTS)
public class DefTenantApplicationRecordServiceImpl extends SuperServiceImpl<DefTenantApplicationRecordManager, Long, DefTenantApplicationRecord>
        implements DefTenantApplicationRecordService {
}
