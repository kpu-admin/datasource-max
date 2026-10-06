package cn.lmx.kpu.system.service.tenant.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.dynamic.datasource.creator.DataSourceProperty;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.common.constant.DsConstant;
import cn.lmx.kpu.system.entity.tenant.DefDatasourceConfig;
import cn.lmx.kpu.system.manager.tenant.DefDatasourceConfigManager;
import cn.lmx.kpu.system.service.tenant.DefDatasourceConfigService;
import cn.lmx.kpu.tenant.service.DataSourceService;

/**
 * <p>
 * 业务实现类
 * 数据源
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Slf4j
@Service
@DS(DsConstant.DEFAULTS)
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class DefDatasourceConfigServiceImpl extends SuperServiceImpl<DefDatasourceConfigManager, Long, DefDatasourceConfig>
        implements DefDatasourceConfigService {
    private final DataSourceService dataSourceService;

    @Override
    public Boolean testConnection(Long id) {
        DefDatasourceConfig config = superManager.getById(id);
        DataSourceProperty dataSourceProperty = BeanUtil.toBean(config, DataSourceProperty.class);
        return dataSourceService.testConnection(dataSourceProperty);
    }
}
