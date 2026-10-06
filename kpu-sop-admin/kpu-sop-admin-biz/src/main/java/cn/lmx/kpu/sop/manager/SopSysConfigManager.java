package cn.lmx.kpu.sop.manager;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.sop.entity.SopSysConfig;
import cn.lmx.kpu.sop.vo.result.DocSettingDTO;

/**
 * <p>
 * 通用业务接口
 * 系统配置表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopSysConfigManager extends SuperManager<SopSysConfig> {
    SopSysConfig getByKey(String key);

    DocSettingDTO getDocSetting();
}


