package cn.lmx.kpu.sop.manager;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.kpu.sop.entity.SopIsvInfo;
import cn.lmx.kpu.sop.event.ChangeIsvInfoEvent;

import java.util.Collection;
import java.util.Collections;

/**
 * <p>
 * 通用业务接口
 * isv信息表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopIsvInfoManager extends SuperManager<SopIsvInfo> {
    default void sendChangeEvent(Long isvId) {
        SpringUtils.publishEvent(new ChangeIsvInfoEvent(Collections.singletonList(isvId)));
    }

    default void sendChangeEvent(Collection<Long> isvIds) {
        SpringUtils.publishEvent(new ChangeIsvInfoEvent(isvIds));
    }

    SopIsvInfo getIsvByAppId(String appId);

    /**
     * 获取平台密钥
     *
     * @param appId 应用唯一标识
     * @return 密钥
     */
    String getPrivatePlatformKey(String appId);
}


