package cn.lmx.kpu.openapi.open.impl;

import com.gitee.sop.support.context.OpenContext;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Value;
import cn.lmx.basic.base.R;
import cn.lmx.kpu.openapi.open.OpenPayment;
import cn.lmx.kpu.openapi.open.req.PayOrderSearchRequest;
import cn.lmx.kpu.openapi.open.req.PayTradeWapPayRequest;
import cn.lmx.kpu.openapi.open.req.SaveBaseEmployeeRequest;
import cn.lmx.kpu.openapi.open.resp.GetBaseEmployeeResponse;
import cn.lmx.kpu.openapi.open.resp.PayOrderSearchResponse;
import cn.lmx.kpu.openapi.open.resp.PayTradeWapPayResponse;
import cn.lmx.kpu.sop.dto.NotifyRequest;
import cn.lmx.kpu.sop.facade.NotifyFacade;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;


/**
 * 开放接口测试类实现
 *
 * @author lmx
 */
@DubboService
@Slf4j
//@DubboService(validation = "jvalidationNew")
public class OpenPaymentImpl implements OpenPayment {

    @Value("${dubbo.labels:}")
    private String env;
    @Resource
    private NotifyFacade notifyFacade;

    @Override
    public PayTradeWapPayResponse tradeWapPay(PayTradeWapPayRequest request, OpenContext context) {
        log.info("appId={}, tenantId={}", context.getAppId(), context.getTenantId());

        PayTradeWapPayResponse payTradeWapPayResponse = new PayTradeWapPayResponse();
        payTradeWapPayResponse.setPageRedirectionData(UUID.randomUUID().toString());

        return payTradeWapPayResponse;
    }

    @Override
    public PayOrderSearchResponse orderSearch(PayOrderSearchRequest request) {
        PayOrderSearchResponse payOrderSearchResponse = new PayOrderSearchResponse();
        payOrderSearchResponse.setOrderNo(request.getOrderNo());
        payOrderSearchResponse.setPayNo("xxxx");
        payOrderSearchResponse.setPayUserId(111L);
        payOrderSearchResponse.setPayUserName("Jim");

        payOrderSearchResponse.setRemark("11" + ",env:" + env);
        return payOrderSearchResponse;
    }

    @Override
    public GetBaseEmployeeResponse saveOrder(SaveBaseEmployeeRequest request) {
        log.info("request = {}", request);
        GetBaseEmployeeResponse response = new GetBaseEmployeeResponse();
        response.setId(1L);
        response.setCreatedTime(LocalDateTime.now());
        response.setRealName("呵呵");

        // 模拟业务处理耗时
        try {
            TimeUnit.MILLISECONDS.sleep(500);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        OpenContext openContext = OpenContext.current();
        // 发送回调
        this.sendNotifyTask(request, openContext, response);
        return response;
    }

    private void sendNotifyTask(SaveBaseEmployeeRequest request, OpenContext openContext, GetBaseEmployeeResponse employee) {
        // 回调
        NotifyRequest notifyRequest = new NotifyRequest();
        notifyRequest.setAppId(openContext.getAppId());
        notifyRequest.setApiName(openContext.getApiName());
        notifyRequest.setVersion(openContext.getVersion());
        notifyRequest.setClientIp(openContext.getClientIp());
        notifyRequest.setNotifyUrl(openContext.getNotifyUrl());
        notifyRequest.setCharset(openContext.getCharset());
        notifyRequest.setTenantId(openContext.getTenantId());
        // 模拟传递需要回调的参数
        Map<String, Object> bizParams = new HashMap<>();
        bizParams.put("id", employee.getId());
        bizParams.put("realName", employee.getRealName());
        bizParams.put("name", request.getName());

        notifyRequest.setBizParams(bizParams);
        notifyRequest.setRemark("新增用户回调");

        // 发送回调任务
        R<Long> notifyResponse = notifyFacade.notify(notifyRequest);
        log.info("回调返回,notifyResponse={}", notifyResponse);
    }
}
