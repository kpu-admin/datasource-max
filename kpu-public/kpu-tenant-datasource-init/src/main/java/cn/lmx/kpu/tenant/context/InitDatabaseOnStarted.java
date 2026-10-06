package cn.lmx.kpu.tenant.context;

import lombok.AllArgsConstructor;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;
import cn.lmx.kpu.tenant.service.DatasourceInitDataSourceService;

/**
 * 初始化数据源
 * context已经refresh且application and command-line runners（StartedUpRunner） 调用之前发送这个事件
 *
 * <p>
 * 一定要在容器初始化完成后，在初始化租户数据源
 * <p>
 * 使用 @PostConstruct 注解不行
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@AllArgsConstructor
public class InitDatabaseOnStarted implements ApplicationListener<ApplicationStartedEvent> {

    private final DatasourceInitDataSourceService datasourceInitDataSourceService;

    @Override
    public void onApplicationEvent(ApplicationStartedEvent event) {
        datasourceInitDataSourceService.initDataSource();
    }


}
