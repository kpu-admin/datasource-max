package cn.lmx.kpu.base.service.common;

import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.base.entity.common.BaseDict;
import cn.lmx.kpu.system.entity.system.DefDict;

import java.util.List;

/**
 * <p>
 * 业务接口
 * 字典
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 */
public interface BaseDictService extends SuperService<Long, BaseDict> {

    /**
     * 检查字典标识是否可用
     *
     * @param key 标识
     * @param id  当前id
     * @return
     */
    boolean checkByKey(String key, Long id);

    /**
     * 删除字典
     *
     * @param ids
     * @return
     */
    Boolean deleteDict(List<Long> ids);

    /**
     * 将系统字典导入到个性字典
     *
     * @param defDict  系统字典
     * @param itemList 系统字典项
     * @return java.lang.Boolean
     * @author lmx
     * @date 2025-01-01 00:00
     * @create [2025-01-01 00:00] [lmx] [初始创建]
     */
    Boolean saveDictAndItem(DefDict defDict, List<DefDict> itemList);
}
