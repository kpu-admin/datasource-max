package cn.lmx.kpu.sop.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.entity.SopDocContent;
import cn.lmx.kpu.sop.manager.SopDocContentManager;
import cn.lmx.kpu.sop.service.SopDocContentService;

/**
 * <p>
 * 业务实现类
 * 文档内容
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
public class SopDocContentServiceImpl extends SuperServiceImpl<SopDocContentManager, Long, SopDocContent> implements SopDocContentService {


}


