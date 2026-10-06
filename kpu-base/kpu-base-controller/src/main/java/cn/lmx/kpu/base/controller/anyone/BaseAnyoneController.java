package cn.lmx.kpu.base.controller.anyone;

import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.StpUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.kpu.system.service.tenant.DefUserTenantRelService;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/anyone")
@Tag(name = "需要登录但无需验证uri权限的接口")
public class BaseAnyoneController {

    private final DefUserTenantRelService defUserTenantRelService;

    @GetMapping("/base/test")
    public R<Object> test(@RequestParam(required = false) Long id) throws InterruptedException {
        SaSession session = StpUtil.getSession();
        log.info("id={}", session);
        Thread.sleep(id);
        log.info("id={}", id);
        return R.success(id);
    }

    @Operation(summary = "设置默认企业")
    @PutMapping("/updateDefaultTenant")
    @WebLog(value = "设置默认企业")
    public R<Boolean> updateDefaultTenant(@RequestParam Long tenantId) {
        return R.success(defUserTenantRelService.updateDefaultTenant(tenantId, ContextUtil.getUserId()));
    }
}
