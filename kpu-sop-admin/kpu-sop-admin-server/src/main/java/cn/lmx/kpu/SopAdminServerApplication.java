package cn.lmx.kpu;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;
import cn.lmx.basic.validator.annotation.EnableFormValidator;
import cn.lmx.kpu.common.ServerApplication;

import java.net.UnknownHostException;

/**
 * SOP管理端启动类
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@SpringBootApplication
@EnableDiscoveryClient
@Configuration
@EnableFeignClients(value = {"cn.lmx.kpu", "cn.lmx.basic"})
@ComponentScan(basePackages = {"cn.lmx.kpu", "cn.lmx.basic"})
@EnableAspectJAutoProxy(proxyTargetClass = true, exposeProxy = true)
@Slf4j
@EnableFormValidator
@EnableScheduling
public class SopAdminServerApplication extends ServerApplication {
    public static void main(String[] args) throws UnknownHostException {
        start(SopAdminServerApplication.class, args);
    }
}
