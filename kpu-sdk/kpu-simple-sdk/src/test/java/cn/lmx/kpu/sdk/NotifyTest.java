package cn.lmx.kpu.sdk;

import com.alibaba.fastjson2.JSON;
import junit.framework.TestCase;
import cn.lmx.kpu.sdk.param.SaveBaseEmployeeParam;
import cn.lmx.kpu.sdk.request.SaveBaseEmployeeRequest;
import cn.lmx.kpu.sdk.response.GetBaseEmployeeResponse;
import cn.lmx.kpu.sdkcore.client.OpenClient;
import cn.lmx.kpu.sdkcore.common.Result;

/**
 * 回调接口测试类
 * @author lmx
 * @since 2025-01-01 00:00
 */
public class NotifyTest extends TestCase {
    String url = "http://localhost:18750/api";
    String appId = "20261002819414021307381779";

    /**
     * 开发者私钥
     */
    String privateKeyIsv = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC2ljtoEjrLO1deHrlIsNPytrkxEUkeweV5hj5oav889zZfwTCY1giW3+P9opRWgsBz7JqEbbm81p5yE8KTfCXKMGYxqqMDQNpQTwGJ7ZAJ4R1eeKgPHCvpPZh5l7CShWVwpGDxYBYa6F67usSwc8v9PS94Hl017WYlJ1oVwGjFo3dd/zBrLBpfV4kig8soJZT2jaYyzlt7xedIJ93txgiNobTqcgRMQOX7aSW7GzF/O3aedgtGfm4OQ1J14CqXGqI2np3lZdQYGjAYW1zcBWtOQDP/eFLeXBnGLko3msrdmcKQoricM80MVqwa8aN8rox9OFHBp3AWTBfbj84Qjn0vAgMBAAECggEAWS4jsf9FbEJ9t+D1ysVjoGcTKR4yQq2d8a9aCBJKvHJawoZPwDa6V0bfyuB/54lRis2D4y7cy5lgJoP0Q6kdpBXjtFqN6Gbiutr7+2xnMAweFiiEnWy7Hd8R/EHU4pv5If2HxB2UbmwU6UieDTlh5zzdVKQwDsj3XSpNW9Zw1ibf97TDWIM352CbZEQt6x6QTC4cE0BwMu1a+rE0keTbTuw4zOH2Kv/m93WdaLIoQNBEUtQULAKIaIHN4mo3IQbFApRiBMVEDja1VZfca+oxjx/TklBRfusnQAQTT6eK2b4OfMGEj+z2vcPrp5CdFFGJbblJSdB/kN134R2PsYnVAQKBgQDlDfCdDEaNXiZ5WvxCbsbqasZyhKSK0E/2hm+GjFAxgkA0A0gw9jVpuiM2geZweKvlgzcJ+xn0osKZOXWhU/rGMR5Vt0gHjBymBqceybi3puelL99rN54jJ1RGfuQUQRnR04XhGmC0OV1KqHnlcxcRAiGEfOWJpIQneppWm+7G7wKBgQDMEOcfovue3cZOCnzpc5RqAA78Q0O/VhU8RMwycIANG/zJA/8L5xpcaf3m62jsD3dC5epiLO6vCvimpecDT2S3t9F3wYxNR12f+tqIzUrRjcZbpEy441eHr5Jg2LqYmCyCNO5hvYmomOxJDxKZzSRFuj9jmMfnO7nC7qm9ZJWtwQKBgQCMoUNiWMAUWYLLrVYFv5e3IvlWJCQV6hG+LQnaFNnDm9GpXX58OR3QHO0zsQt3cE8xqZ8oLJfh/+/0PTgAZdwoxM14GQBLSfXo5VrD51vWvc2pOLw2Sr53nNT8Nzn3SYT9s52V+Cj5XeLuTIQSoNe/pIxJmJkhKfXNe1O46yHt1wKBgQDAiSooNVSG3eReeZLFiOF86bU52hUvj/7VMGwhIvgOZlupJXYcOt4qV27R00bZgvYZTmhIXPCOgyF7yogeHWh/1pVyElFYEH+Lk9lgvaFb+hIvIOOqhgVt5f+MFLBpjRphd6N64KPjSPWXMPtx1ZXlnAZ26A2kZDuuahQIt8BpgQKBgQDcXfV9+J/kFez45JzoHxI7LcN97R65Vzysrhu6xtG46oxi8wybAR2Cl9YZ8QTHxrSwtt9tHLUJDl5qXU2Vb3xWtkeq4hea0qZgC/zyxOIH4GD0FZO8BqytjPRWEF5a4dkHJKI5lMuCNfLnL2fWAwpQo2CdTAQbX0m3ccTzDIBP2g==";

    /**
     * 开放平台提供的公钥
     * 前往【开发运营系统】--开放平台，ISV管理--秘钥管理，生成平台提供的公私钥，然后把【平台公钥】放到这里
     */
    String publicKeyPlatform = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0P89xTOCMISUkNa7Xx/Ce7st3IxnM+6fdMZaavpkx4E5WX+Mif/O8jgQNtOUZz/oV+2PR9NJhVY77fa7tbEiOmMAmwsNGWuTLjboDR0g2GCPSkyNjpFt22l8343hlJMHgl52aYKFBAbeMB7DcDOFVydRWCDywFOEM1S6Fqzhmrbi6paskLEMpu1WnC/N/CUop/dHyonH2fSSf7O7ZtV4MamGC0C30ywrC8jh57YsTpjsA2ex+EectqzAn1/2bBJfBXNPAKi2l3qSfCK0fdmLiTt8l4LgqfpW5IoryRxdIpONKFXeQIRSQskxQvAkg9Q6IFPb89gmnGsjQTURlFeM9wIDAQAB";

    // 声明一个就行
    OpenClient client = new OpenClient(url, appId, privateKeyIsv, publicKeyPlatform);

    /**
     * 测试 查询员工
     */
    public void testSaveBaseEmployee() {
        // 创建请求对象
        SaveBaseEmployeeParam param = new SaveBaseEmployeeParam();
        // 请求参数
        SaveBaseEmployeeRequest model = new SaveBaseEmployeeRequest();
        model.setActiveStatus(1111);
        model.setPositionStatus(222);
        model.setName("我要新增一个用户");
        param.setBizModel(model);
        // 这里提供了 kpu-openapi-server 的一个接口地址作为测试
        param.setNotifyUrl("http://localhost:18766/notify/callback22");

        // 发送请求
        Result<GetBaseEmployeeResponse> result = client.execute(param);

        if (result.isSuccess()) {
            GetBaseEmployeeResponse response = result.getData();
            // 返回结果
            System.err.printf("调用成功:%s%n", JSON.toJSONString(result));
        } else {
            System.err.println("调用错误，subCode:" + JSON.toJSONString(result) + ", subMsg:" + result.getSubMsg());
        }
    }

}
