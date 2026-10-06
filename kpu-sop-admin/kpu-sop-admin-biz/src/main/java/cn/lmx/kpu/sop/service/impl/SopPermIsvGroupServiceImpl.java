package cn.lmx.kpu.sop.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.sop.entity.SopPermIsvGroup;
import cn.lmx.kpu.sop.manager.SopPermIsvGroupManager;
import cn.lmx.kpu.sop.service.SopPermIsvGroupService;

import java.util.List;

/**
 * <p>
 * 业务实现类
 * isv分组
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
public class SopPermIsvGroupServiceImpl extends SuperServiceImpl<SopPermIsvGroupManager, Long, SopPermIsvGroup> implements SopPermIsvGroupService {
    @Override
    public List<Long> listByGroupId(Long isvId) {
        List<SopPermIsvGroup> list = list(Wraps.<SopPermIsvGroup>lbQ().eq(SopPermIsvGroup::getIsvId, isvId));
        return list.stream().map(SopPermIsvGroup::getGroupId).distinct().toList();
    }
}


