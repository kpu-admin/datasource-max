package cn.lmx.kpu.sop.controller.admin;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.sop.entity.SopDocApp;
import cn.lmx.kpu.sop.service.SopDocAppService;
import cn.lmx.kpu.sop.vo.query.SopDocAppPageQuery;
import cn.lmx.kpu.sop.vo.result.SopDocAppResultVO;
import cn.lmx.kpu.sop.vo.save.SopDocAppSaveVO;
import cn.lmx.kpu.sop.vo.update.SopDocAppUpdateVO;

/**
 * <p>
 * 前端控制器
 * 文档应用
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Slf4j
@RequiredArgsConstructor
@Validated
@RestController
@RequestMapping("/sopDocApp")
@Tag(name = "文档应用")
public class SopDocAppController extends SuperController<SopDocAppService, Long, SopDocApp, SopDocAppSaveVO, SopDocAppUpdateVO, SopDocAppPageQuery, SopDocAppResultVO> {
    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }


}


