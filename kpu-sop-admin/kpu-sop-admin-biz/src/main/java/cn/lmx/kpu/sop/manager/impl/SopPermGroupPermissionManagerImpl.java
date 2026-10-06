package cn.lmx.kpu.sop.manager.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.kpu.sop.entity.SopPermGroupPermission;
import cn.lmx.kpu.sop.entity.SopPermIsvGroup;
import cn.lmx.kpu.sop.event.ChangeIsvPermEvent;
import cn.lmx.kpu.sop.manager.SopPermGroupPermissionManager;
import cn.lmx.kpu.sop.manager.SopPermIsvGroupManager;
import cn.lmx.kpu.sop.mapper.SopPermGroupPermissionMapper;

import java.util.List;

/**
 * <p>
 * 通用业务实现类
 * 组权限表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SopPermGroupPermissionManagerImpl extends SuperManagerImpl<SopPermGroupPermissionMapper, SopPermGroupPermission> implements SopPermGroupPermissionManager {

    private final SopPermIsvGroupManager sopPermIsvGroupManager;
     public void refreshIsvPerm(Long groupId) {
//        List<SopPermGroupPermission> list = list(Wrappers.<SopPermGroupPermission>lambdaQuery().eq(SopPermGroupPermission::getGroupId, groupId));
        List<SopPermIsvGroup> list = sopPermIsvGroupManager.list(Wrappers.<SopPermIsvGroup>lambdaQuery()
                .eq(SopPermIsvGroup::getGroupId, groupId));
        SpringUtils.publishEvent(new ChangeIsvPermEvent(list.stream().map(SopPermIsvGroup::getIsvId).distinct().toList()));
    }
}


