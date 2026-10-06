package cn.lmx.kpu.sop.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.sop.entity.SopPermIsvGroup;

import java.util.List;


/**
 * <p>
 * 业务接口
 * isv分组
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopPermIsvGroupService extends SuperService<Long, SopPermIsvGroup> {

    List<Long> listByGroupId(Long isvId);
}


