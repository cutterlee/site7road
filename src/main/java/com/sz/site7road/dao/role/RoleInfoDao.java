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
}
