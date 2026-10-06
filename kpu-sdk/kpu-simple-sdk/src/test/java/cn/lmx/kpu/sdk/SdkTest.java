package cn.lmx.kpu.sdk;

import com.alibaba.fastjson2.JSON;
import junit.framework.TestCase;
import cn.lmx.kpu.sdk.param.DemoFileDownloadParam;
import cn.lmx.kpu.sdk.param.DemoFileUploadParam;
import cn.lmx.kpu.sdk.param.GetBaseEmployeeParam;
import cn.lmx.kpu.sdk.param.PayTradeWapPayParam;
import cn.lmx.kpu.sdk.request.DemoFileDownloadRequest;
import cn.lmx.kpu.sdk.request.DemoFileUploadRequest;
import cn.lmx.kpu.sdk.request.GetBaseEmployeeRequest;
import cn.lmx.kpu.sdk.request.PayTradeWapPayRequest;
import cn.lmx.kpu.sdk.response.GetBaseEmployeeResponse;
import cn.lmx.kpu.sdk.response.GetProductResponse;
import cn.lmx.kpu.sdk.response.PayTradeWapPayResponse;
import cn.lmx.kpu.sdkcore.client.OpenClient;
import cn.lmx.kpu.sdkcore.common.FileResult;
import cn.lmx.kpu.sdkcore.common.Result;
import cn.lmx.kpu.sdkcore.common.UploadFile;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 测试SDK
 */
public class SdkTest extends TestCase {
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
    String publicKeyPlatform = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq9IUj8G1dKVkMhQarWkz6Aj/iTXdX2zR+2JAbHFlytBbSL+zA86IrH8l7VFz4wLs6PbQfjKxngPiqMB2iTmTk4qCAzM38Xb7d+5WM3AVpvPIt6nQdNzah0DaEDFk3g2l45fuwUpOfelrSu9xIgi3OVU+y+gjjxj9WTIOML88Le5lBTWy2klGhXT/qgmyf+9wkW3PXnDrhABeiWEMRiWNXHIPPucvDLsQ2SQf/daQFKyW6jozBYF2NfcALspsaR+ZbLeZeG4D41EOq5JSGH/s/8MP5T2qPiGF3UCwHffnisS6MnsYpKctFDMK/Jong1Y8xNwGLdxZbhgR7yfoIZjypwIDAQAB";

    // 声明一个就行
    OpenClient client = new OpenClient(url, appId, privateKeyIsv, publicKeyPlatform);

    /**
     * 测试 查询员工
     */
    public void testGetBaseEmployee() {
        // 创建请求对象
        GetBaseEmployeeParam param = new GetBaseEmployeeParam();
        // 请求参数
        GetBaseEmployeeRequest model = new GetBaseEmployeeRequest();
        model.setId(1);
        param.setBizModel(model);

        // 发送请求
        Result<GetBaseEmployeeResponse> result = client.execute(param);

        if (result.isSuccess()) {
            GetBaseEmployeeResponse response = result.getData();
            // 返回结果
            System.out.printf("response:%s%n", JSON.toJSONString(response));
        } else {
            System.out.println("错误，subCode:" + JSON.toJSONString(result) + ", subMsg:" + result.getSubMsg());
        }
    }

    /**
     * 测试 - 手机网站支付接口
     */
    public void testTradeWapPay() {
        PayTradeWapPayParam param = new PayTradeWapPayParam();
        PayTradeWapPayRequest model = new PayTradeWapPayRequest();
        model.setOutTradeNo("70501111111S001111119");
        model.setTotalAmount(new BigDecimal("1000"));
        model.setSubject("衣服");
        model.setProductCode("QUICK_WAP_WAY");

        param.setBizModel(model);

        Result<PayTradeWapPayResponse> result = client.execute(param);
        if (result.isSuccess()) {
            PayTradeWapPayResponse response = result.getData();
            System.out.println(response);
        } else {
            System.out.println(result);
        }
    }


    // 文件上传
    public void testUpload() throws IOException {
        DemoFileUploadParam request = new DemoFileUploadParam();

        DemoFileUploadRequest model = new DemoFileUploadRequest();
        model.setProductName("上传文件参数");
        model.setAddTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        request.setBizModel(model);

        String root = System.getProperty("user.dir");
        System.out.println(root);
        // 这里演示将resources下的两个文件上传到服务器
        request.addFile(new UploadFile("idCardFront", new File(root + "/src/test/resources/file1.txt")));
        request.addFile(new UploadFile("idCardBack", new File(root + "/src/test/resources/file2.txt")));

        Result<GetProductResponse> result = client.execute(request);

        System.out.println("--------------------");
        if (result.isSuccess()) {
            GetProductResponse response = result.getData();
            System.out.println("您上传的文件信息：" + response);
        } else {
            System.out.println(JSON.toJSONString(result));
        }
        System.out.println("--------------------");
    }


    public void testDownload() {
        DemoFileDownloadParam request = new DemoFileDownloadParam();
        DemoFileDownloadRequest model = new DemoFileDownloadRequest();
        model.setId(123);
        request.setBizModel(model);
        Result<FileResult> execute = client.execute(request);

        System.out.println(execute);
    }

}
