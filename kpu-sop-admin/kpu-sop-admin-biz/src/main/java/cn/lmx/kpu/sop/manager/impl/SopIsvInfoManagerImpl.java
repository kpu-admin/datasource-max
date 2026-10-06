package cn.lmx.kpu.sop.manager.impl;

import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.sop.entity.SopIsvInfo;
import cn.lmx.kpu.sop.manager.SopIsvInfoManager;
import cn.lmx.kpu.sop.mapper.SopIsvInfoMapper;

/**
 * <p>
 * 通用业务实现类
 * isv信息表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SopIsvInfoManagerImpl extends SuperManagerImpl<SopIsvInfoMapper, SopIsvInfo> implements SopIsvInfoManager {
    @Override
    public SopIsvInfo getIsvByAppId(String appId) {
        if (StrUtil.isEmpty(appId)) {
            return null;
        }
        return getOne(Wraps.<SopIsvInfo>lbQ().eq(SopIsvInfo::getAppId, appId), false);
    }

    @Override
    public String getPrivatePlatformKey(String appId) {
        return baseMapper.getPrivatePlatformKey(appId);
    }
}


