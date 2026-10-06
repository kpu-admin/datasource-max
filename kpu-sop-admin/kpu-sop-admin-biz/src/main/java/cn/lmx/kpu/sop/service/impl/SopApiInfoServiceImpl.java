package cn.lmx.kpu.sop.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.request.PageParams;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.basic.database.mybatis.conditions.update.LbUpdateWrap;
import cn.lmx.kpu.model.vo.save.StatusUpdateVO;
import cn.lmx.kpu.sop.entity.SopApiInfo;
import cn.lmx.kpu.sop.manager.SopApiInfoManager;
import cn.lmx.kpu.sop.service.SopApiInfoService;
import cn.lmx.kpu.sop.vo.query.SopApiInfoPageQuery;
import cn.lmx.kpu.sop.vo.result.SopApiInfoResultVO;

import java.util.Collection;

/**
 * <p>
 * 业务实现类
 * 接口信息表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class SopApiInfoServiceImpl extends SuperServiceImpl<SopApiInfoManager, Long, SopApiInfo> implements SopApiInfoService {

    @Override
    public IPage<SopApiInfoResultVO> groupPage(PageParams<SopApiInfoPageQuery> params) {
        IPage<SopApiInfo> page = params.buildPage();
        return superManager.groupPage(page, params.getModel());
    }

    /**
     * 修改状态
     *
     * @param statusUpdate 修改值
     * @return 返回影响行数
     */
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateStatus(StatusUpdateVO statusUpdate) {
        LbUpdateWrap<SopApiInfo> wrapper = Wraps.<SopApiInfo>lbU().set(SopApiInfo::getStatus, statusUpdate.getStatus())
                .eq(SopApiInfo::getId, statusUpdate.getId());
        boolean cnt = superManager.update(wrapper);
        superManager.sendChangeEvent(statusUpdate.getId());
        return cnt;
    }


    @Override
    protected <UpdateVO> void updateAfter(UpdateVO updateVO, SopApiInfo entity) {
        superManager.sendChangeEvent(entity.getId());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean removeByIds(Collection<Long> idList) {
        boolean cnt = getSuperManager().removeByIds(idList);
        superManager.sendChangeEvent(idList);
        return cnt;
    }

}


