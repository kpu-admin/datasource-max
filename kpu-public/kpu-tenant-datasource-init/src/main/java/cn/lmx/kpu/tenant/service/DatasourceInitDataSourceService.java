package cn.lmx.kpu.tenant.service;

import com.baomidou.dynamic.datasource.annotation.DS;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import cn.lmx.kpu.common.constant.DsConstant;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@RequiredArgsConstructor
@Component
@Slf4j
public class DatasourceInitDataSourceService {
    private final DataSourceService dataSourceService;

    /**
     * 启动项目时，调用初始化数据源
     */
    @DS(DsConstant.DEFAULTS)
    public void initDataSource() {
        dataSourceService.loadSystemDataSource();
        dataSourceService.loadCustomDataSource();
        log.debug("初始化租户数据源成功");
    }

}
