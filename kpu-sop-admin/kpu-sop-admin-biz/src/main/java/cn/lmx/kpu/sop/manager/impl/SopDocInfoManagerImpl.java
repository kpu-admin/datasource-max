package cn.lmx.kpu.sop.manager.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.sop.entity.SopDocInfo;
import cn.lmx.kpu.sop.manager.SopDocInfoManager;
import cn.lmx.kpu.sop.mapper.SopDocInfoMapper;

/**
 * <p>
 * 通用业务实现类
 * 文档信息
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SopDocInfoManagerImpl extends SuperManagerImpl<SopDocInfoMapper, SopDocInfo> implements SopDocInfoManager {


}


