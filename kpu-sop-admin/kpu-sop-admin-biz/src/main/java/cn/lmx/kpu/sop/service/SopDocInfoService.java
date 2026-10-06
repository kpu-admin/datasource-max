package cn.lmx.kpu.sop.service;

import cn.hutool.core.lang.tree.Tree;
import cn.lmx.basic.base.service.SuperService;
import cn.lmx.kpu.sop.entity.SopDocApp;
import cn.lmx.kpu.sop.entity.SopDocInfo;
import cn.lmx.kpu.sop.vo.result.DocInfoViewVO;

import java.util.List;


/**
 * <p>
 * 业务接口
 * 文档信息
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopDocInfoService extends SuperService<Long, SopDocInfo> {
    List<Tree<Long>> tree(Long docAppId, Integer isPublic);

    Boolean publish(Long id, Integer isPublish);

    void syncAppDoc(Long docAppId);

    void syncDoc(Long docInfoId);

    void syncDocInfo(SopDocApp docApp, Long docInfoId);

    DocInfoViewVO getDocView(Long id);
}


