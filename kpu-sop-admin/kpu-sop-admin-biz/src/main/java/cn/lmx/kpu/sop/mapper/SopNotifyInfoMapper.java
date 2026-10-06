package cn.lmx.kpu.sop.mapper;


import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.sop.entity.SopNotifyInfo;

/**
 * <p>
 * Mapper 接口
 * 回调信息
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Repository
@InterceptorIgnore(tenantLine = "true")
public interface SopNotifyInfoMapper extends SuperMapper<SopNotifyInfo> {


}
