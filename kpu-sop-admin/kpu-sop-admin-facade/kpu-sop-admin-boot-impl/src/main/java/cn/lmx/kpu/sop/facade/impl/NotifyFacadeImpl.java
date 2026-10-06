package cn.lmx.kpu.sop.facade.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.sop.dto.NotifyRequest;
import cn.lmx.kpu.sop.facade.NotifyFacade;
import cn.lmx.kpu.sop.service.NotifyService;

/**
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Service
@RequiredArgsConstructor
public class NotifyFacadeImpl implements NotifyFacade {
    private final NotifyService notifyService;

    @Override
    public R<Long> notify(NotifyRequest request) {
        return notifyService.notify(request);
    }
}
