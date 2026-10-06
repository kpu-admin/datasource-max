package cn.lmx.kpu.sop.controller.admin;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.base.R;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.sop.entity.SopPermGroup;
import cn.lmx.kpu.sop.service.SopPermGroupService;
import cn.lmx.kpu.sop.service.SopPermIsvGroupService;
import cn.lmx.kpu.sop.vo.query.SopPermGroupPageQuery;
import cn.lmx.kpu.sop.vo.result.SopPermGroupResultVO;
import cn.lmx.kpu.sop.vo.save.SopPermGroupSaveVO;
import cn.lmx.kpu.sop.vo.save.SopPermIsvGroupSaveVO;
import cn.lmx.kpu.sop.vo.update.SopPermGroupUpdateVO;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * 分组表
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
@RequestMapping("/sopPermGroup")
@Tag(name = "分组表")
public class SopPermGroupController extends SuperController<SopPermGroupService, Long, SopPermGroup, SopPermGroupSaveVO, SopPermGroupUpdateVO, SopPermGroupPageQuery, SopPermGroupResultVO> {
    private final EchoService echoService;
    private final SopPermIsvGroupService sopPermIsvGroupService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

    @GetMapping("/listByGroupId")
    public R<List<Long>> listByGroupId(@RequestParam Long isvId) {
        return R.success(sopPermIsvGroupService.listByGroupId(isvId));
    }


    /**
     * 设置分组
     *
     * @param param 表单数据
     * @return 返回影响行数
     */
    @PostMapping("updateIsvGroup")
    public R<Boolean> updateIsvGroup(@Validated @RequestBody SopPermIsvGroupSaveVO param) {
        return R.success(superService.updateIsvGroup(param));
    }
}


