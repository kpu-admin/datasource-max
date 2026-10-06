package cn.lmx.kpu.system.manager.tenant.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperCacheManagerImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.basic.utils.CollHelper;
import cn.lmx.kpu.common.cache.tenant.tenant.TenantCacheKeyBuilder;
import cn.lmx.kpu.model.constant.EchoApi;
import cn.lmx.kpu.model.enumeration.system.DefTenantStatusEnum;
import cn.lmx.kpu.system.entity.tenant.DefTenant;
import cn.lmx.kpu.system.manager.tenant.DefTenantManager;
import cn.lmx.kpu.system.mapper.tenant.DefTenantMapper;
import cn.lmx.kpu.system.vo.result.tenant.DefTenantResultVO;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/**
 * 应用管理
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
@RequiredArgsConstructor
@Service(EchoApi.DEF_TENANT_SERVICE_IMPL_CLASS)
public class DefTenantManagerImpl extends SuperCacheManagerImpl<DefTenantMapper, DefTenant> implements DefTenantManager {
    @Override
    protected CacheKeyBuilder cacheKeyBuilder() {
        return new TenantCacheKeyBuilder();
    }

    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> ids) {
        return CollHelper.uniqueIndex(find(ids), DefTenant::getId, DefTenant::getName);
    }

    public List<DefTenant> find(Set<Serializable> ids) {
        // 强转， 防止数据库隐式转换，  若你的id 是string类型，请勿强转
        return findByIds(ids, null).stream().filter(Objects::nonNull).toList();
    }


    @Override
    public List<DefTenant> listNormal() {
        return list(Wraps.<DefTenant>lbQ().eq(DefTenant::getStatus, DefTenantStatusEnum.NORMAL.getCode()));
    }

    @Override
    public List<DefTenantResultVO> listTenantByUserId(Long userId) {
        return baseMapper.listTenantByUserId(userId);
    }
}
