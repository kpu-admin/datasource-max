package cn.lmx.kpu.sop.controller.admin;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.base.R;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.sop.entity.SopPermGroupPermission;
import cn.lmx.kpu.sop.service.SopPermGroupPermissionService;
import cn.lmx.kpu.sop.vo.query.SopPermGroupPermissionPageQuery;
import cn.lmx.kpu.sop.vo.result.SopPermGroupPermissionResultVO;
import cn.lmx.kpu.sop.vo.save.SopPermGroupPermissionSaveVO;
import cn.lmx.kpu.sop.vo.update.SopPermGroupPermissionUpdateVO;

/**
 * <p>
 * 前端控制器
 * 组权限表
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
@RequestMapping("/sopPermGroupPermission")
@Tag(name = "组权限表")
public class SopPermGroupPermissionController extends SuperController<SopPermGroupPermissionService, Long, SopPermGroupPermission, SopPermGroupPermissionSaveVO, SopPermGroupPermissionUpdateVO, SopPermGroupPermissionPageQuery, SopPermGroupPermissionResultVO> {
    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }


    @PostMapping("delete")
    public R<Boolean> delete(@RequestBody @Validated SopPermGroupPermissionSaveVO param) {
        return R.success(superService.delete(param.getGroupId(), param.getApiIdList()));
    }
}


