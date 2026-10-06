package cn.lmx.kpu.test.controller;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.aaa.AaaService;
import cn.lmx.kpu.bbb.BbService;

@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/log")
@Tag(name = "log")
public class LogController {

    private final AaaService aaaService;
    private final BbService bbService;

    /***
     * 调用这个接口会报错
     * @param data
     * @return
     */
    @GetMapping("/get1")
    public R<Object> get1(String data) {
        log.info("get1={}", data);

        aaaService.aaa();
        bbService.bbb();
        return R.success(data);
    }


}
