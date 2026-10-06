package cn.lmx.kpu.oauth.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.RandomUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.cache.redis2.CacheResult;
import cn.lmx.basic.cache.repository.CacheOps;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.basic.exception.BizException;
import cn.lmx.basic.model.cache.CacheKey;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.basic.utils.BeanPlusUtil;
import cn.lmx.kpu.base.entity.user.BaseEmployee;
import cn.lmx.kpu.base.entity.user.BaseOrg;
import cn.lmx.kpu.base.service.user.BaseEmployeeService;
import cn.lmx.kpu.base.service.user.BaseOrgService;
import cn.lmx.kpu.common.cache.auth.TempAdminCacheKeyBuilder;
import cn.lmx.kpu.common.cache.common.CaptchaCacheKeyBuilder;
import cn.lmx.kpu.common.properties.SystemProperties;
import cn.lmx.kpu.oauth.service.UserInfoService;
import cn.lmx.kpu.oauth.vo.param.RegisterByEmailVO;
import cn.lmx.kpu.oauth.vo.param.RegisterByMobileVO;
import cn.lmx.kpu.oauth.vo.result.OrgResultVO;
import cn.lmx.kpu.oauth.vo.result.TenantResultVO;
import cn.lmx.kpu.system.entity.tenant.DefUser;
import cn.lmx.kpu.system.entity.tenant.DefUserTenantRel;
import cn.lmx.kpu.system.service.tenant.DefTenantService;
import cn.lmx.kpu.system.service.tenant.DefUserService;
import cn.lmx.kpu.system.service.tenant.DefUserTenantRelService;
import cn.lmx.kpu.system.vo.result.tenant.DefTenantResultVO;

import java.time.Duration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
@Service
@RequiredArgsConstructor
public class UserInfoServiceImpl implements UserInfoService {
    protected final BaseEmployeeService baseEmployeeService;
    protected final BaseOrgService baseOrgService;
    protected final DefUserTenantRelService defUserTenantRelService;
    protected final DefUserService defUserService;
    protected final DefTenantService defTenantService;
    protected final CacheOps cacheOps;
    protected final SystemProperties systemProperties;

    @Override
    public OrgResultVO findCompanyAndDept(Long tenantId) {
        Long userId = ContextUtil.getUserId();
        Long companyId = ContextUtil.getCurrentCompanyId();
        Long deptId = ContextUtil.getCurrentDeptId();
        List<DefTenantResultVO> defTenantList = defTenantService.listTenantByUserId(userId);
        if (CollUtil.isEmpty(defTenantList)) {
            return OrgResultVO.builder().build();
        }

        List<TenantResultVO> tenantList = BeanPlusUtil.toBeanList(defTenantList, TenantResultVO.class);

        if (tenantId == null) {
            return OrgResultVO.builder().tenantList(tenantList).build();
        }

        if (tenantList.stream().noneMatch(item -> item.getId().equals(tenantId))) {
            throw BizException.wrap("请选择正确的企业");
        }

        ContextUtil.setTenantBasePoolName(tenantId);
        DefUserTenantRel defUserTenantRel = defUserTenantRelService.getEmployeeByTenantAndUser(tenantId, userId);
        ArgumentAssert.notNull(defUserTenantRel, "用户不属于该企业");
        BaseEmployee baseEmployee = baseEmployeeService.getByIdCache(defUserTenantRel.getId());
        ArgumentAssert.notNull(baseEmployee, "用户不属于该企业");

        for (TenantResultVO tenant : tenantList) {
            ContextUtil.setTenantId(tenant.getId());
            List<BaseOrg> orgList = baseOrgService.findOrgByEmployeeId(tenant.getEmployeeId());
            tenant.setOrgList(orgList);
        }

        // 上次登录的单位
        Long currentCompanyId = companyId != null ? companyId : baseEmployee.getLastCompanyId();
        // 上次登录的部门
        Long currentDeptId = deptId != null ? deptId : baseEmployee.getLastDeptId();
        return OrgResultVO.builder()
                .tenantList(tenantList)
                .employeeId(baseEmployee.getId())
                .currentCompanyId(currentCompanyId)
                .currentDeptId(currentDeptId).build();
    }

    @Override
    public List<BaseOrg> findDeptByCompany(Long tenantId, Long companyId, Long employeeId) {
        ContextUtil.setTenantBasePoolName(tenantId);
        return baseOrgService.findDeptByEmployeeId(employeeId, companyId);
    }

    @Override
    public String registerByMobile(RegisterByMobileVO register) {
        if (systemProperties.getVerifyCaptcha()) {
//            短信验证码
            CacheKey cacheKey = new CaptchaCacheKeyBuilder().key(register.getMobile(), register.getKey());
            CacheResult<String> code = cacheOps.get(cacheKey);
            ArgumentAssert.equals(code.getValue(), register.getCode(), "验证码不正确");
        }
        ArgumentAssert.equals(register.getConfirmPassword(), register.getPassword(), "密码和确认密码不一致");
        DefUser defUser = BeanUtil.toBean(register, DefUser.class);

        defUserService.register(defUser);

        return defUser.getMobile();
    }

    @Override
    public String registerByEmail(RegisterByEmailVO register) {
        if (systemProperties.getVerifyCaptcha()) {
//            短信验证码
            CacheKey cacheKey = new CaptchaCacheKeyBuilder().key(register.getEmail(), register.getKey());
            CacheResult<String> code = cacheOps.get(cacheKey);
            ArgumentAssert.equals(code.getValue(), register.getCode(), "验证码不正确");
        }
        ArgumentAssert.equals(register.getConfirmPassword(), register.getPassword(), "密码和确认密码不一致");
        DefUser defUser = BeanUtil.toBean(register, DefUser.class);

        defUserService.registerByEmail(defUser);

        return defUser.getEmail();
    }

    @Override
    public Map<String, Object> registerTempAdmin(String type) {
        Map<String, Object> result = new HashMap<>(4);
        String username = RandomUtil.randomNumbers(4);
        String password = RandomUtil.randomNumbers(2);
        CacheKey key = TempAdminCacheKeyBuilder.builder(username);
        CacheKey typeKey = TempAdminCacheKeyBuilder.builder(username, "type");
        cacheOps.set(key, username + password);
        cacheOps.set(typeKey, type);

        result.put("username", username);
        result.put("password", username + password);
        result.put("expire", key.getExpire());
        result.put("expireStr", formatDuration(key.getExpire()));
        return result;
    }

    private static String formatDuration(Duration duration) {
        long seconds = duration.getSeconds();
        long minutes = (seconds % 3600) / 60;
        long secs = seconds % 60;
        return String.format("00:%02d:%02d", minutes, secs);
    }
}
