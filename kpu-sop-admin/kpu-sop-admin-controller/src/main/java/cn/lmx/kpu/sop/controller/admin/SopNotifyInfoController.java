package cn.lmx.kpu.sop.controller.admin;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import cn.lmx.basic.base.R;
import cn.lmx.basic.base.controller.SuperController;
import cn.lmx.basic.interfaces.echo.EchoService;
import cn.lmx.kpu.model.vo.save.IdVO;
import cn.lmx.kpu.sop.entity.SopNotifyInfo;
import cn.lmx.kpu.sop.service.SopNotifyInfoService;
import cn.lmx.kpu.sop.vo.query.SopNotifyInfoPageQuery;
import cn.lmx.kpu.sop.vo.result.SopNotifyInfoResultVO;
import cn.lmx.kpu.sop.vo.save.SopNotifyInfoSaveVO;
import cn.lmx.kpu.sop.vo.update.SopNotifyInfoUpdateVO;

/**
 * <p>
 * 前端控制器
 * 回调信息-提供给前端管理页面使用
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
@RequestMapping("/sopNotifyInfo")
@Tag(name = "回调信息")
public class SopNotifyInfoController extends SuperController<SopNotifyInfoService, Long, SopNotifyInfo, SopNotifyInfoSaveVO, SopNotifyInfoUpdateVO, SopNotifyInfoPageQuery, SopNotifyInfoResultVO> {
    private final EchoService echoService;

    @Override
    public EchoService getEchoService() {
        return echoService;
    }


    /**
     * 重新推送
     *
     * @param id ID
     * @param url 重试地址
     * @return 返回影响行数
     */
    @PostMapping("/push")
    public R<Long> push(@RequestParam Long id, @RequestParam(required = false) String url) {
        return R.success(superService.push(id, url));
    }

    /**
     * 结束重试
     *
     * @param param 表单数据
     * @return 返回影响行数
     */
    @PostMapping("/end")
    public R<Boolean> end(@Validated @RequestBody IdVO param) {
        return R.success(superService.end(param.getId()));
    }
}


