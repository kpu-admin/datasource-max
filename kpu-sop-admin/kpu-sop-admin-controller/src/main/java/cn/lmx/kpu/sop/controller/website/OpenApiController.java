package cn.lmx.kpu.sop.controller.website;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.swagger.v3.oas.annotations.Operation;
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
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.query.LbQueryWrap;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.basic.utils.TreeUtil;
import cn.lmx.kpu.model.enumeration.BooleanEnum;
import cn.lmx.kpu.sop.entity.SopDocApp;
import cn.lmx.kpu.sop.entity.SopHelpDoc;
import cn.lmx.kpu.sop.service.SopDocAppService;
import cn.lmx.kpu.sop.service.SopDocInfoService;
import cn.lmx.kpu.sop.service.SopHelpDocService;
import cn.lmx.kpu.sop.vo.query.SopHelpDocPageQuery;
import cn.lmx.kpu.sop.vo.result.DocInfoViewVO;
import cn.lmx.kpu.sop.vo.result.SopDocAppResultVO;
import cn.lmx.kpu.sop.vo.result.SopHelpDocResultVO;

import java.util.List;

/**
 * 对完
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Slf4j
@RequiredArgsConstructor
@Validated
@RestController
@RequestMapping("/anyTenant/website")
@Tag(name = "接口信息表")
public class OpenApiController {
    private final SopDocAppService sopDocAppService;
    private final SopDocInfoService sopDocInfoService;
    private final SopHelpDocService sopHelpDocService;


    /**
     * 获取文档应用列表
     */
    @GetMapping(value = "/app/list")
    public R<List<SopDocAppResultVO>> findAppList() {
        List<SopDocApp> list = sopDocAppService.list(Wrappers.emptyWrapper());
        return R.success(BeanUtil.copyToList(list, SopDocAppResultVO.class));
    }

    /**
     * 获取文档菜单树
     *
     * @param docAppId 应用id
     */
    @GetMapping(value = "/doc/tree")
    public R<List<Tree<Long>>> findDocTree(@RequestParam Long docAppId) {
        return R.success(sopDocInfoService.tree(docAppId, BooleanEnum.TRUE.getInteger()));
    }

    /**
     * 按树结构查询
     *
     * @param pageQuery 查询参数
     * @return 查询结果
     */
    @Operation(summary = "按树结构查询")
    @PostMapping("/help/tree")
    public R<List<SopHelpDocResultVO>> tree(@RequestBody SopHelpDocPageQuery pageQuery) {
        LbQueryWrap<SopHelpDoc> wrap = Wraps.lbQ();
        List<SopHelpDoc> list = sopHelpDocService.list(wrap);
        List<SopHelpDocResultVO> treeList = BeanPlusUtil.toBeanList(list, SopHelpDocResultVO.class);
        return R.success(TreeUtil.buildTree(treeList));
    }

    /**
     * 获取文档详情
     *
     * @param id 文档id
     */
    @GetMapping("/doc/detail")
    public R<DocInfoViewVO> getDocDetail(@RequestParam Long id) {
        return R.success(sopDocInfoService.getDocView(id));
    }
}
