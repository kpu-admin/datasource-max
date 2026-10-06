package cn.lmx.kpu.oauth.biz;

import cn.hutool.core.bean.BeanUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.basic.exception.UnauthorizedException;
import cn.lmx.kpu.base.entity.user.BaseEmployee;
import cn.lmx.kpu.base.service.user.BaseEmployeeService;
import cn.lmx.kpu.base.vo.result.user.BaseEmployeeResultVO;
import cn.lmx.kpu.common.constant.AppendixType;
import cn.lmx.kpu.file.service.AppendixService;
import cn.lmx.kpu.model.vo.result.AppendixResultVO;
import cn.lmx.kpu.oauth.vo.result.DefUserInfoResultVO;
import cn.lmx.kpu.system.entity.application.DefApplication;
import cn.lmx.kpu.system.entity.tenant.DefUser;
import cn.lmx.kpu.system.entity.tenant.DefUserTenantRel;
import cn.lmx.kpu.system.service.application.DefApplicationService;
import cn.lmx.kpu.system.service.tenant.DefUserService;
import cn.lmx.kpu.system.service.tenant.DefUserTenantRelService;
import cn.lmx.kpu.system.vo.result.application.DefApplicationResultVO;

/**
 * 用户大业务
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class OauthUserBiz {
    private final BaseEmployeeService baseEmployeeService;
    private final DefUserTenantRelService defUserTenantRelService;
    private final DefUserService defUserService;
    private final DefApplicationService defApplicationService;
    private final AppendixService appendixService;

    public DefUserInfoResultVO getUserById(Long id) {
        // 查默认库
        DefUser defUser = defUserService.getByIdCache(id);
        if (defUser == null) {
            log.warn("user not found, id:{}", id);
            return null;
        }

        // 用户信息
        DefUserInfoResultVO resultVO = new DefUserInfoResultVO();
        BeanUtil.copyProperties(defUser, resultVO);

        // 用户头像
        AppendixResultVO appendix = appendixService.getByBiz(defUser.getId(), AppendixType.System.DEF__USER__AVATAR);
        if (appendix != null) {
            resultVO.setAvatarId(appendix.getId());
        }

        resultVO.setTenantId(ContextUtil.getTenantId());

        if (!ContextUtil.isEmptyBasePoolNameHeader() && !ContextUtil.isEmptyEmployeeId()) {
            Long employeeId = ContextUtil.getEmployeeId();
            resultVO.setEmployeeId(employeeId);

            // 默认库的员工不存在说明该用户不属于该企业，就不能查 租户库的数据
            DefUserTenantRel defEmployee = defUserTenantRelService.getByIdCache(employeeId);
            if (defEmployee != null) {
                try {
                    //查 租户库
                    BaseEmployee employee = baseEmployeeService.getByIdCache(employeeId);
                    resultVO.setBaseEmployee(BeanUtil.toBean(employee, BaseEmployeeResultVO.class));
                } catch (Exception e) {
                    log.warn("查询您的身份信息失败，请重新登录", e);
                    // 报错说明 租户库没创建
                    throw UnauthorizedException.wrap("查询您的身份信息失败，请重新登录");
                }
            }
        }

        DefApplication defApplication = defApplicationService.getDefApp(id);
        resultVO.setDefApplication(BeanUtil.toBean(defApplication, DefApplicationResultVO.class));
        return resultVO;
    }
}
