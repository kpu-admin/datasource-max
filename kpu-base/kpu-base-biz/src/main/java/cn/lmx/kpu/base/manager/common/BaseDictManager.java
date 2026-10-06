package cn.lmx.kpu.base.manager.common;

import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.kpu.base.entity.common.BaseDict;
import cn.lmx.kpu.system.vo.result.system.DefDictItemResultVO;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 字典管理
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
public interface BaseDictManager extends SuperManager<BaseDict> {

    Map<Serializable, BaseDict> findByIds(Set<Serializable> dictKeys);

    /**
     * 根据字典key查询系统默认的字典条目
     *
     * @param dictKeys 字典key
     * @return key： 字典key  value: item list
     */
    Map<String, List<DefDictItemResultVO>> findDictMapItemListByKey(List<String> dictKeys);
}
