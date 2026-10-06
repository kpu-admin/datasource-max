package cn.lmx.kpu.sop.facade.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.sop.api.NotifyApi;
import cn.lmx.kpu.sop.dto.NotifyRequest;
import cn.lmx.kpu.sop.facade.NotifyFacade;

/**
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Service
public class NotifyFacadeImpl implements NotifyFacade {
    @Autowired
    @Lazy
    private NotifyApi notifyApi;

    @Override
    public R<Long> notify(NotifyRequest request) {
        return notifyApi.notify(request);
    }
}
