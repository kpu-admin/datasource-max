package cn.lmx.kpu.system.controller.application;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.base.controller.SuperReadController;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.system.entity.application.DefTenantApplicationRecord;
import cn.lmx.kpu.system.service.application.DefTenantApplicationRecordService;
import cn.lmx.kpu.system.vo.query.application.DefTenantApplicationRecordPageQuery;
import cn.lmx.kpu.system.vo.result.application.DefTenantApplicationRecordResultVO;


/**
 * <p>
 * 前端控制器
 * 租户应用授权记录
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/defTenantApplicationRecord")
@Tag(name = "租户应用授权记录")
public class DefTenantApplicationRecordController extends SuperReadController
        <DefTenantApplicationRecordService, Long, DefTenantApplicationRecord, DefTenantApplicationRecordPageQuery, DefTenantApplicationRecordResultVO> {

    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

}

