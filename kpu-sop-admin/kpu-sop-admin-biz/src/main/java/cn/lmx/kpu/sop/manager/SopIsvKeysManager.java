package cn.lmx.kpu.sop.manager;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.kpu.sop.entity.SopIsvKeys;
import cn.lmx.kpu.sop.event.ChangeIsvKeyEvent;

import java.util.Collections;

/**
 * <p>
 * 通用业务接口
 * ISV秘钥管理
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopIsvKeysManager extends SuperManager<SopIsvKeys> {

    default void sendChangeEvent(Long isvId) {
        SpringUtils.publishEvent(new ChangeIsvKeyEvent(Collections.singletonList(isvId)));
    }

}


