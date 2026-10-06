package cn.lmx.kpu.sdk;

import com.alibaba.fastjson2.JSON;
import junit.framework.TestCase;
import okhttp3.internal.http2.Header;
import cn.lmx.kpu.sdkcore.client.OpenHttp;
import cn.lmx.kpu.sdkcore.sign.SignUtil;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;


/**
 * 测试 Http 请求
 */
public class HttpPostTest extends TestCase {
    static OpenHttp httpTool = new OpenHttp();

    String url = "http://localhost:18750/api";
    String appId = "20261002819414021307381779";
    // 平台提供的私钥
    String privateKey = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC2ljtoEjrLO1deHrlIsNPytrkxEUkeweV5hj5oav889zZfwTCY1giW3+P9opRWgsBz7JqEbbm81p5yE8KTfCXKMGYxqqMDQNpQTwGJ7ZAJ4R1eeKgPHCvpPZh5l7CShWVwpGDxYBYa6F67usSwc8v9PS94Hl017WYlJ1oVwGjFo3dd/zBrLBpfV4kig8soJZT2jaYyzlt7xedIJ93txgiNobTqcgRMQOX7aSW7GzF/O3aedgtGfm4OQ1J14CqXGqI2np3lZdQYGjAYW1zcBWtOQDP/eFLeXBnGLko3msrdmcKQoricM80MVqwa8aN8rox9OFHBp3AWTBfbj84Qjn0vAgMBAAECggEAWS4jsf9FbEJ9t+D1ysVjoGcTKR4yQq2d8a9aCBJKvHJawoZPwDa6V0bfyuB/54lRis2D4y7cy5lgJoP0Q6kdpBXjtFqN6Gbiutr7+2xnMAweFiiEnWy7Hd8R/EHU4pv5If2HxB2UbmwU6UieDTlh5zzdVKQwDsj3XSpNW9Zw1ibf97TDWIM352CbZEQt6x6QTC4cE0BwMu1a+rE0keTbTuw4zOH2Kv/m93WdaLIoQNBEUtQULAKIaIHN4mo3IQbFApRiBMVEDja1VZfca+oxjx/TklBRfusnQAQTT6eK2b4OfMGEj+z2vcPrp5CdFFGJbblJSdB/kN134R2PsYnVAQKBgQDlDfCdDEaNXiZ5WvxCbsbqasZyhKSK0E/2hm+GjFAxgkA0A0gw9jVpuiM2geZweKvlgzcJ+xn0osKZOXWhU/rGMR5Vt0gHjBymBqceybi3puelL99rN54jJ1RGfuQUQRnR04XhGmC0OV1KqHnlcxcRAiGEfOWJpIQneppWm+7G7wKBgQDMEOcfovue3cZOCnzpc5RqAA78Q0O/VhU8RMwycIANG/zJA/8L5xpcaf3m62jsD3dC5epiLO6vCvimpecDT2S3t9F3wYxNR12f+tqIzUrRjcZbpEy441eHr5Jg2LqYmCyCNO5hvYmomOxJDxKZzSRFuj9jmMfnO7nC7qm9ZJWtwQKBgQCMoUNiWMAUWYLLrVYFv5e3IvlWJCQV6hG+LQnaFNnDm9GpXX58OR3QHO0zsQt3cE8xqZ8oLJfh/+/0PTgAZdwoxM14GQBLSfXo5VrD51vWvc2pOLw2Sr53nNT8Nzn3SYT9s52V+Cj5XeLuTIQSoNe/pIxJmJkhKfXNe1O46yHt1wKBgQDAiSooNVSG3eReeZLFiOF86bU52hUvj/7VMGwhIvgOZlupJXYcOt4qV27R00bZgvYZTmhIXPCOgyF7yogeHWh/1pVyElFYEH+Lk9lgvaFb+hIvIOOqhgVt5f+MFLBpjRphd6N64KPjSPWXMPtx1ZXlnAZ26A2kZDuuahQIt8BpgQKBgQDcXfV9+J/kFez45JzoHxI7LcN97R65Vzysrhu6xtG46oxi8wybAR2Cl9YZ8QTHxrSwtt9tHLUJDl5qXU2Vb3xWtkeq4hea0qZgC/zyxOIH4GD0FZO8BqytjPRWEF5a4dkHJKI5lMuCNfLnL2fWAwpQo2CdTAQbX0m3ccTzDIBP2g==";


    public static String postJson(String url, Map<String, String> params, Header... headers) {
        try {
            Map<String, String> headerMap = new LinkedHashMap<>();
            for (Header header : headers) {
                headerMap.put(header.name.utf8(), header.value.utf8());
            }
            return httpTool.requestJson(url, JSON.toJSONString(params), headerMap);
        } catch (IOException e) {
            throw new RuntimeException("网络请求异常", e);
        }
    }

