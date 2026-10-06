package cn.lmx.kpu.sdk.param;

import lombok.Data;
import lombok.EqualsAndHashCode;
import cn.lmx.kpu.sdk.request.PayTradeWapPayRequest;
import cn.lmx.kpu.sdk.response.PayTradeWapPayResponse;
import cn.lmx.kpu.sdkcore.param.BaseParam;

/**
 * pay.trade.wap.pay(手机网站支付接口)
 *
 * @author lmx
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class PayTradeWapPayParam extends BaseParam<PayTradeWapPayRequest, PayTradeWapPayResponse> {
    @Override
    protected String method() {
        return "openapi.wap.pay";
    }
}
