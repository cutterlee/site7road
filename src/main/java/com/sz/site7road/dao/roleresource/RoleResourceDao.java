package com.sz.site7road.dao.roleresource;

import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.entity.role.RoleResourceEntity;

import java.util.Collection;
import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/12 17:41.
 * remark:角色权限对应的dao
 */
public interface RoleResourceDao extends BaseDao<RoleResourceEntity>{

    /**
     * 删除某个用户对应的权限
     * @param roleId  角色id
     * @return  删除的结果
     */
    boolean removeByRoleId(int roleId);

    /**
     * 批量增加某用户的权限
     * @param resourceIdArray 权限id的数组
     * @param roleId  角色id
     * @return  批量增加的结果
     */
    boolean batchInsertResource(int[] resourceIdArray, int roleId);

    /**
     * 根据角色id找出权限的集合
     * @param roleId 角色id
     * @return roleId对应的权限集合
     */
    List<RoleResourceEntity> findResourceByRoleId(int roleId);

    /**
     * 查找多角色用户的权限
     * @param roleInfoEntityList 角色集合
     * @return 用户的权限集合
     */
    List<RoleResourceEntity> findResourceByRoleList(Collection<RoleInfoEntity> roleInfoEntityList);
}
