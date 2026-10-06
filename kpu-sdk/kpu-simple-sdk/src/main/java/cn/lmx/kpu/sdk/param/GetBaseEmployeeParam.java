package cn.lmx.kpu.sdk.param;

import cn.lmx.kpu.sdk.request.GetBaseEmployeeRequest;
import cn.lmx.kpu.sdk.response.GetBaseEmployeeResponse;
import cn.lmx.kpu.sdkcore.param.BaseParam;

public class GetBaseEmployeeParam extends BaseParam<GetBaseEmployeeRequest, GetBaseEmployeeResponse> {
    @Override
    protected String method() {
        return "openapi.employee.get";
    }

}
