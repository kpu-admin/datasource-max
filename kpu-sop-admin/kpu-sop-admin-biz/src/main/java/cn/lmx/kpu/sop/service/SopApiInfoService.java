package cn.lmx.kpu.sop.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import cn.lmx.basic.base.request.PageParams;
import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.model.vo.save.StatusUpdateVO;
import cn.lmx.kpu.sop.entity.SopApiInfo;
import cn.lmx.kpu.sop.vo.query.SopApiInfoPageQuery;
import cn.lmx.kpu.sop.vo.result.SopApiInfoResultVO;


/**
 * <p>
 * 业务接口
 * 接口信息表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopApiInfoService extends SuperService<Long, SopApiInfo> {
    Boolean updateStatus(StatusUpdateVO statusUpdate);

    IPage<SopApiInfoResultVO> groupPage(PageParams<SopApiInfoPageQuery> params);
}


