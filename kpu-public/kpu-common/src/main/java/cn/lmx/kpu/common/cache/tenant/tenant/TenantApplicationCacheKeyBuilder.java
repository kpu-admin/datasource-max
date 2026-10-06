package cn.lmx.kpu.common.cache.tenant.tenant;

import cn.lmx.basic.base.entity.SuperEntity;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.basic.utils.StrPool;
import cn.lmx.kpu.common.cache.CacheKeyModular;
import cn.lmx.kpu.common.cache.CacheKeyTable;

import java.time.Duration;

/**
 * 租户拥有的应用
 * <p>
 * #def_tenant_application_rel
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class TenantApplicationCacheKeyBuilder implements CacheKeyBuilder {
    public static CacheKey builder(Long tenantId) {
        return new TenantApplicationCacheKeyBuilder().key(tenantId);
    }



    @Override
    public String getTenant() {
        return StrPool.EMPTY;
    }

    @Override
    public String getModular() {
        return CacheKeyModular.SYSTEM;
    }

    @Override
    public String getTable() {
        return CacheKeyTable.System.TENANT_APPLICATION;
    }

    @Override
    public String getField() {
        return SuperEntity.ID_FIELD;
    }

    @Override
    public ValueType getValueType() {
        return ValueType.number;
    }

    @Override
    public Duration getExpire() {
        return Duration.ofHours(24);
    }
}
