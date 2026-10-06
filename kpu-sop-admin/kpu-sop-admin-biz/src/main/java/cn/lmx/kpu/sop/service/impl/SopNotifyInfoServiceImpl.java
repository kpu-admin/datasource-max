package cn.lmx.kpu.sop.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.update.LbUpdateWrap;
import cn.lmx.kpu.sop.entity.SopNotifyInfo;
import cn.lmx.kpu.sop.enums.NotifyStatusEnum;
import cn.lmx.kpu.sop.manager.SopNotifyInfoManager;
import cn.lmx.kpu.sop.service.NotifyService;
import cn.lmx.kpu.sop.service.SopNotifyInfoService;

/**
 * <p>
 * 业务实现类
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
@Transactional(readOnly = true)
public class SopNotifyInfoServiceImpl extends SuperServiceImpl<SopNotifyInfoManager, Long, SopNotifyInfo> implements SopNotifyInfoService {
    private final NotifyService notifyService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean end(Long id) {
        LbUpdateWrap<SopNotifyInfo> eq = Wraps.<SopNotifyInfo>lbU()
                .set(SopNotifyInfo::getNotifyStatus, NotifyStatusEnum.END.getCode())
                .eq(SopNotifyInfo::getNotifyStatus, NotifyStatusEnum.SEND_FAIL.getCode())
                .eq(SopNotifyInfo::getId, id);
        return superManager.update(eq);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long push(Long id, String url) {
        if (StringUtils.isNotBlank(url)) {
            LbUpdateWrap<SopNotifyInfo> eq = Wraps.<SopNotifyInfo>lbU()
                    .set(SopNotifyInfo::getNotifyUrl, url)
                    .eq(SopNotifyInfo::getId, id);
            superManager.update(eq);
        }
        Long notifyId = notifyService.notifyImmediately(id);
        log.info("重新推送结果, notifyId={}", notifyId);
        return notifyId;
    }
}


