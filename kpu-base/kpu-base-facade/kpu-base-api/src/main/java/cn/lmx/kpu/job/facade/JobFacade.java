package cn.lmx.kpu.job.facade;

import cn.lmx.basic.base.R;
import cn.lmx.kpu.job.dto.XxlJobInfoVO;

/**
 * @author lmx
 * @since 2024年09月21日00:15:26
 */
public interface JobFacade {
    /**
     * 定时发送接口
     *
     * @param xxlJobInfo 任务
     * @return 任务id
     */
    R<String> addTimingTask(XxlJobInfoVO xxlJobInfo);

}
