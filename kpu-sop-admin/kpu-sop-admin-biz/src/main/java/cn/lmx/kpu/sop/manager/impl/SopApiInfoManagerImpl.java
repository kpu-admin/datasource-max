package cn.lmx.kpu.sop.manager.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.manager.impl.SuperManagerImpl;
import cn.lmx.basic.database.mybatis.conditions.Wraps;
import cn.lmx.kpu.sop.entity.SopApiInfo;
import cn.lmx.kpu.sop.manager.SopApiInfoManager;
import cn.lmx.kpu.sop.mapper.SopApiInfoMapper;
import cn.lmx.kpu.sop.vo.query.SopApiInfoPageQuery;
import cn.lmx.kpu.sop.vo.result.SopApiInfoResultVO;

/**
 * <p>
 * 通用业务实现类
 * 接口信息表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class SopApiInfoManagerImpl extends SuperManagerImpl<SopApiInfoMapper, SopApiInfo> implements SopApiInfoManager {
    @Override
    public IPage<SopApiInfoResultVO> groupPage(IPage<SopApiInfo> page,
                                               SopApiInfoPageQuery query) {
        Wrapper<SopApiInfo> wrapper = Wraps.<SopApiInfo>lbQ()
                .eq(SopApiInfo::getApplication, query.getApplication())
                .eq(SopApiInfo::getApiName, query.getApiName())
                .eq(SopApiInfo::getStatus, query.getStatus());
        return baseMapper.groupPage(page, wrapper, query);
    }
}


