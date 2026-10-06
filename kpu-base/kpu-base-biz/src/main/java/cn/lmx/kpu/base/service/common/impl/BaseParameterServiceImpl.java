package cn.lmx.kpu.base.service.common.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.base.entity.common.BaseParameter;
import cn.lmx.kpu.base.manager.common.BaseParameterManager;
import cn.lmx.kpu.base.service.common.BaseParameterService;
import cn.lmx.kpu.base.vo.save.common.BaseParameterSaveVO;
import cn.lmx.kpu.common.constant.DsConstant;
import cn.lmx.kpu.model.enumeration.system.DataTypeEnum;

/**
 * <p>
 * 业务实现类
 * 个性参数
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
@DS(DsConstant.BASE_TENANT)
public class BaseParameterServiceImpl extends SuperServiceImpl<BaseParameterManager, Long, BaseParameter> implements BaseParameterService {
    @Override
    protected <SaveVO> BaseParameter saveBefore(SaveVO saveVO) {
        BaseParameterSaveVO baseParameterSaveVO = (BaseParameterSaveVO) saveVO;
        BaseParameter baseParameter = super.saveBefore(baseParameterSaveVO);
        baseParameter.setParamType(DataTypeEnum.SYSTEM.getCode());
        return baseParameter;
    }


}
