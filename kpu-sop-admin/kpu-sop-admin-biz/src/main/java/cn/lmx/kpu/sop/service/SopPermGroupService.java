package cn.lmx.kpu.sop.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.sop.entity.SopPermGroup;
import cn.lmx.kpu.sop.vo.save.SopPermIsvGroupSaveVO;


/**
 * <p>
 * 业务接口
 * 分组表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopPermGroupService extends SuperService<Long, SopPermGroup> {

    Boolean updateIsvGroup(SopPermIsvGroupSaveVO param);
}


