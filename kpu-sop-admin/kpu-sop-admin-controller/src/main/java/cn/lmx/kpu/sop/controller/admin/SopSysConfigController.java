package cn.lmx.kpu.sop.controller.admin;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.sop.entity.SopSysConfig;
import cn.lmx.kpu.sop.service.SopSysConfigService;
import cn.lmx.kpu.sop.vo.query.SopSysConfigPageQuery;
import cn.lmx.kpu.sop.vo.result.SopSysConfigResultVO;
import cn.lmx.kpu.sop.vo.save.SopSysConfigSaveVO;
import cn.lmx.kpu.sop.vo.update.SopSysConfigUpdateVO;

/**
 * <p>
 * 前端控制器
 * 系统配置表
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
@RequestMapping("/sopSysConfig")
@Tag(name = "系统配置表")
public class SopSysConfigController extends SuperController<SopSysConfigService, Long, SopSysConfig, SopSysConfigSaveVO, SopSysConfigUpdateVO, SopSysConfigPageQuery, SopSysConfigResultVO> {
    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

}


