package com.sz.site7road.service;

import com.sz.site7road.entity.role.RoleInfoEntity;

import java.util.Set;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 12:16
 * 备注： 角色服务类
 */
public interface RoleInfoService  extends BaseService<RoleInfoEntity>{
    /**
     * 通过角色集合，查找得到权限集合
     *
     * @param roles
     * @return
     */
    Set<String> findPermissionSetStr(Set<String> roles);
}
