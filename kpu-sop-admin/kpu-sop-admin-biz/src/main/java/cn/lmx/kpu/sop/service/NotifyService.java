package cn.lmx.kpu.sop.service;

import cn.lmx.basic.base.R;
import cn.lmx.kpu.sop.dto.NotifyRequest;

import java.time.LocalDateTime;

/**
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
public interface NotifyService {
    /**
     * 回调重试
     * @param now 当前时间
     */
    void retry(LocalDateTime now);

    /**
     * 第一次回调
     *
     * @param request 回调内容
     * @return 返回回调id
     */
    R<Long> notify(NotifyRequest request);
    /**
     * 回调立即发送
     *
     * @param notifyId notifyId
     * @return 返回结果
     */
    Long notifyImmediately(Long notifyId);
}
