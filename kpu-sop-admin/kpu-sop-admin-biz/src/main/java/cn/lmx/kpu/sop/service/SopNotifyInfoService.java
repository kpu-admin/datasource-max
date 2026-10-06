package cn.lmx.kpu.sop.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.sop.entity.SopNotifyInfo;


/**
 * <p>
 * 业务接口
 * 回调信息
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
public interface SopNotifyInfoService extends SuperService<Long, SopNotifyInfo> {

    Boolean end(Long id);

    Long push(Long id, String url);
}


