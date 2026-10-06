package cn.lmx.kpu.sdk.param;


import cn.lmx.kpu.sdk.request.DemoFileDownloadRequest;
import cn.lmx.kpu.sdk.request.DemoFileUploadRequest;
import cn.lmx.kpu.sdk.response.GetProductResponse;
import cn.lmx.kpu.sdkcore.param.BaseParam;
import cn.lmx.kpu.sdkcore.param.DownloadRequest;

/**
 * @author lmx
 */
public class DemoFileDownloadParam extends DownloadRequest<DemoFileDownloadRequest> {
    @Override
    protected String method() {
        return "openapi.download";
    }
}
