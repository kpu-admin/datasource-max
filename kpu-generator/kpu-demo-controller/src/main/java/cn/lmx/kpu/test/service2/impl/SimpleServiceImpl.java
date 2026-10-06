package cn.lmx.kpu.test.service2.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import cn.lmx.basic.base.service.impl.SuperServiceImpl;
import cn.lmx.kpu.test.entity.DefGenTestSimple;
import cn.lmx.kpu.test.manager2.SimpleManager;
import cn.lmx.kpu.test.service2.SimpleService;
import cn.lmx.kpu.test.vo.save.DefGenTestSimpleSaveVO;


/**
 * <p>
 * 业务接口
 * 测试单表
 * </p>
 *
 * @author lmx
 * @date 2025-01-01 00:00
 * @create [2025-01-01 00:00] [lmx] [代码生成器生成]
 */
@Service
@RequiredArgsConstructor
public class SimpleServiceImpl extends SuperServiceImpl<SimpleManager, Long, DefGenTestSimple>
        implements SimpleService {


    @Override
    public <SaveVO> DefGenTestSimple save(SaveVO saveVO) {
        DefGenTestSimpleSaveVO sssss = (DefGenTestSimpleSaveVO) saveVO;
        return super.save(saveVO);
    }
//    @Override
//    public <SaveVO> DefGenTestSimple save(DefGenTestSimple saveVO) {
//        return super.save(saveVO);
//    }
}


