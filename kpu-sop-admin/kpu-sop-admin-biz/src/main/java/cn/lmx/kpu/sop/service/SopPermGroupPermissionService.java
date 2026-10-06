package cn.lmx.kpu.sop.service;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.sop.entity.SopPermGroupPermission;

import java.util.List;


/**
 * <p>
 * 业务接口
 * 组权限表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopPermGroupPermissionService extends SuperService<Long, SopPermGroupPermission> {

    Boolean delete(Long groupId, List<Long> apiIdList);
}


