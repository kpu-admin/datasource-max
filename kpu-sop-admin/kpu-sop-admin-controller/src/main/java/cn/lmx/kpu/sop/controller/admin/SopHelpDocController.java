package cn.lmx.kpu.sop.controller.admin;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.query.LbQueryWrap;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.basic.utils.TreeUtil;
import cn.lmx.kpu.sop.entity.SopHelpDoc;
import cn.lmx.kpu.sop.service.SopHelpDocService;
import cn.lmx.kpu.sop.vo.query.SopHelpDocPageQuery;
import cn.lmx.kpu.sop.vo.result.SopHelpDocResultVO;
import cn.lmx.kpu.sop.vo.save.SopHelpDocSaveVO;
import cn.lmx.kpu.sop.vo.update.SopHelpDocUpdateVO;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * 帮助内容
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Slf4j
@RequiredArgsConstructor
@Validated
@RestController
@RequestMapping("/sopHelpDoc")
@Tag(name = "帮助内容表")
public class SopHelpDocController extends SuperController<SopHelpDocService, Long, SopHelpDoc, SopHelpDocSaveVO, SopHelpDocUpdateVO, SopHelpDocPageQuery, SopHelpDocResultVO> {
    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }

    /**
     * 按树结构查询
     *
     * @param pageQuery 查询参数
     * @return 查询结果
     */
    @Operation(summary = "按树结构查询")
    @PostMapping("/tree")
    @WebLog("按树结构查询")
    public R<List<SopHelpDocResultVO>> tree(@RequestBody SopHelpDocPageQuery pageQuery) {
        LbQueryWrap<SopHelpDoc> wrap = Wraps.lbQ();
        List<SopHelpDoc> list = superService.list(wrap);
        echoService.action(list);
        List<SopHelpDocResultVO> treeList = BeanPlusUtil.toBeanList(list, SopHelpDocResultVO.class);
        return success(TreeUtil.buildTree(treeList));
    }

}


