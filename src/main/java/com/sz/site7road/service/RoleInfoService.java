package com.sz.site7road.service;

import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.entity.role.RoleInfoEntity;

import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 12:16
 * 备注： 角色服务类
 */
public interface RoleInfoService  extends BaseService<RoleInfoEntity>{
    /**
     * 通过角色，查找得到权限集合
     *
     * @param roleId 角色id
     * @return  权限的集合
     */
    List<ResourceEntity> findRolePerssionSet(int roleId);

    /**
     * 查找角色集合对应的权限
     * @param roleInfoEntityList  角色集合
     * @return 对应的资源信息
     */
    List<ResourceEntity> findRolePerssions(List<RoleInfoEntity> roleInfoEntityList);
}
