package cn.lmx.kpu.oauth.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.context.ContextUtil;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.echo.properties.EchoProperties;
import cn.lmx.basic.interfaces.BaseEnum;
import cn.lmx.basic.utils.ClassUtils;
import cn.lmx.basic.utils.CollHelper;
import cn.lmx.basic.utils.StrPool;
import cn.lmx.kpu.base.entity.common.BaseDict;
import cn.lmx.kpu.base.manager.common.BaseDictManager;
import cn.lmx.kpu.common.properties.SystemProperties;
import cn.lmx.kpu.model.vo.result.Option;
import cn.lmx.kpu.oauth.service.DictService;
import cn.lmx.kpu.system.entity.system.DefDict;
import cn.lmx.kpu.system.manager.system.DefDictManager;
import cn.lmx.kpu.system.vo.result.system.DefDictItemResultVO;
import cn.lmx.kpu.system.vo.result.system.DefDictResultVO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringJoiner;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 * @author lmx
 * @date 2025-01-01 00:00
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class DictServiceImpl implements DictService {
    private static final Map<String, Map<String, String>> ENUM_MAP = new HashMap<>();
    private static final Map<String, List<Option>> ENUM_LIST_MAP = new HashMap<>();
    private static final Map<Option, List<Option>> TEMP_ENUM_LIST_MAP = new HashMap<>();
    /**
     * 过滤那些枚举
     */
    private static final Predicate<Class<?>> CLASS_FILTER = item -> item != null && item.isEnum() && MybatisEnumTypeHandler.isMpEnums(item);
    private final BaseDictManager baseDictManager;
    private final DefDictManager defDictManager;
    private final EchoProperties echoProperties;
    private final SystemProperties systemProperties;

    @PostConstruct
    public void init() {
        String enumPackage = systemProperties.getEnumPackage();
        if (StrUtil.isEmpty(enumPackage)) {
            log.warn("请在配置文件中配置{}.enumPackage", SystemProperties.PREFIX);
            return;
        }
        Set<Class<?>> enumClass = ClassUtils.scanPackage(enumPackage, CLASS_FILTER);

        StringJoiner enumSb = new StringJoiner(StrPool.COMMA);
        enumClass.forEach(item -> {
            Object[] enumConstants = item.getEnumConstants();
            BaseEnum[] baseEnums = Arrays.stream(enumConstants).map(i -> (BaseEnum) i).toArray(BaseEnum[]::new);

            ENUM_LIST_MAP.put(item.getSimpleName(), Option.mapOptions(baseEnums));
            ENUM_MAP.put(item.getSimpleName(), CollHelper.getMap(baseEnums));

            Option option = new Option();
            option.setValue(item.getSimpleName());

            // 2. 获取Schema注解的title属性
            Schema schemaAnnotation = item.getAnnotation(Schema.class);
            if (schemaAnnotation != null) {
                String description = schemaAnnotation.description();
                String title = schemaAnnotation.title();
                option.setLabel(description);
                if (StrUtil.isNotEmpty(title)) {
                    option.setValue(title);
                }
            } else {
                // 3. 获取类注释的首行内容
                System.err.println(item.getSimpleName() + "类上没有@Schema注解");
                option.setLabel(item.getSimpleName());
            }

            TEMP_ENUM_LIST_MAP.put(option, Option.mapOptions(baseEnums));
            enumSb.add(item.getSimpleName());
        });

        log.info("扫描: {} ,共加载了{}个枚举类, 分别为: {}", enumPackage, TEMP_ENUM_LIST_MAP.size(), enumSb);
    }

    /**
     * 查找本服务中，所有的枚举类
     * @return 枚举数据
     */
    public List<DefDictResultVO> findAll() {
        if (CollUtil.isEmpty(TEMP_ENUM_LIST_MAP)) {
            return Collections.emptyList();
        }
        Map<Option, List<Option>> map = new HashMap<>(TEMP_ENUM_LIST_MAP);

        // 将枚举的value值，转为字典key
        List<String> dictKeyList = new ArrayList<>();
        map.forEach((key, value) -> dictKeyList.add(key.getValue()));

        // 查询数据库库中的所有字典和字典项
        List<DefDict> existsList = defDictManager.list(Wraps.<DefDict>lbQ().in(DefDict::getKey, dictKeyList));
        List<DefDictResultVO> existsDictList = BeanUtil.copyToList(existsList, DefDictResultVO.class);
        existsDictList.forEach(dict -> {
            List<DefDict> itemList = defDictManager.list(Wraps.<DefDict>lbQ().eq(DefDict::getParentId, dict.getId()));
            List<DefDictItemResultVO> sysDictItemList = BeanUtil.copyToList(itemList, DefDictItemResultVO.class);
            dict.setItemList(sysDictItemList);
        });

        // 已存在的字典
        Map<String, DefDictResultVO> existingDictMap = new HashMap<>();
        // 已存在的字典项
        Map<String, DefDictItemResultVO> existingDictItemMap = new HashMap<>();
        for (DefDictResultVO sysDict : existsDictList) {
            existingDictMap.put(sysDict.getKey(), sysDict);
            List<DefDictItemResultVO> sysDictItemList = sysDict.getItemList();
            if (CollUtil.isNotEmpty(sysDictItemList)) {
                for (DefDictItemResultVO item : sysDictItemList) {
                    existingDictItemMap.put(sysDict.getKey() + item.getKey(), item);
                }
            }
        }

        List<DefDictResultVO> list = new ArrayList<>();
        map.forEach((key, value) -> {
            boolean exist = existingDictMap.containsKey(key.getValue());
            DefDictResultVO vo = new DefDictResultVO();
            vo.setKey(key.getValue());
            vo.setName(key.getLabel());
            vo.setDataType(key.getRemark());
            vo.setExist(exist);
            List<DefDictItemResultVO> itemList = new ArrayList<>();
            value.forEach(option -> {
                boolean itemExist = existingDictItemMap.containsKey(key.getValue() + option.getValue());
                DefDictItemResultVO item = new DefDictItemResultVO();
                item.setKey(option.getValue());
                item.setName(option.getLabel());
                item.setExist(itemExist);
                itemList.add(item);
            });
            vo.setItemList(itemList);
            list.add(vo);
        });
        return list;
    }


    @Override
    public void syncEnumToDict() {
        defDictManager.syncEnumToDict(TEMP_ENUM_LIST_MAP);
    }

    @Override
    public Map<Serializable, Object> findByIds(Set<Serializable> dictKeys) {
        // ① null + 空集合兜底:Echo 框架可能传 null
        if (CollUtil.isEmpty(dictKeys)) {
            return Collections.emptyMap();
        }

        try {
            String locale = ContextUtil.getLocale();

            if (ContextUtil.isEmptyTenantId()) {
                Map<Serializable, DefDict> defMap = defDictManager.findByIds(dictKeys);
                HashMap<Serializable, Object> map = MapUtil.newHashMap();
                execI18n(defMap, locale, map);
                return map;
            }

            Map<Serializable, BaseDict> baseMap = baseDictManager.findByIds(dictKeys);


            Set<String> baseKeys = baseMap.keySet().stream().map(item -> {
                List<String> arrays = StrUtil.split(String.valueOf(item), echoProperties.getDictSeparator());
                return CollUtil.isNotEmpty(arrays) ? arrays.get(0) : String.valueOf(item);
            }).collect(Collectors.toSet());
//        dictKeys 数量和 baseMap.key 数量相同，说明所有的字典在base库都自定义了
            if (baseKeys.size() == dictKeys.size()) {
                HashMap<Serializable, Object> map = MapUtil.newHashMap();
                execI18nBase(baseMap, locale, map);
                return map;
            }

            // 查询不在base的字典
            Set<Serializable> nonExistKeys = dictKeys.stream().filter(dictKey -> !baseKeys.contains(dictKey)).collect(Collectors.toSet());
            Map<Serializable, DefDict> defMap = defDictManager.findByIds(nonExistKeys);


            HashMap<Serializable, Object> map = MapUtil.newHashMap();

            // 顺序不能乱，一定是base的覆盖def的
            execI18n(defMap, locale, map);
            execI18nBase(baseMap, locale, map);

            return map;
        } catch (Exception e) {
            // ② 异常降级:Echo 失败不能拖垮调用方接口,前端 echoMapText 会自动回退到原 ID
            log.warn("[Echo] Dict findByIds failed, dictKeys={}, cause={}", dictKeys, e.getMessage());
            return Collections.emptyMap();
        }
    }

    private static void execI18n(Map<Serializable, DefDict> defMap, String locale, HashMap<Serializable, Object> map) {
        defMap.forEach((key, value) -> {
            String name = value.getName();
            if (StrUtil.isNotEmpty(locale)) {
                String i18nJson = value.getI18nJson();
                try {
                    JSONObject i18n = JSON.parseObject(i18nJson);
                    String i18nValue = i18n.getString(locale);
                    if (StrUtil.isNotEmpty(i18nValue)) {
                        name = i18nValue;
                    }
                } catch (Exception e) {

                }
            }
            map.put(key, name);
        });
    }

    private static void execI18nBase(Map<Serializable, BaseDict> defMap, String locale, HashMap<Serializable, Object> map) {
        defMap.forEach((key, value) -> {
            String name = value.getName();
            if (StrUtil.isNotEmpty(locale)) {
                String i18nJson = value.getI18nJson();
                try {
                    JSONObject i18n = JSON.parseObject(i18nJson);
                    String i18nValue = i18n.getString(locale);
                    if (StrUtil.isNotEmpty(i18nValue)) {
                        name = i18nValue;
                    }
                } catch (Exception e) {

                }
            }
            map.put(key, name);
        });
    }

    @Override
    public Map<String, List<DefDictItemResultVO>> findDictItemByType(List<String> dictKeys) {
        if (CollUtil.isEmpty(dictKeys)) {
            return Collections.emptyMap();
        }

        if (ContextUtil.isEmptyTenantId()) {
            return defDictManager.findDictMapItemListByKey(dictKeys);
        }

        Map<String, List<DefDictItemResultVO>> baseMap = baseDictManager.findDictMapItemListByKey(dictKeys);

        Set<String> baseKeys = baseMap.keySet().stream().map(type -> {
            List<String> arrays = StrUtil.split(String.valueOf(type), echoProperties.getDictSeparator());
            return CollUtil.isNotEmpty(arrays) ? arrays.get(0) : String.valueOf(type);
        }).collect(Collectors.toSet());
        // dictKeys 数量和 baseMap.key 数量相同，说明所有的字典在base库都自定义了
        if (baseKeys.size() == dictKeys.size()) {
            return baseMap;
        }

        // 查询不在base的字典
        List<String> nonExistKeys = dictKeys.stream().filter(dictKey -> !baseMap.containsKey(dictKey)).toList();
        Map<String, List<DefDictItemResultVO>> defMap = defDictManager.findDictMapItemListByKey(nonExistKeys);

        Map<String, List<DefDictItemResultVO>> map = MapUtil.newHashMap();
        map.putAll(defMap);
        map.putAll(baseMap);
        return map;
    }
}
