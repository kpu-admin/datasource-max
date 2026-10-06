package cn.lmx.kpu.sdk.param;


import cn.lmx.kpu.sdk.request.DemoFileUploadRequest;
import cn.lmx.kpu.sdk.response.GetProductResponse;
import cn.lmx.kpu.sdkcore.param.BaseParam;

/**
 * @author lmx
 */
public class DemoFileUploadParam extends BaseParam<DemoFileUploadRequest, GetProductResponse> {
    @Override
    protected String method() {
        return "openapi.upload.more";
    }
}
