package cn.lmx.kpu.test.manager.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.entity.SuperEntity;
import cn.lmx.basic.base.manager.impl.SuperCacheManagerImpl;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.common.cache.CacheKeyModular;
import cn.lmx.kpu.test.entity.DefGenTestSimple;
import cn.lmx.kpu.test.manager.DefGenTestSimpleCacheManager;
import cn.lmx.kpu.test.mapper.DefGenTestSimpleMapper;

/**
 * <p>
 * 通用业务实现类
 * 测试单表
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DefGenTestSimpleCacheManagerImpl extends SuperCacheManagerImpl<DefGenTestSimpleMapper, DefGenTestSimple> implements DefGenTestSimpleCacheManager {
    @Override
    protected CacheKeyBuilder cacheKeyBuilder() {
        return new DefGenTestSimpleBuilder();
    }


    @Override
    public boolean save(DefGenTestSimple model) {
        boolean save = super.save(model);

        return save;
    }

    /**
     * 自定义key
     */
    @Override
    public void insert(DefGenTestSimple defGenTestSimple) {

        baseMapper.insert(defGenTestSimple);

        // 标准方式
        // lc:1:base:def_simple:id:number:425943412962092032
        CacheKey key = new DefGenTestSimpleBuilder().key(defGenTestSimple.getId());
        log.info("key={}, expire={}", key.getKey(), key.getExpire().getSeconds());
        cacheOps.set(key, defGenTestSimple);

// 1 - 1 -> 1
// 1 - 2 -> -1
// 2 - 2 -> -1
        CacheKey key1 = DefGenTestSimpleBuilder.builder2(defGenTestSimple.getName(), defGenTestSimple.getId());
        log.info("key1={}, expire={}", key1.getKey(), key1.getExpire().getSeconds());

        key1 = new DefGenTestSimpleBuilder().builder(defGenTestSimple.getName(), defGenTestSimple.getId());
        log.info("key1={}, expire={}", key1.getKey(), key1.getExpire().getSeconds());

        // 偷懒方式1
        CacheKeyBuilder keyBuilder = new CacheKeyBuilder() {
            @Override
            public String getTable() {
                return "dddd";
            }
        };
        key1 = keyBuilder.key(defGenTestSimple.getId());
        log.info("key1={}, expire={}", key1.getKey(), key1.getExpire());

        // 偷懒方式2
        keyBuilder = () -> "eeeeeeeee";
        key1 = keyBuilder.key(defGenTestSimple.getId());
        log.info("key1={}, expire={}", key1.getKey(), key1.getExpire());

        // 偷懒方式3
        keyBuilder = new CacheKeyBuilder() {
            @Override
            public String getTable() {
                return "dd";
            }

            @Override
            public String getTenant() {
                return ContextUtil.getTenantIdStr();
            }


            @Override
            public String getModular() {
                return CacheKeyModular.BASE;
            }

            @Override
            public String getField() {
                return SuperEntity.ID_FIELD;
            }

            @Override
            public ValueType getValueType() {
                return ValueType.obj;
            }
        };
        key1 = keyBuilder.key(defGenTestSimple.getId());
        log.info("key1={}, expire={}", key1.getKey(), key1.getExpire());


    }
}


