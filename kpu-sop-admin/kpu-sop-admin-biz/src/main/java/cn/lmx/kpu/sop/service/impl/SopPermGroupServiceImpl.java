package cn.lmx.kpu.sop.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.entity.SopPermGroup;
import cn.lmx.kpu.sop.entity.SopPermGroupPermission;
import cn.lmx.kpu.sop.entity.SopPermIsvGroup;
import cn.lmx.kpu.sop.manager.SopPermGroupManager;
import cn.lmx.kpu.sop.manager.SopPermGroupPermissionManager;
import cn.lmx.kpu.sop.manager.SopPermIsvGroupManager;
import cn.lmx.kpu.sop.service.SopPermGroupService;
import cn.lmx.kpu.sop.vo.save.SopPermIsvGroupSaveVO;

import java.util.Collection;
import java.util.List;

/**
 * <p>
 * 业务实现类
 * 分组表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class SopPermGroupServiceImpl extends SuperServiceImpl<SopPermGroupManager, Long, SopPermGroup> implements SopPermGroupService {
    private final SopPermIsvGroupManager sopPermIsvGroupManager;
    private final SopPermGroupPermissionManager sopPermGroupPermissionManager;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateIsvGroup(SopPermIsvGroupSaveVO param) {
        sopPermIsvGroupManager.remove(Wrappers.<SopPermIsvGroup>lambdaQuery().eq(SopPermIsvGroup::getIsvId, param.getIsvId()));
        if (CollectionUtils.isEmpty(param.getGroupIdList())) {
            return true;
        }
        List<SopPermIsvGroup> saveList = param.getGroupIdList()
                .stream()
                .map(groupId -> {
                    SopPermIsvGroup permIsvGroup = new SopPermIsvGroup();
                    permIsvGroup.setIsvId(param.getIsvId());
                    permIsvGroup.setGroupId(groupId);
                    return permIsvGroup;
                }).toList();
        boolean cnt = sopPermIsvGroupManager.saveBatch(saveList);
        superManager.sendChangeEvent(param.getIsvId());
        return cnt;
    }

    @Override
    public boolean removeByIds(Collection<Long> idList) {
        boolean cnt = super.removeByIds(idList);
        sopPermIsvGroupManager.remove(Wrappers.<SopPermIsvGroup>lambdaQuery().in(SopPermIsvGroup::getGroupId, idList));
        sopPermGroupPermissionManager.remove(Wrappers.<SopPermGroupPermission>lambdaQuery().in(SopPermGroupPermission::getGroupId, idList));
        return cnt;
    }
}


