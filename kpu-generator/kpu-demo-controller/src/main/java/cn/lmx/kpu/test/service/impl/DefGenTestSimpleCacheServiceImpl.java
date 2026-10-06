package cn.lmx.kpu.test.service.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperCacheServiceImpl;
import cn.lmx.kpu.common.constant.DsConstant;
import cn.lmx.kpu.test.entity.DefGenTestSimple;
import cn.lmx.kpu.test.manager.DefGenTestSimpleCacheManager;
import cn.lmx.kpu.test.service.DefGenTestSimpleCacheService;

/**
 * <p>
 * 业务实现类
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
@Transactional(readOnly = true)
@DS(DsConstant.DEFAULTS)
//@DS(DsConstant.BASE_TENANT)
public class DefGenTestSimpleCacheServiceImpl extends SuperCacheServiceImpl<DefGenTestSimpleCacheManager, Long, DefGenTestSimple> implements DefGenTestSimpleCacheService {

}


