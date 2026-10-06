package com.xxl.job.executor.service;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.xxl.job.core.context.XxlJobHelper;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import cn.lmx.basic.context.ContextConstants;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.query.LbQueryWrap;
import cn.lmx.kpu.model.enumeration.system.DefTenantStatusEnum;
import cn.lmx.kpu.system.entity.tenant.DefTenant;
import cn.lmx.kpu.system.service.tenant.DefTenantService;

import java.util.List;
import java.util.function.BiConsumer;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
public abstract class AbstractTenantJob {
    @Autowired
    private DefTenantService defTenantService;

    protected void loadTenant(BiConsumer<DefTenant, String> consumer) {
        String traceId = IdUtil.fastSimpleUUID();
        MDC.put(ContextConstants.TRACE_ID_HEADER, StrUtil.isEmpty(traceId) ? StrUtil.EMPTY : traceId);

        LbQueryWrap<DefTenant> wrapper = Wraps.<DefTenant>lbQ()
                .eq(DefTenant::getStatus, DefTenantStatusEnum.NORMAL.getCode());

        List<DefTenant> list = defTenantService.list(wrapper);

        list.forEach(tenant -> {
            MDC.put(ContextConstants.TENANT_ID_KEY, tenant.getCode());
            consumer.accept(tenant, XxlJobHelper.getJobParam());
        });
    }

}
