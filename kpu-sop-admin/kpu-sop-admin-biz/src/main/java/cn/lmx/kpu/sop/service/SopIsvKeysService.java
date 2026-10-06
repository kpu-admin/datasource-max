package cn.lmx.kpu.sop.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.sop.entity.SopIsvKeys;
import cn.lmx.kpu.sop.vo.update.SopIsvKeysUpdateVO;


/**
 * <p>
 * 业务接口
 * ISV秘钥管理
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopIsvKeysService extends SuperService<Long, SopIsvKeys> {
    Boolean saveKeys(SopIsvKeysUpdateVO updateVO);

    SopIsvKeys getByIsvId(Long isvId);
}


