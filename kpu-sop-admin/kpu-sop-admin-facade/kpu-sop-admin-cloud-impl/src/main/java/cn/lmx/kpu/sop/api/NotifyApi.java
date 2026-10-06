package cn.lmx.kpu.sop.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import cn.lmx.basic.base.R;
import cn.lmx.basic.constant.Constants;
import cn.lmx.kpu.sop.dto.NotifyRequest;

/**
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@FeignClient(name = "${" + Constants.PROJECT_PREFIX + ".feign.sop-admin-server:kpu-sop-admin-server}")
public interface NotifyApi {

    /**
     * 回调
     *
     * @param request 参数
     * @return 返回结果 回调ID
     */
    @PostMapping(value = "/notify/exec")
    R<Long> notify(@RequestBody NotifyRequest request);

}
