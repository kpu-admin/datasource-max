package cn.lmx.kpu.api;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cn.lmx.basic.base.R;

/**
 * 文件接口
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
//@FeignClient(name = "kpu-generator-server")
public interface GrayApi {
    /**
     * 测试方法
     *
     * @param id id
     * @return
     */

    @GetMapping("/gray/test2")
    R<Object> test2(@RequestParam(required = false) Long id);

}
