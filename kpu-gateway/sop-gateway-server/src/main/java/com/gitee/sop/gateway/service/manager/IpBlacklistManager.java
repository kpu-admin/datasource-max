package com.gitee.sop.gateway.service.manager;

/**
 * IP黑名单管理
 *
 * @author lmx
 */
public interface IpBlacklistManager {

    boolean contains(String ip);

}
