package cn.lmx.kpu.sop.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import cn.lmx.basic.base.mapper.SuperMapper;
import cn.lmx.kpu.sop.entity.SopIsvInfo;

/**
 * <p>
 * Mapper 接口
 * isv信息表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Repository
@InterceptorIgnore(tenantLine = "true")
public interface SopIsvInfoMapper extends SuperMapper<SopIsvInfo> {
    @Select("""
                select t2.private_key_platform
                from sop_isv_info t inner join sop_isv_keys t2 on t.id = t2.isv_id
                where app_id=#{appId}
                limit 1
            """)
    String getPrivatePlatformKey(String appId);
}


