package cn.lmx.kpu.test.controller.mvc;


import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.annotation.log.WebLog;
import cn.lmx.basic.base.R;
import cn.lmx.basic.base.controller.SuperWriteController;
import cn.lmx.kpu.test.entity.DefGenTestSimple;
import cn.lmx.kpu.test.service2.SimpleService;
import cn.lmx.kpu.test.vo.save.DefGenTestSimpleSaveVO;
import cn.lmx.kpu.test.vo.update.DefGenTestSimpleUpdateVO;

import java.util.List;

@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/mvc4")
@Tag(name = "mvc4")
@WebLog(enabled = false)
public class SimpleEntity4Controller extends SuperWriteController<SimpleService, Long, DefGenTestSimple, DefGenTestSimpleSaveVO, DefGenTestSimpleUpdateVO> {


    @Operation(summary = "删除222")
    @DeleteMapping("/delete")
    public R<Boolean> delete22(@RequestBody List<Long> ids) {
        R<Boolean> result = handlerDelete(ids);
        if (result.getDefExec()) {
            return R.success(getSuperService().removeByIds(ids));
        }
        return result;
    }

    @Operation(summary = "put222")
    @PutMapping("/put")
    public R<Boolean> put222(@RequestBody List<Long> ids) {
        R<Boolean> result = handlerDelete(ids);
        if (result.getDefExec()) {
            return R.success(getSuperService().removeByIds(ids));
        }
        return result;
    }
}
