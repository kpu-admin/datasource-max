package cn.lmx.kpu.sop.manager;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import cn.lmx.basic.base.manager.SuperManager;
import cn.lmx.basic.utils.SpringUtils;
import cn.lmx.kpu.sop.entity.SopPermGroupPermission;
import cn.lmx.kpu.sop.entity.SopPermIsvGroup;
import cn.lmx.kpu.sop.event.ChangeIsvPermEvent;

import java.util.List;

/**
 * <p>
 * 通用业务接口
 * 组权限表
 * </p>
 *
 * @author lmx
 * @since 2025-01-01 00:00
 *
 */
public interface SopPermGroupPermissionManager extends SuperManager<SopPermGroupPermission> {

    void refreshIsvPerm(Long groupId) ;
//

}


