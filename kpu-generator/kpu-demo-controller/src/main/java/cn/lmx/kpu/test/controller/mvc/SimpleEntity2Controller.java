package cn.lmx.kpu.test.controller.mvc;


import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.controller.SuperCacheController;
import cn.lmx.kpu.test.entity.DefGenTestSimple;
import cn.lmx.kpu.test.service2.SimpleCacheService;
import cn.lmx.kpu.test.vo.query.DefGenTestSimplePageQuery;
import cn.lmx.kpu.test.vo.result.DefGenTestSimpleResultVO;
import cn.lmx.kpu.test.vo.save.DefGenTestSimpleSaveVO;
import cn.lmx.kpu.test.vo.update.DefGenTestSimpleUpdateVO;

@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/mvc2")
@Tag(name = "mvc2")
@WebLog(enabled = false)
public class SimpleEntity2Controller extends SuperCacheController<SimpleCacheService, Long, DefGenTestSimple, DefGenTestSimpleSaveVO, DefGenTestSimpleUpdateVO, DefGenTestSimplePageQuery, DefGenTestSimpleResultVO> {

}
