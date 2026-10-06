package cn.lmx.kpu.sop.enums;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import cn.lmx.basic.interfaces.BaseEnum;

/**
 * isv创建方式
 * [0-后台创建 1-用户申请]
 * @author lmx
 * @since 2025-01-01 00:00
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Schema(description = "isv创建方式-枚举")
public enum CreationMethodEnum implements BaseEnum {
    CREATE(0, "后台创建"),

    APPLY_FOR(1, "用户申请");

    private Integer val;
    private String desc;

    @Override
    public String getCode() {
        return this.val.toString();
    }
}
