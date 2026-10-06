package cn.lmx.kpu.system.manager.tenant.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperCacheManagerImpl;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.tenant.tenant.DefUserTenantCacheKeyBuilder;
import cn.lmx.kpu.system.entity.tenant.DefUserTenantRel;
import cn.lmx.kpu.system.manager.tenant.DefUserTenantRelManager;
import cn.lmx.kpu.system.mapper.tenant.DefUserTenantRelMapper;
import cn.lmx.kpu.system.vo.result.tenant.DefUserTenantRelResultVO;

import java.util.List;

/**
 * <p>
 * 通用业务实现类
 * 员工
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DefUserTenantRelManagerImpl extends SuperCacheManagerImpl<DefUserTenantRelMapper, DefUserTenantRel> implements DefUserTenantRelManager {
    @Override
    protected CacheKeyBuilder cacheKeyBuilder() {
        return new DefUserTenantCacheKeyBuilder();
    }


    @Override
    public List<DefUserTenantRelResultVO> listEmployeeByUserId(Long userId) {
        return baseMapper.listEmployeeByUserId(userId);
    }
}
