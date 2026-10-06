package cn.lmx.kpu.test.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.test.entity.DefGenTestTree;

/**
 * <p>
 * Mapper 接口
 * 测试树结构
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Repository
@InterceptorIgnore(tenantLine = "true", dynamicTableName = "true")
public interface DefGenTestTreeMapper extends SuperMapper<DefGenTestTree> {

}


