package com.sz.site7road.dao.role;

import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.entity.role.RoleInfoEntity;

import java.util.List;

/**
 * USER： cutter.li
 * CREATE TIME： 2014-08-01 17:56
 * REMARK：系统角色信息dao接口
 */
public interface RoleInfoDao extends BaseDao<RoleInfoEntity>{
    /**
     * 根据角色id查询到权限的集合
     * @param roleId 角色id
     * @return 权限的集合
     */
    List<ResourceEntity> findRolePermissionSet(int roleId);

    /**
     * 设置用户的角色
     * @param roleArray 角色的id数组
     * @param uid 用户id
     * @return 设置用户的角色的处理结果
     */
    boolean setUserRole(List<Integer> roleArray, int uid);

    /**
     * 查找到用户的角色集合
     * @param uid
     * @return
     */
    List<RoleInfoEntity> findRoleListByUid(int uid);

    /**
     * 批量删除用户的角色
     * @param uid
     * @return
     */
   boolean removeRoleListByUid(int uid);

    /**
     * 查找角色集合对应的资源集合
     * @param roleInfoEntityList 角色集合
     * @return  资源集合
     */
    List<ResourceEntity> findRolePermissions(List<RoleInfoEntity> roleInfoEntityList);
}
