package cn.lmx.kpu.sop.facade;

import cn.lmx.basic.base.R;
import cn.lmx.kpu.sop.dto.NotifyRequest;

/**
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
public interface NotifyFacade {
    /**
     * 回调
     *
     * @param request 参数
     * @return 返回结果 回调ID
     */
    R<Long> notify(NotifyRequest request);
}
