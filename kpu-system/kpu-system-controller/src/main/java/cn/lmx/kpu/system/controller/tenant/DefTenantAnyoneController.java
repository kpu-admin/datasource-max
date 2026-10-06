package cn.lmx.kpu.system.controller.tenant;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.basic.base.controller.SuperCacheController;
import cn.lmx.basic.base.request.PageParams;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.basic.database.mybatis.conditions.query.QueryWrap;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.system.entity.tenant.DefTenant;
import cn.lmx.kpu.system.service.tenant.DefTenantService;
import cn.lmx.kpu.system.vo.query.tenant.DefTenantPageQuery;
import cn.lmx.kpu.system.vo.result.tenant.DefTenantResultVO;
import cn.lmx.kpu.system.vo.save.tenant.DefTenantSaveVO;
import cn.lmx.kpu.system.vo.update.tenant.DefTenantUpdateVO;


/**
 * <p>
 * 前端控制器
 * 企业
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/anyone/defTenant")
@Tag(name = "我的企业")
public class DefTenantAnyoneController extends SuperCacheController<DefTenantService, Long, DefTenant,
        DefTenantSaveVO, DefTenantUpdateVO, DefTenantPageQuery, DefTenantResultVO> {

    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

    @Operation(summary = "修改租户审核状态", description = "修改租户审核状态")
    @PostMapping("/updateStatus")
    @WebLog("修改租户审核状态")
    public R<Boolean> updateStatus(@NotNull(message = "请修改正确的企业") @RequestParam Long id,
                                   @RequestParam @NotNull(message = "请传递状态值") String status,
                                   @RequestParam(required = false) String reviewComments) {
        return success(superService.updateStatus(id, status, reviewComments));
    }

    @Override
    public QueryWrap<DefTenant> handlerWrapper(DefTenant model, PageParams<DefTenantPageQuery> params) {
        QueryWrap<DefTenant> wrap = super.handlerWrapper(model, params);
        wrap.lambda().eq(DefTenant::getCreatedBy, ContextUtil.getUserId());
        return wrap;
    }

    @Override
    public R<DefTenant> save(@RequestBody @Validated DefTenantSaveVO defTenantSaveVO) {
        return R.success(superService.register(defTenantSaveVO));
    }
}
