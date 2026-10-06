package cn.lmx.kpu.test.manager;

import cn.lmx.basic.base.manager.SuperCacheManager;
import cn.lmx.kpu.test.entity.DefGenTestSimple;

/**
 * <p>
 * 通用业务接口
 * 测试单表
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
public interface DefGenTestSimpleCacheManager extends SuperCacheManager<DefGenTestSimple> {
    /**
     * 插入数据
     *
     * @param defGenTestSimple 参数
     */
    void insert(DefGenTestSimple defGenTestSimple);
}


