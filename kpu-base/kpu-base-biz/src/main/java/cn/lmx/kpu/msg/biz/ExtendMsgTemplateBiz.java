package cn.lmx.kpu.msg.biz;

import cn.hutool.core.bean.BeanUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.kpu.msg.entity.DefMsgTemplate;
import cn.lmx.kpu.msg.entity.ExtendMsgTemplate;
import cn.lmx.kpu.msg.service.DefMsgTemplateService;
import cn.lmx.kpu.msg.service.ExtendMsgTemplateService;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class ExtendMsgTemplateBiz {

    private final ExtendMsgTemplateService extendMsgTemplateService;
    private final DefMsgTemplateService defMsgTemplateService;

    public Boolean importMsgTemplate(List<Long> ids) {
        ArgumentAssert.notEmpty(ids, "请选择消息模板");
        List<DefMsgTemplate> defMsgTemplateList = defMsgTemplateService.listByIds(ids);
        ArgumentAssert.notEmpty(defMsgTemplateList, "请选择正确的消息模板");
        List<String> codeList = defMsgTemplateList.stream().map(DefMsgTemplate::getCode).toList();

        List<ExtendMsgTemplate> existMsgTemplateList = extendMsgTemplateService.list(
                Wraps.<ExtendMsgTemplate>lbQ().in(ExtendMsgTemplate::getCode, codeList));
        Set<String> exists = existMsgTemplateList.stream().map(ExtendMsgTemplate::getCode).collect(Collectors.toSet());

        List<ExtendMsgTemplate> extendMsgTemplateList = new ArrayList<>();
        defMsgTemplateList.forEach(item -> {
            if (!exists.contains(item.getCode())) {
                ExtendMsgTemplate extendMsgTemplate = BeanUtil.toBean(item, ExtendMsgTemplate.class);
                extendMsgTemplate.setId(null);
                extendMsgTemplate.setCreatedBy(null);
                extendMsgTemplate.setCreatedTime(null);
                extendMsgTemplate.setUpdatedBy(null);
                extendMsgTemplate.setUpdatedTime(null);
                extendMsgTemplateList.add(extendMsgTemplate);
            }
        });

        return extendMsgTemplateService.saveBatch(extendMsgTemplateList);
    }
}
