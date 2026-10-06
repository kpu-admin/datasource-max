package cn.lmx.kpu.sop.manager.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.sop.entity.SopNotifyInfo;
import cn.lmx.kpu.sop.manager.SopNotifyInfoManager;
import cn.lmx.kpu.sop.mapper.SopNotifyInfoMapper;

/**
 * <p>
 * 通用业务实现类
 * 回调信息
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SopNotifyInfoManagerImpl extends SuperManagerImpl<SopNotifyInfoMapper, SopNotifyInfo> implements SopNotifyInfoManager {
}


