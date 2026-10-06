package cn.lmx.kpu.sop.manager.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.kpu.sop.entity.SopPermIsvGroup;
import cn.lmx.kpu.sop.manager.SopPermIsvGroupManager;
import cn.lmx.kpu.sop.mapper.SopPermIsvGroupMapper;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 通用业务实现类
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
public class SopPermIsvGroupManagerImpl extends SuperManagerImpl<SopPermIsvGroupMapper, SopPermIsvGroup> implements SopPermIsvGroupManager {
    @Override
    public List<Long> listGroupIdByIsvId(Long isvId) {
        List<SopPermIsvGroup> list = this.list(Wrappers.<SopPermIsvGroup>lambdaQuery().eq(SopPermIsvGroup::getIsvId, isvId));
        return list.stream().map(SopPermIsvGroup::getGroupId).distinct().collect(Collectors.toList());
    }
}


