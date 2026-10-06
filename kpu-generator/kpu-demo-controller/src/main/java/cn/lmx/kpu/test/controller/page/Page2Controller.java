package cn.lmx.kpu.test.controller.page;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.controller.PageController;
import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.generator.entity.DefGenTableColumn;
import cn.lmx.kpu.generator.service.DefGenTableColumnService;
import cn.lmx.kpu.generator.vo.query.DefGenTableColumnPageQuery;
import cn.lmx.kpu.generator.vo.result.DefGenTableColumnResultVO;

@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/page2")
@Tag(name = "分页示例2")
@WebLog(enabled = false)
public class Page2Controller implements PageController<Long, DefGenTableColumn, DefGenTableColumnPageQuery, DefGenTableColumnResultVO> {
    private final DefGenTableColumnService defGenTableColumnService;

    @Override
    public SuperService<Long, DefGenTableColumn> getSuperService() {
        return defGenTableColumnService;
    }

    @Override
    public Class<DefGenTableColumn> getEntityClass() {
        return DefGenTableColumn.class;
    }

    @Override
    public Class<DefGenTableColumnResultVO> getResultVOClass() {
        return DefGenTableColumnResultVO.class;
    }
}
