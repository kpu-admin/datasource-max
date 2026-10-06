package cn.lmx.kpu.common.cache.tenant.tenant;

import cn.lmx.basic.base.entity.SuperEntity;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.CacheKeyModular;
import cn.lmx.kpu.common.cache.CacheKeyTable;

import java.time.Duration;

/**
 * 系统用户 KEY
 * <p>
 * #base_user
 * <p>
 * [服务模块名:]业务类型[:业务字段][:value类型][:岗位id] -> obj
 * base:base_employee:id:obj:1 -> {}
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public class DefUserTenantCacheKeyBuilder implements CacheKeyBuilder {
    public static CacheKey build(Long id) {
        return new DefUserTenantCacheKeyBuilder().key(id);
    }

    @Override
    public String getTable() {
        return CacheKeyTable.Base.DEF_USER_TENANT;
    }



    @Override
    public String getModular() {
        return CacheKeyModular.SYSTEM;
    }

    @Override
    public String getField() {
        return SuperEntity.ID_FIELD;
    }

    @Override
    public ValueType getValueType() {
        return ValueType.obj;
    }

    @Override
    public Duration getExpire() {
        return Duration.ofHours(24);
    }
}
