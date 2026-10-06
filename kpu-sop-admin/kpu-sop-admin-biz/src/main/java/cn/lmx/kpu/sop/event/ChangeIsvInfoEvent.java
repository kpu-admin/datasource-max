package cn.lmx.kpu.sop.event;

import java.util.Collection;

/**
 * isv 变更事件
 * @param isvIds isv集合
 * @author lmx
 */
public record ChangeIsvInfoEvent(Collection<Long> isvIds) {

}
