package cn.lmx.kpu.msg.manager.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.msg.entity.ExtendMsgTemplate;
import cn.lmx.kpu.msg.manager.ExtendMsgTemplateManager;
import cn.lmx.kpu.msg.mapper.ExtendMsgTemplateMapper;

/**
 * <p>
 * 通用业务实现类
 * 消息模板
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class ExtendMsgTemplateManagerImpl extends SuperManagerImpl<ExtendMsgTemplateMapper, ExtendMsgTemplate> implements ExtendMsgTemplateManager {
    @Override
    public ExtendMsgTemplate getByCode(String code) {
        return getOne(Wraps.<ExtendMsgTemplate>lbQ().eq(ExtendMsgTemplate::getCode, code));
    }
}


