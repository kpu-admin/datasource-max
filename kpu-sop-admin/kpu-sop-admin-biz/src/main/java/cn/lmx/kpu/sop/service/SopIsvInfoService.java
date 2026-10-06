package cn.lmx.kpu.sop.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.model.vo.save.AudioVO;
import cn.lmx.kpu.model.vo.save.StatusUpdateVO;
import cn.lmx.kpu.sop.entity.SopIsvInfo;
import cn.lmx.kpu.sop.utils.RSATool;
import cn.lmx.kpu.sop.vo.result.SopIsvKeysResultVO;
import cn.lmx.kpu.sop.vo.save.SopIsvInfoApplyForVO;
import cn.lmx.kpu.sop.vo.save.SopIsvInfoSubmitVO;
import cn.lmx.kpu.sop.vo.update.SopIsvInfoOpenUpdateVO;


/**
 * <p>
 * 业务接口
 * isv信息表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopIsvInfoService extends SuperService<Long, SopIsvInfo> {

    Boolean updateStatus(StatusUpdateVO param);

    Long examine(AudioVO param);

    RSATool.KeyStore createKeys(RSATool.KeyFormat keyFormat) throws Exception;

    SopIsvKeysResultVO getKeys(Long isvId);

    Long applyFor(SopIsvInfoApplyForVO param);

    Long submit(SopIsvInfoSubmitVO param);
    Long update(SopIsvInfoOpenUpdateVO param);
}


