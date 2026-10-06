package cn.lmx.kpu.sop.manager;

import com.baomidou.mybatisplus.core.metadata.IPage;
import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.kpu.sop.entity.SopApiInfo;
import cn.lmx.kpu.sop.event.ChangeApiInfoEvent;
import cn.lmx.kpu.sop.vo.query.SopApiInfoPageQuery;
import cn.lmx.kpu.sop.vo.result.SopApiInfoResultVO;

import java.util.Collection;
import java.util.Collections;

/**
 * <p>
 * 通用业务接口
 * 接口信息表
 * </p>
 *
 * @author lmx
 * @since [2025-05-07 10:52:47] [lmx] [代码生成器生成]
 */
public interface SopApiInfoManager extends SuperManager<SopApiInfo> {

    default void sendChangeEvent(Long id) {
        SpringUtils.publishEvent(new ChangeApiInfoEvent(Collections.singletonList(id)));
    }

    default void sendChangeEvent(Collection<Long> idList) {
        SpringUtils.publishEvent(new ChangeApiInfoEvent(idList));
    }

    IPage<SopApiInfoResultVO> groupPage(IPage<SopApiInfo> page, SopApiInfoPageQuery query);
}


