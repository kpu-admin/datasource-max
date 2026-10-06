package com.gitee.sop.gateway.exception;

import com.gitee.sop.gateway.request.ApiRequestContext;
import com.gitee.sop.gateway.response.ApiResponse;

/**
 * @author lmx
 */
public interface ExceptionExecutor {

    ApiResponse executeException(ApiRequestContext apiRequestContext, Exception e);

}
