package com.sz.site7road.service;

import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.entity.user.UserInfoEntity;

import java.util.List;
import java.util.Set;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/12 14:57.
 * remark:后台用户的服务类接口
 */
public interface UserService extends BaseService<UserInfoEntity> {

    /**
     * 通过用户名查找用户信息
     *
     * @param username
     * @return
     */
    UserInfoEntity findUserInfoByUserName(String username);

    /**
     * 通过用户查找用户的角色集合
     *
     * @param username
     * @return
     */
    Set<String> findRoleSetStr(String username);

    /**
     * 设置用户的角色信息
     * @param roleArray 角色id列表
     * @param uid 用户id
     * @return  先删除用户的角色信息,然后增加用户的角色信息
     */
    boolean setUserRole(List<Integer> roleArray,int uid);

    /**
     * 通过用户id得到角色的集合
     * @param uid 用户id
     * @return 用户对应的角色的集合
     */
    List<RoleInfoEntity> findRoleList(int uid);
}
