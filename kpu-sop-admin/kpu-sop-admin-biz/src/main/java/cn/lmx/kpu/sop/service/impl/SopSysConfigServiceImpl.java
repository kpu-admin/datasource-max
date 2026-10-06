package cn.lmx.kpu.sop.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.entity.SopSysConfig;
import cn.lmx.kpu.sop.manager.SopSysConfigManager;
import cn.lmx.kpu.sop.service.SopSysConfigService;

/**
 * <p>
 * 业务实现类
 * 系统配置表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class SopSysConfigServiceImpl extends SuperServiceImpl<SopSysConfigManager, Long, SopSysConfig> implements SopSysConfigService {


}


