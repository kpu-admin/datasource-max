package cn.lmx.kpu.system.controller.application;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.annotation.user.LoginUser;
import cn.lmx.basic.base.R;
import cn.lmx.basic.base.controller.SuperReadController;
import cn.lmx.basic.base.entity.SuperEntity;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.model.entity.system.SysUser;
import cn.lmx.kpu.system.entity.application.DefTenantApplicationRel;
import cn.lmx.kpu.system.service.application.DefTenantApplicationRelService;
import cn.lmx.kpu.system.vo.query.application.DefTenantApplicationRelPageQuery;
import cn.lmx.kpu.system.vo.result.application.DefTenantApplicationRelResultVO;
import cn.lmx.kpu.system.vo.save.application.DefTenantApplicationRelSaveVO;
import cn.lmx.kpu.system.vo.update.application.DefTenantApplicationRelUpdateVO;

import java.time.LocalDateTime;
import java.util.List;


/**
 * <p>
 * 前端控制器
 * 租户应用授权
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/defTenantApplicationRel")
@Tag(name = "租户应用授权")
public class DefTenantApplicationRelController extends SuperReadController
        <DefTenantApplicationRelService, Long, DefTenantApplicationRel, DefTenantApplicationRelPageQuery, DefTenantApplicationRelResultVO> {

    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

    @Override
    public void handlerResult(IPage<DefTenantApplicationRelResultVO> page) {
        super.handlerResult(page);
        // true 表示已过期
        page.getRecords().forEach(item ->
                item.setExpired(item.getExpirationTime() != null && item.getExpirationTime().isBefore(LocalDateTime.now()))
        );
    }

    @Override
    public R<DefTenantApplicationRelResultVO> getDetail(@RequestParam("id") Long id) {
        return R.success(superService.getDetailById(id));
    }

    @Operation(summary = "授权")
    @PostMapping(value = "/grant")
    @WebLog(value = "授权")
    public R<Boolean> grant(@RequestBody @Validated DefTenantApplicationRelSaveVO saveVO, @Parameter(hidden = true) @LoginUser(isUser = true) SysUser sysUser) {
        return success(superService.grant(saveVO, sysUser));
    }

    @Operation(summary = "取消授权")
    @PostMapping(value = "/cancel")
    @WebLog(value = "取消授权")
    public R<Boolean> cancel(@RequestBody List<Long> ids, @Parameter(hidden = true) @LoginUser(isUser = true) SysUser sysUser) {
        return success(superService.cancel(ids, sysUser));
    }


    @Operation(summary = "续期")
    @PostMapping(value = "/renewal")
    @WebLog(value = "续期")
    public R<Boolean> renewal(@RequestBody @Validated(SuperEntity.Update.class) DefTenantApplicationRelUpdateVO updateVO, @Parameter(hidden = true) @LoginUser(isUser = true) SysUser sysUser) {
        return success(superService.renewal(updateVO, sysUser));
    }


}
