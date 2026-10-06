package cn.lmx.kpu.sop.event;

import java.util.Collection;

/**
 * 文档改变事件
 * @param apiIds 接口id
 * @author lmx
 */
public record ChangeApiInfoEvent(Collection<Long> apiIds) {

}
