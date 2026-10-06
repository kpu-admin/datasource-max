package cn.lmx.kpu.base.service.common;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.base.entity.common.BaseDict;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface BaseDictItemService extends SuperService<Long, BaseDict> {

    /**
     * 检查字典项标识是否可用
     *
     * @param key    标识
     * @param dictId 所属字典id
     * @param id     当前id
     * @return
     */
    boolean checkItemByKey(String key, Long dictId, Long id);


}
