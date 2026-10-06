package cn.lmx.kpu.base.service.user.impl;

import com.baomidou.dynamic.datasource.annotation.DS;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.base.entity.user.BaseOrgRoleRel;
import cn.lmx.kpu.base.manager.user.BaseOrgRoleRelManager;
import cn.lmx.kpu.base.service.user.BaseOrgRoleRelService;
import cn.lmx.kpu.common.constant.DsConstant;

/**
 * <p>
 * 业务实现类
 * 组织的角色
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
public class BaseOrgRoleRelServiceImpl extends SuperServiceImpl<BaseOrgRoleRelManager, Long, BaseOrgRoleRel> implements BaseOrgRoleRelService {

}
