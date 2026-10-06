package cn.lmx.kpu.msg.service.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.common.constant.DsConstant;
import cn.lmx.kpu.msg.entity.ExtendInterfaceLog;
import cn.lmx.kpu.msg.entity.ExtendInterfaceLogging;
import cn.lmx.kpu.msg.manager.ExtendInterfaceLogManager;
import cn.lmx.kpu.msg.manager.ExtendInterfaceLoggingManager;
import cn.lmx.kpu.msg.service.ExtendInterfaceLogService;

import java.util.Collection;

/**
 * <p>
 * 业务实现类
 * 接口执行日志
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@DS(DsConstant.BASE_TENANT)
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class ExtendInterfaceLogServiceImpl extends SuperServiceImpl<ExtendInterfaceLogManager, Long, ExtendInterfaceLog> implements ExtendInterfaceLogService {
    private final ExtendInterfaceLoggingManager extendInterfaceLoggingManager;

    @Override
    public boolean removeByIds(Collection<Long> idList) {
        extendInterfaceLoggingManager.remove(Wraps.<ExtendInterfaceLogging>lbQ().in(
                ExtendInterfaceLogging::getLogId, idList
        ));
        return super.removeByIds(idList);
    }
}