    protected static String buildUrlQuery(Map<String, String> params) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, String> entry : params.entrySet()) {
            try {
                sb.append("&").append(entry.getKey()).append("=").append(URLEncoder.encode(entry.getValue(), "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return sb.toString().substring(1);
    }

    protected static String buildParamQuery(Map<String, String> params) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, String> entry : params.entrySet()) {
            sb.append("&").append(entry.getKey()).append("=").append(entry.getValue());
        }
        return sb.toString().substring(1);
    }

    /**
     参数	            类型	    是否必填	    最大长度	    描述	            示例值
     app_id	        String	是	        32	    平台分配给开发者的应用ID	2014072300007148
     method	        String	是	        128	    接口名称	alipay.trade.fastpay.refund.query
     format	        String	否	        40	    仅支持JSON	JSON
     charset	        String	是	        10	    请求使用的编码格式，如utf-8,gbk,gb2312等	utf-8
     sign_type	    String	是	        10	    商户生成签名字符串所使用的签名算法类型，目前支持RSA2和RSA，推荐使用RSA2	RSA2
     sign	        String	是	        344	    商户请求参数的签名串，详见签名	详见示例
     timestamp	    String	是	        19	    发送请求的时间，格式"yyyy-MM-dd HH:mm:ss"	2014-07-24 03:07:50
     version	        String	是	        3	    调用的接口版本，固定为：1.0	1.0
     app_auth_token	String	否	        40	    详见应用授权概述
     biz_content	    String	是		请求参数的集合，最大长度不限，除公共参数外所有请求参数都必须放在这个参数中传递，具体参照各产品快速接入文档
     */
    // 这个请求会路由到story服务
    public void testGet() throws Exception {

        // 公共请求参数
        Map<String, String> params = new HashMap<String, String>();
        params.put("app_id", appId);
        params.put("method", "openapi.wap.pay");
        params.put("format", "json");
        params.put("charset", "utf-8");
        params.put("sign_type", "RSA2");
        params.put("timestamp", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        params.put("version", "1.0");

        // 业务参数
        Map<String, Object> bizContent = new HashMap<>();
        bizContent.put("outTradeNo", "70501111111S001111119");
        bizContent.put("totalAmount", "9.00");
        bizContent.put("subject", "衣服");
        bizContent.put("productCode", "QUICK_WAP_WAY");

        params.put("biz_content", JSON.toJSONString(bizContent));
        String content = SignUtil.getSignContent(params);
        String sign = SignUtil.rsa256Sign(content, privateKey, "utf-8");
        params.put("sign", sign);

        System.out.println("----------- 请求信息 -----------");
        System.out.println("请求参数：" + buildParamQuery(params));
        System.out.println("商户秘钥：" + privateKey);
        System.out.println("待签名内容：" + content);
        System.out.println("签名(sign)：" + sign);
        System.out.println("URL参数：" + buildUrlQuery(params));

        System.out.println("----------- 返回结果 -----------");
        String responseData = postJson(url, params);// 发送请求
        System.out.println(responseData);
    }

    // 输出返回xml格式
    public void testGetXml() throws Exception {

        // 公共请求参数
        Map<String, String> params = new HashMap<String, String>();
        params.put("app_id", appId);
        params.put("method", "openapi.wap.pay");
        params.put("format", "xml");
        params.put("charset", "utf-8");
        params.put("sign_type", "RSA2");
        params.put("timestamp", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        params.put("version", "1.0");

        // 业务参数
        Map<String, Object> bizContent = new HashMap<>();
        bizContent.put("outTradeNo", "70501111111S001111119");
        bizContent.put("totalAmount", "9.00");
        bizContent.put("subject", "衣服");
        bizContent.put("productCode", "QUICK_WAP_WAY");

        params.put("biz_content", JSON.toJSONString(bizContent));
        String content = SignUtil.getSignContent(params);
        String sign = SignUtil.rsa256Sign(content, privateKey, "utf-8");
        params.put("sign", sign);

        System.out.println("----------- 请求信息 -----------");
        System.out.println("请求参数：" + buildParamQuery(params));
        System.out.println("商户秘钥：" + privateKey);
        System.out.println("待签名内容：" + content);
        System.out.println("签名(sign)：" + sign);
        System.out.println("URL参数：" + buildUrlQuery(params));

        System.out.println("----------- 返回结果 -----------");
        String responseData = postJson(url, params);// 发送请求
        System.out.println(responseData);
    }

    public void testSearch() throws Exception {

        // 公共请求参数
        Map<String, String> params = new HashMap<String, String>();
        params.put("app_id", appId);
        params.put("method", "openapi.order.search");
        params.put("format", "json");
        params.put("charset", "utf-8");
        params.put("sign_type", "RSA2");
        params.put("timestamp", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        params.put("version", "1.0");

        // 业务参数
        Map<String, Object> bizContent = new HashMap<>();
        bizContent.put("orderNo", "70501111111S001111119");

        params.put("biz_content", JSON.toJSONString(bizContent));
        String content = SignUtil.getSignContent(params);
        String sign = SignUtil.rsa256Sign(content, privateKey, "utf-8");
        params.put("sign", sign);

        System.out.println("----------- 请求信息 -----------");
        System.out.println("请求参数：" + buildParamQuery(params));
        System.out.println("商户秘钥：" + privateKey);
        System.out.println("待签名内容：" + content);
        System.out.println("签名(sign)：" + sign);
        System.out.println("URL参数：" + buildUrlQuery(params));

        System.out.println("----------- 返回结果 -----------");
        Header[] header = {new Header("open-env", "gray")};
//        Header[] header = new Header[0];
        String responseData = postJson(url, params, header);// 发送请求
        System.out.println(responseData);
    }
}
