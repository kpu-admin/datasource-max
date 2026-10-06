package cn.lmx.kpu.sop.manager.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.sop.entity.SopIsvKeys;
import cn.lmx.kpu.sop.manager.SopIsvKeysManager;
import cn.lmx.kpu.sop.mapper.SopIsvKeysMapper;

/**
 * <p>
 * 通用业务实现类
 * ISV秘钥管理
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SopIsvKeysManagerImpl extends SuperManagerImpl<SopIsvKeysMapper, SopIsvKeys> implements SopIsvKeysManager {

}


