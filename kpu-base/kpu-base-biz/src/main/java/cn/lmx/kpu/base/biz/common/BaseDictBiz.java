package cn.lmx.kpu.base.biz.common;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.utils.ArgumentAssert;
import cn.lmx.kpu.base.service.common.BaseDictService;
import cn.lmx.kpu.system.entity.system.DefDict;
import cn.lmx.kpu.system.service.system.DefDictService;

import java.util.List;

/**
 * 字典大业务层
 *
 * @author lmx
 * @version v1.0.0
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [初始创建]
 */
@Service
@RequiredArgsConstructor
public class BaseDictBiz {
    private final DefDictService defDictService;
    private final BaseDictService baseDictService;

    public Boolean importDict(Long id) {
        DefDict defDict = defDictService.getById(id);
        ArgumentAssert.notNull(defDict, "系统字典不存在，请选择正确的字典进行导入");
        ArgumentAssert.isFalse(baseDictService.checkByKey(defDict.getKey(), null), "字典[{}]已存在，请勿重复导入", defDict.getKey());
        List<DefDict> itemList = defDictService.findItemByDictId(id);

        return baseDictService.saveDictAndItem(defDict, itemList);
    }
}
