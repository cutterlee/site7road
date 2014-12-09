package com.sz.site7road.service.impl;

import com.google.common.base.Preconditions;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.role.RoleInfoDao;
import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.service.RoleInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
     * 通过角色，查找得到权限集合
     *
     * @param roleId 角色id
     * @return 权限的集合
     */
    @Override
    public List<ResourceEntity> findRolePerssionSet(int roleId) {
        return dao.findRolePermissionSet(roleId);
    }

    /**
     * 查找角色集合对应的权限
     *
     * @param roleInfoEntityList 角色集合
     * @return 对应的资源信息
     */
    @Override
    public List<ResourceEntity> findRolePerssions(List<RoleInfoEntity> roleInfoEntityList) {
        Preconditions.checkArgument(null!=roleInfoEntityList);
        Preconditions.checkArgument(!roleInfoEntityList.isEmpty());
        return dao.findRolePermissions(roleInfoEntityList);
    }

    @Override
    protected BaseDao getBaseDao() {
        return dao;
    }
}
