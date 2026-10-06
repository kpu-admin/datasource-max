package cn.lmx.kpu.base.manager.user;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import cn.lmx.basic.base.manager.SuperCacheManager;
import cn.lmx.kpu.base.entity.user.BaseEmployee;
import cn.lmx.kpu.base.vo.query.user.BaseEmployeePageQuery;
import cn.lmx.kpu.base.vo.result.user.BaseEmployeeResultVO;

/**
 * <p>
 * 通用业务接口
 * 员工
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface BaseEmployeeManager extends SuperCacheManager<BaseEmployee> {
    /**
     * 分页查询
     *
     * @param page    分页对象
     * @param wrapper 查询条件
     * @param model  参数
     * @return 分页用户数据
     */
    IPage<BaseEmployeeResultVO> selectPageResultVO(IPage<BaseEmployee> page, Wrapper<BaseEmployee> wrapper, BaseEmployeePageQuery model);

}
