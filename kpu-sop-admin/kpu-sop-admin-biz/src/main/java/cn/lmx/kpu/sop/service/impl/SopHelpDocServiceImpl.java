package cn.lmx.kpu.sop.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.entity.SopHelpDoc;
import cn.lmx.kpu.sop.manager.SopHelpDocManager;
import cn.lmx.kpu.sop.service.SopHelpDocService;

/**
 * <p>
 * 业务实现类
 * 帮助内容
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class SopHelpDocServiceImpl extends SuperServiceImpl<SopHelpDocManager, Long, SopHelpDoc> implements SopHelpDocService {


}


