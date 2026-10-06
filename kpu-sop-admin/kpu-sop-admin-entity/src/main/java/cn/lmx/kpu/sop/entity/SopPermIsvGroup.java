package cn.lmx.kpu.sop.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import cn.lmx.basic.base.entity.Entity;

import java.io.Serial;

import static com.baomidou.mybatisplus.annotation.SqlCondition.EQUAL;


/**
 * <p>
 * 实体类
 * isv分组
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = true)
@Builder
@TableName("sop_perm_isv_group")
public class SopPermIsvGroup extends Entity<Long> {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ISV
     */
    @TableField(value = "isv_id", condition = EQUAL)
    private Long isvId;
    /**
     * 分组
     * perm_group.id
     */
    @TableField(value = "group_id", condition = EQUAL)
    private Long groupId;


}
