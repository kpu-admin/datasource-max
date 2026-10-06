package cn.lmx.kpu.sop.manager.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.sop.entity.SopDocContent;
import cn.lmx.kpu.sop.manager.SopDocContentManager;
import cn.lmx.kpu.sop.mapper.SopDocContentMapper;

/**
 * <p>
 * 通用业务实现类
 * 文档内容
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SopDocContentManagerImpl extends SuperManagerImpl<SopDocContentMapper, SopDocContent> implements SopDocContentManager {

    @Transactional(rollbackFor = Exception.class)
    public void saveContent(Long docInfoId, String content) {
        SopDocContent docContent = this.getOne(Wraps.<SopDocContent>lbQ().eq(SopDocContent::getDocInfoId, docInfoId));
        boolean save = false;
        if (docContent == null) {
            save = true;
            docContent = new SopDocContent();
        }
        docContent.setDocInfoId(docInfoId);
        docContent.setContent(content);
        if (save) {
            this.save(docContent);
        } else {
            this.updateById(docContent);
        }
    }


}


