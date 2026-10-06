package cn.lmx.kpu.tenant.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import cn.lmx.kpu.tenant.model.DefDatasourceConfigBO;
import cn.lmx.kpu.tenant.model.DefTenantBO;

import java.util.List;

/**
 * 初始化数据库DAO
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Repository
@InterceptorIgnore(tenantLine = "true", dynamicTableName = "true")
public interface InitDatabaseMapper {
    /**
     * 创建数据库
     *
     * @param database 数据库名
     * @return
     */
    int createDatabase(@Param("database") String database, @Param("username") String username);

    /**
     * 授权
     *
     * @param database database
     * @return int
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00] [lmx] [初始创建]
     */
    int grant(@Param("database") String database);


    /**
     * 删除数据库
     *
     * @param database
     * @return
     */
    int dropDatabase(@Param("database") String database);

    /**
     * 根据条件查询租户列表
     *
     * @param status      状态
     * @param connectType 连接类型
     * @return 租户编码
     */
    List<Long> selectTenantCodeList(@Param("status") List<String> status, @Param("connectType") String connectType);


    /**
     * 查询所有租户的数据源
     *
     * @param status      状态
     * @param connectType 连接类型
     * @return
     */
    List<DefDatasourceConfigBO> selectDataSourceConfig(@Param("status") List<String> status, @Param("connectType") String connectType);

    /**
     * 根据租户id，查询租户的 数据源配置
     *
     * @param tenantId tenantId
     * @return java.util.List<cn.lmx.kpu.tenant.model.DefDatasourceConfigBO>
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00] [lmx] [初始创建]
     */
    List<DefDatasourceConfigBO> selectDataSourceConfigByTenantId(@Param("tenantId") Long tenantId);

    /**
     * 根据租户ID查询租户
     *
     * @param tenantId tenantId
     * @return cn.lmx.kpu.tenant.model.DefTenantBO
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00] [lmx] [初始创建]
     */
    DefTenantBO getTenantById(@Param("tenantId") Long tenantId);
}
