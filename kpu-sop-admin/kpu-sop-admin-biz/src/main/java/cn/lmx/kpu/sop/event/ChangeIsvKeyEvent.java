package cn.lmx.kpu.sop.event;

import java.util.List;

/**
 * ISV 公私钥变更事件
 * @param isvIds ISV集合
 * @author lmx
 */
public record ChangeIsvKeyEvent(List<Long> isvIds) {

}
