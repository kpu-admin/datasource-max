/*
 * Copyright 2017 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package cn.lmx.kpu.sdkcore.util;

import java.lang.reflect.*;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * @author lmx
 */
public class ClassUtil {

    private static final Map<String, Class<?>> classGenricTypeCache = new HashMap<>(16);

    /**
     * 返回定义类时的泛型参数的类型. <br>
     * 如:定义一个BookManager类<br>
     * <code>{@literal public BookManager extends GenricManager<Book,Address>}{...} </code>
     * <br>
     * 调用getSuperClassGenricType(getClass(),0)将返回Book的Class类型<br>
     * 调用getSuperClassGenricType(getClass(),1)将返回Address的Class类型
     *
     * @param clazz 从哪个类中获取
     * @param index 泛型参数索引,从0开始
     */
    public static Class<?> getSuperClassGenricType(Class<?> clazz, int index) throws IndexOutOfBoundsException {
        String cacheKey = clazz.getName() + index;
        Class<?> cachedClass = classGenricTypeCache.get(cacheKey);
        if (cachedClass != null) {
            return cachedClass;
        }

        Type genType = clazz.getGenericSuperclass();

        // 没有泛型参数
        if (!(genType instanceof ParameterizedType)) {
            throw new RuntimeException("class " + clazz.getName() + " 没有指定父类泛型");
        } else {
            Type[] params = ((ParameterizedType) genType).getActualTypeArguments();

            if (index >= params.length || index < 0) {
                throw new RuntimeException("泛型索引不正确，index:" + index);
            }
            Type cls = params[index];
            if (cls instanceof ParameterizedType) {
                ParameterizedType parameterizedType = (ParameterizedType) cls;
                Type rawType = parameterizedType.getRawType();
                if (Collection.class.isAssignableFrom((Class<?>) rawType)) {
                    Type actualTypeArgument = parameterizedType.getActualTypeArguments()[0];
                    return (Class<?>) actualTypeArgument;
                } else {
                    return (Class<?>) cls;
                }
            }
            if (!(params[index] instanceof Class)) {
                throw new RuntimeException(params[index] + "不是Class类型");
            }

            return (Class<?>) params[index];
        }
    }

    public static boolean isArray(Class<?> clazz, int index) {
        Type genType = clazz.getGenericSuperclass();

        // 没有泛型参数
        if (!(genType instanceof ParameterizedType)) {
            throw new RuntimeException("class " + clazz.getName() + " 没有指定父类泛型");
        } else {
            Type[] params = ((ParameterizedType) genType).getActualTypeArguments();

            if (index >= params.length || index < 0) {
                throw new RuntimeException("泛型索引不正确，index:" + index);
            }
            Type cls = params[index];
            if (cls instanceof ParameterizedType) {
                ParameterizedType parameterizedType = (ParameterizedType) cls;
                Type rawType = parameterizedType.getRawType();
                return Collection.class.isAssignableFrom((Class<?>) rawType);
            }
            return false;
        }
    }

    /**
     * 返回指定父类定义的泛型参数的类型，会自动沿着继承链向上查找并完成泛型变量的替换。<br>
     * 如：<br>
     * <code>
     * public class DownloadRequest&lt;Req&gt; extends BaseParam&lt;Req, FileResult&gt;
     * public class DemoFileDownloadParam extends DownloadRequest&lt;DemoFileDownloadRequest&gt;
     * </code><br>
     * 调用getSuperClassGenricType(DemoFileDownloadParam.class, BaseParam.class, 1)将返回FileResult的Class类型
     *
     * @param clazz             从哪个类中获取
     * @param genericSuperClass 声明泛型的父类
     * @param index             泛型参数索引,从0开始
     */
    public static Class<?> getSuperClassGenricType(Class<?> clazz, Class<?> genericSuperClass, int index) {
        String cacheKey = clazz.getName() + "@" + genericSuperClass.getName() + index;
        Class<?> cachedClass = classGenricTypeCache.get(cacheKey);
        if (cachedClass != null) {
            return cachedClass;
        }

        Class<?> current = clazz;
        Map<TypeVariable<?>, Type> resolved = new HashMap<>(8);
        Type[] args = null;
        while (current != null && !current.equals(genericSuperClass)) {
            Type genType = current.getGenericSuperclass();
            Class<?> raw = rawClass(genType);
            if (raw == null) {
                break;
            }
            Type[] actualArgs = actualTypeArguments(genType);
            // 命中目标泛型声明，记录其实参后结束查找
            if (raw.equals(genericSuperClass)) {
                args = actualArgs;
                break;
            }
            TypeVariable<?>[] variables = raw.getTypeParameters();
            for (int i = 0; i < variables.length && i < actualArgs.length; i++) {
                resolved.put(variables[i], actualArgs[i]);
            }
            current = raw;
        }

        if (args == null) {
            throw new RuntimeException(clazz.getName() + " 没有继承泛型化的 " + genericSuperClass.getName());
        }
        if (index >= args.length || index < 0) {
            throw new RuntimeException("泛型索引不正确，index:" + index);
        }
        Type target = resolve(args[index], resolved);
        Class<?> result = toClass(target, clazz);
        classGenricTypeCache.put(cacheKey, result);
        return result;
    }

