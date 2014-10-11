package com.sz.site7road.service;

import com.sz.site7road.entity.user.UserInfoEntity;

import java.util.Set;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/12 14:57.
 * remark:后台用户的服务类接口
 */
public interface UsrService extends BaseService<UserInfoEntity> {

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
}
