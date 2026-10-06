package cn.lmx.kpu.sop.controller.admin;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.sop.entity.SopDocContent;
import cn.lmx.kpu.sop.service.SopDocContentService;
import cn.lmx.kpu.sop.vo.query.SopDocContentPageQuery;
import cn.lmx.kpu.sop.vo.result.SopDocContentResultVO;
import cn.lmx.kpu.sop.vo.save.SopDocContentSaveVO;
import cn.lmx.kpu.sop.vo.update.SopDocContentUpdateVO;

/**
 * <p>
 * 前端控制器
 * 文档内容
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
@RequestMapping("/sopDocContent")
@Tag(name = "文档内容")
public class SopDocContentController extends SuperController<SopDocContentService, Long, SopDocContent, SopDocContentSaveVO, SopDocContentUpdateVO, SopDocContentPageQuery, SopDocContentResultVO> {
    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

}


