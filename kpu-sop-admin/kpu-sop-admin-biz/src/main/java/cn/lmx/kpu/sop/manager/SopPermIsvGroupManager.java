package cn.lmx.kpu.sop.manager;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.sop.entity.SopPermIsvGroup;

import java.util.List;

/**
 * <p>
 * 通用业务接口
 * isv分组
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopPermIsvGroupManager extends SuperManager<SopPermIsvGroup> {
    List<Long> listGroupIdByIsvId(Long isvId);
}


