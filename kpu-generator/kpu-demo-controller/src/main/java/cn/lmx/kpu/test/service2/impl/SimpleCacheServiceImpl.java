package cn.lmx.kpu.test.service2.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.service.impl.SuperCacheServiceImpl;
import cn.lmx.kpu.test.entity.DefGenTestSimple;
import cn.lmx.kpu.test.manager2.SimpleCacheManager;
import cn.lmx.kpu.test.service2.SimpleCacheService;


/**
 * <p>
 * 业务接口
 * 测试单表
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Service
@RequiredArgsConstructor
public class SimpleCacheServiceImpl extends SuperCacheServiceImpl<SimpleCacheManager, Long, DefGenTestSimple>
        implements SimpleCacheService {

}


