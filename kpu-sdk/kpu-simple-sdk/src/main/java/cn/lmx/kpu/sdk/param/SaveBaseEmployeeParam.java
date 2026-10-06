package cn.lmx.kpu.sdk.param;

import cn.lmx.kpu.sdk.request.SaveBaseEmployeeRequest;
import cn.lmx.kpu.sdk.response.GetBaseEmployeeResponse;
import cn.lmx.kpu.sdkcore.param.BaseParam;

public class SaveBaseEmployeeParam extends BaseParam<SaveBaseEmployeeRequest, GetBaseEmployeeResponse> {
    @Override
    protected String method() {
        return "openapi.employee.save";
    }

}
