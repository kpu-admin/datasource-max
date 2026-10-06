package cn.lmx.kpu.sop.event;

import java.util.List;

/**
 * 分组改变事件
 * @param isvIds isv集合
 * @author lmx
 */
public record ChangeIsvPermEvent(List<Long> isvIds) {

}
