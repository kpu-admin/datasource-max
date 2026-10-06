package cn.lmx.kpu.test.controller.mvc;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.controller.SuperReadController;
import cn.lmx.kpu.test.entity.DefGenTestSimple;
import cn.lmx.kpu.test.service2.SimpleService;
import cn.lmx.kpu.test.vo.query.DefGenTestSimplePageQuery;
import cn.lmx.kpu.test.vo.result.DefGenTestSimpleResultVO;

@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/mvc3")
@Tag(name = "mvc3")
@WebLog(enabled = false)
public class SimpleEntity3Controller extends SuperReadController<SimpleService, Long, DefGenTestSimple, DefGenTestSimplePageQuery, DefGenTestSimpleResultVO> {

}
