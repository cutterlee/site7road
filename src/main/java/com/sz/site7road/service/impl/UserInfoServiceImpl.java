package com.sz.site7road.service.impl;

import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.usr.UsrDao;
import com.sz.site7road.entity.user.UserInfoEntity;
import com.sz.site7road.service.UsrService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Set;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 12:20
 * 备注： 用户信息服务实现类
 */
@Service
public class UserInfoServiceImpl extends AbstractBaseServiceImpl<UserInfoEntity> implements UsrService {

    @Resource
    private UsrDao usrDao;


    /**
     * 通过用户名查找用户信息
     *
     * @param username
     * @return
     */
    @Override
    public UserInfoEntity findUserInfoByUserName(String username) {
        return null;
    }

    /**
     * 通过用户查找用户的角色集合
     *
     * @param username
     * @return
     */
    @Override
    public Set<String> findRoleSetStr(String username) {
        return null;
    }

    @Override
    protected BaseDao getBaseDao() {
        return usrDao;
    }
}
