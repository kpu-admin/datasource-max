package cn.lmx.kpu.sop.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.sop.entity.SopIsvKeys;
import cn.lmx.kpu.sop.manager.SopIsvKeysManager;
import cn.lmx.kpu.sop.service.SopIsvKeysService;
import cn.lmx.kpu.sop.vo.update.SopIsvKeysUpdateVO;

/**
 * <p>
 * 业务实现类
 * ISV秘钥管理
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
public class SopIsvKeysServiceImpl extends SuperServiceImpl<SopIsvKeysManager, Long, SopIsvKeys> implements SopIsvKeysService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean saveKeys(SopIsvKeysUpdateVO updateVO) {
        SopIsvKeys isvKeys = superManager.getOne(Wrappers.<SopIsvKeys>lambdaQuery().eq(SopIsvKeys::getIsvId, updateVO.getIsvId()));
        if (isvKeys == null) {
            isvKeys = new SopIsvKeys();
        }
        BeanUtil.copyProperties(updateVO, isvKeys);
        boolean cnt = superManager.saveOrUpdate(isvKeys);
        // 发送变更事件
        superManager.sendChangeEvent(updateVO.getIsvId());
        return cnt;
    }

    @Override
    public SopIsvKeys getByIsvId(Long isvId) {
        return superManager.getOne(Wrappers.<SopIsvKeys>lambdaQuery().eq(SopIsvKeys::getIsvId, isvId));
    }
}


