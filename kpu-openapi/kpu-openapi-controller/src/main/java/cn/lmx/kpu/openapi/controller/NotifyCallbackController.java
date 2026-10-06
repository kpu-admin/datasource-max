package cn.lmx.kpu.openapi.controller;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.gitee.sop.support.dto.ApiConfig;
import com.gitee.sop.support.exception.SignException;
import com.gitee.sop.support.util.SignUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 回调演示类
 * @author lmx
 * @since 2025-01-01 00:00
 */
@RestController
@Slf4j
public class NotifyCallbackController {
    // 平台下发的公钥：  sop_isv_keys 表的 public_key_platform 字段
    String publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq9IUj8G1dKVkMhQarWkz6Aj/iTXdX2zR+2JAbHFlytBbSL+zA86IrH8l7VFz4wLs6PbQfjKxngPiqMB2iTmTk4qCAzM38Xb7d+5WM3AVpvPIt6nQdNzah0DaEDFk3g2l45fuwUpOfelrSu9xIgi3OVU+y+gjjxj9WTIOML88Le5lBTWy2klGhXT/qgmyf+9wkW3PXnDrhABeiWEMRiWNXHIPPucvDLsQ2SQf/daQFKyW6jozBYF2NfcALspsaR+ZbLeZeG4D41EOq5JSGH/s/8MP5T2qPiGF3UCwHffnisS6MnsYpKctFDMK/Jong1Y8xNwGLdxZbhgR7yfoIZjypwIDAQAB";

    /**
     * 默认配置的回调地址
     * @param content
     * @return
     */
    @PostMapping("notify/callback")
    public ResponseEntity<String> callback(@RequestBody String content) {
        log.info("收到回调通知, content={}", content);
        JSONObject jsonObject = JSON.parseObject(content);
        // 签名校验
        if (!checkSign(jsonObject)) {
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE)
                    .body("ERR");
        }
        log.info("签名验证通过，处理业务逻辑");
        String method = jsonObject.getString("method");
        // 判断业务类型，处理不同业务
        switch (method) {
            // 处理订单创建回调
            case "shop.order.create":
                createOrder(jsonObject);
                break;
            case "shop.order.close":
                closeOrder(jsonObject);
                break;
            default:
                closeOrder(jsonObject);
        }
        // 返回200状态即可
        return ResponseEntity.ok("success");
    }

    private static void closeOrder(JSONObject jsonObject) {
        // 处理订单关闭回调
        JSONObject bizContent = jsonObject.getJSONObject("biz_content");
        log.info("业务参数，bizContent={}", bizContent);
    }

    private static void createOrder(JSONObject jsonObject) {
        JSONObject bizContent = jsonObject.getJSONObject("biz_content");
        log.info("业务参数，bizContent={}", bizContent);
    }

    /**
     * 自定义指定的回调地址
     *
     * @param content
     * @return
     */
    @PostMapping("notify/callback22")
    public ResponseEntity<String> callback22(@RequestBody String content) {
        log.info("callback22");
        return callback(content);
    }


    private boolean checkSign(JSONObject jsonObject) {
        try {
            ApiConfig apiConfig = new ApiConfig();
            return SignUtil.rsaCheckV2(jsonObject, publicKey, "UTF-8", SignUtil.RSA2, apiConfig);
        } catch (SignException e) {
            log.error("签名校验错误, jsonObject={}", jsonObject, e);
            return false;
        }
    }

}
