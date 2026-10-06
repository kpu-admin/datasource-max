package cn.lmx.kpu.sop.manager;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.kpu.sop.entity.SopPermGroup;
import cn.lmx.kpu.sop.event.ChangeIsvPermEvent;

import java.util.Collections;

/**
 * <p>
 * 通用业务接口
 * 分组表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopPermGroupManager extends SuperManager<SopPermGroup> {
    default void sendChangeEvent(Long isvId) {
        SpringUtils.publishEvent(new ChangeIsvPermEvent(Collections.singletonList(isvId)));
    }
}


