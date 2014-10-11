package com.sz.site7road.service.impl;

import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.role.RoleInfoDao;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.service.RoleInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Set;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 12:16
 * 备注： 角色服务实现类
 */
@Service
public class RoleInfoServiceImpl extends AbstractBaseServiceImpl<RoleInfoEntity>  implements RoleInfoService {

    @Resource
    private RoleInfoDao dao;
    /**
     * 通过角色集合，查找得到权限集合
     *
     * @param roles
     * @return
     */
    @Override
    public Set<String> findPermissionSetStr(Set<String> roles) {
        return null;
    }

    @Override
    protected BaseDao getBaseDao() {
        return dao;
    }
}
