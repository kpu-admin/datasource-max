package cn.lmx.kpu.sop.manager;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.sop.entity.SopDocContent;

/**
 * <p>
 * 通用业务接口
 * 文档内容
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopDocContentManager extends SuperManager<SopDocContent> {
    void saveContent(Long docInfoId, String content);
}


