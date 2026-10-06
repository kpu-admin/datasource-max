package cn.lmx.kpu.msg.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.msg.entity.ExtendMsgTemplate;


/**
 * <p>
 * 业务接口
 * 消息模板
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
public interface ExtendMsgTemplateService extends SuperService<Long, ExtendMsgTemplate> {
    /**
     * 检测 模板标识 是否存在
     *
     * @param code
     * @param id
     * @return
     */
    Boolean check(String code, Long id);

    /**
     * 根据消息模板编码查询消息模板
     *
     * @param code
     * @return
     */
    ExtendMsgTemplate getByCode(String code);
}


