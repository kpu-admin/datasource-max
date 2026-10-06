package cn.lmx.kpu.msg.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.dynamic.datasource.annotation.DS;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.kpu.common.constant.DsConstant;
import cn.lmx.kpu.msg.entity.ExtendMsgTemplate;
import cn.lmx.kpu.msg.manager.ExtendMsgTemplateManager;
import cn.lmx.kpu.msg.service.ExtendMsgTemplateService;
import cn.lmx.kpu.msg.vo.save.ExtendMsgTemplateSaveVO;
import cn.lmx.kpu.msg.vo.update.ExtendMsgTemplateUpdateVO;

/**
 * <p>
 * 业务实现类
 * 消息模板
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@DS(DsConstant.BASE_TENANT)
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class ExtendMsgTemplateServiceImpl extends SuperServiceImpl<ExtendMsgTemplateManager, Long, ExtendMsgTemplate> implements ExtendMsgTemplateService {
    @Override
    public ExtendMsgTemplate getByCode(String code) {
        return superManager.getByCode(code);
    }

    @Override
    public Boolean check(String code, Long id) {
        ArgumentAssert.notEmpty(code, "请填写模板标识");
        return superManager.count(Wraps.<ExtendMsgTemplate>lbQ().eq(ExtendMsgTemplate::getCode, code)
                .ne(ExtendMsgTemplate::getId, id)) > 0;
    }

    @Override
    protected <SaveVO> ExtendMsgTemplate saveBefore(SaveVO saveVO) {
        ExtendMsgTemplateSaveVO extendMsgTemplateSaveVO = (ExtendMsgTemplateSaveVO) saveVO;
        ArgumentAssert.isFalse(StrUtil.isNotBlank(extendMsgTemplateSaveVO.getCode()) &&
                               check(extendMsgTemplateSaveVO.getCode(), null), "模板标识{}已存在", extendMsgTemplateSaveVO.getCode());

        return super.saveBefore(extendMsgTemplateSaveVO);
    }

    @Override
    protected <UpdateVO> ExtendMsgTemplate updateBefore(UpdateVO updateVO) {
        ExtendMsgTemplateUpdateVO extendMsgTemplateUpdateVO = (ExtendMsgTemplateUpdateVO) updateVO;
        ArgumentAssert.isFalse(StrUtil.isNotBlank(extendMsgTemplateUpdateVO.getCode()) &&
                               check(extendMsgTemplateUpdateVO.getCode(), extendMsgTemplateUpdateVO.getId()),
                "模板标识{}已存在", extendMsgTemplateUpdateVO.getCode());

        return super.updateBefore(extendMsgTemplateUpdateVO);
    }
}


