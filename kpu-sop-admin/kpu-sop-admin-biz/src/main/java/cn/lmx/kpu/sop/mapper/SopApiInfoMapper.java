package cn.lmx.kpu.sop.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.sop.entity.SopApiInfo;
import cn.lmx.kpu.sop.vo.query.SopApiInfoPageQuery;
import cn.lmx.kpu.sop.vo.result.SopApiInfoResultVO;

/**
 * <p>
 * Mapper 接口
 * 接口信息表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Repository
public interface SopApiInfoMapper extends SuperMapper<SopApiInfo> {

    IPage<SopApiInfoResultVO> groupPage(IPage<SopApiInfo> page,
                                        @Param(Constants.WRAPPER) Wrapper<SopApiInfo> wrapper,
                                        @Param("query") SopApiInfoPageQuery query);

}


