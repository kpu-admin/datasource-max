package cn.lmx.kpu.base.controller.common;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.base.entity.common.BaseParameter;
import cn.lmx.kpu.base.service.common.BaseParameterService;
import cn.lmx.kpu.base.vo.query.common.BaseParameterPageQuery;
import cn.lmx.kpu.base.vo.result.common.BaseParameterResultVO;
import cn.lmx.kpu.base.vo.save.common.BaseParameterSaveVO;
import cn.lmx.kpu.base.vo.update.common.BaseParameterUpdateVO;


/**
 * <p>
 * 前端控制器
 * 个性参数
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/baseParameter")
@Tag(name = "个性参数")
public class BaseParameterController extends SuperController<BaseParameterService, Long, BaseParameter, BaseParameterSaveVO, BaseParameterUpdateVO, BaseParameterPageQuery, BaseParameterResultVO> {

    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

}
