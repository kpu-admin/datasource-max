package cn.lmx.kpu.base.manager.user.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperCacheManagerImpl;
import cn.lmx.basic.model.cache.CacheKeyBuilder;
import cn.lmx.kpu.base.entity.user.BaseEmployee;
import cn.lmx.kpu.base.manager.user.BaseEmployeeManager;
import cn.lmx.kpu.base.mapper.user.BaseEmployeeMapper;
import cn.lmx.kpu.base.vo.query.user.BaseEmployeePageQuery;
import cn.lmx.kpu.base.vo.result.user.BaseEmployeeResultVO;
import cn.lmx.kpu.common.cache.base.user.EmployeeCacheKeyBuilder;

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
public class BaseEmployeeManagerImpl extends SuperCacheManagerImpl<BaseEmployeeMapper, BaseEmployee> implements BaseEmployeeManager {

    @Override
    protected CacheKeyBuilder cacheKeyBuilder() {
        return new EmployeeCacheKeyBuilder();
    }

    @Override
    public IPage<BaseEmployeeResultVO> selectPageResultVO(IPage<BaseEmployee> page, Wrapper<BaseEmployee> wrapper, BaseEmployeePageQuery model) {
        return baseMapper.selectPageResultVO(page, wrapper, model);
    }
}
