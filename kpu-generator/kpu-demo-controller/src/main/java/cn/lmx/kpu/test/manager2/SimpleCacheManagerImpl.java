package cn.lmx.kpu.test.manager2;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperCacheManagerImpl;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.test.entity.DefGenTestSimple;
import cn.lmx.kpu.test.manager.impl.DefGenTestSimpleBuilder;
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
public class SimpleCacheManagerImpl extends SuperCacheManagerImpl<DefGenTestSimpleMapper, DefGenTestSimple> implements SimpleCacheManager {


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


    }
}