    private static Type[] actualTypeArguments(Type genType) {
        if (genType instanceof ParameterizedType) {
            return ((ParameterizedType) genType).getActualTypeArguments();
        }
        return new Type[0];
    }

    private static Class<?> rawClass(Type type) {
        if (type instanceof Class) {
            return (Class<?>) type;
        }
        if (type instanceof ParameterizedType) {
            Type rawType = ((ParameterizedType) type).getRawType();
            return rawType instanceof Class ? (Class<?>) rawType : null;
        }
        return null;
    }

    /**
     * 将类型变量替换为实际类型
     */
    private static Type resolve(Type type, Map<TypeVariable<?>, Type> resolved) {
        Type current = type;
        // 防止循环引用
        for (int i = 0; i < 16; i++) {
            if (current instanceof TypeVariable) {
                Type actual = resolved.get(current);
                if (actual == null || actual.equals(current)) {
                    return current;
                }
                current = actual;
            } else if (current instanceof ParameterizedType) {
                ParameterizedType parameterizedType = (ParameterizedType) current;
                Type[] args = parameterizedType.getActualTypeArguments();
                Type[] newArgs = new Type[args.length];
                boolean changed = false;
                for (int j = 0; j < args.length; j++) {
                    newArgs[j] = resolve(args[j], resolved);
                    changed |= !newArgs[j].equals(args[j]);
                }
                if (!changed) {
                    return current;
                }
                return new ResolvedParameterizedType(parameterizedType.getRawType(), newArgs, parameterizedType.getOwnerType());
            } else {
                return current;
            }
        }
        return current;
    }

    /**
     * 将类型转换为Class，集合取其元素类型，数组取其组件类型
     */
    private static Class<?> toClass(Type type, Class<?> clazz) {
        if (type instanceof Class) {
            return (Class<?>) type;
        }
        if (type instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) type;
            Class<?> raw = rawClass(parameterizedType.getRawType());
            if (raw != null && Collection.class.isAssignableFrom(raw)) {
                Type[] args = parameterizedType.getActualTypeArguments();
                if (args.length == 1) {
                    return toClass(args[0], clazz);
                }
            }
            return raw;
        }
        if (type instanceof GenericArrayType) {
            Class<?> component = toClass(((GenericArrayType) type).getGenericComponentType(), clazz);
            return component == null ? null : Array.newInstance(component, 0).getClass();
        }
        if (type instanceof WildcardType) {
            Type[] upper = ((WildcardType) type).getUpperBounds();
            return upper.length > 0 ? toClass(upper[0], clazz) : Object.class;
        }
        throw new RuntimeException(clazz.getName() + " 的泛型 " + type + " 无法解析为Class类型");
    }

    /**
     * 内部使用的ParameterizedType实现
     */
    private static final class ResolvedParameterizedType implements ParameterizedType {
        private final Type rawType;
        private final Type[] actualTypeArguments;
        private final Type ownerType;

        ResolvedParameterizedType(Type rawType, Type[] actualTypeArguments, Type ownerType) {
            this.rawType = rawType;
            this.actualTypeArguments = actualTypeArguments;
            this.ownerType = ownerType;
        }

        @Override
        public Type[] getActualTypeArguments() {
            return actualTypeArguments.clone();
        }

        @Override
        public Type getRawType() {
            return rawType;
        }

        @Override
        public Type getOwnerType() {
            return ownerType;
        }

        @Override
        public String toString() {
            return rawType + Arrays.toString(actualTypeArguments);
        }
    }

}
