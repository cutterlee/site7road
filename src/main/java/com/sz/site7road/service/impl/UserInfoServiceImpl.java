package com.sz.site7road.service.impl;

import com.google.common.base.Preconditions;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.role.RoleInfoDao;
import com.sz.site7road.dao.usr.UsrDao;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.entity.user.UserInfoEntity;
import com.sz.site7road.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 12:20
 * 备注： 用户信息服务实现类
 */
@Service
public class UserInfoServiceImpl extends AbstractBaseServiceImpl<UserInfoEntity> implements UserService {

    @Resource
    private UsrDao usrDao;
    @Resource
    private RoleInfoDao roleInfoDao;

    private static Logger logger=Logger.getLogger(UserInfoServiceImpl.class);


    /**
     * 通过用户名查找用户信息
     *
     * @param username
     * @return
     */
    @Override
    public UserInfoEntity findUserInfoByUserName(String username) {
        return usrDao.findUserByUserName(username);
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

    /**
     * 设置用户的角色信息
     *
     * @param roleArray 角色id列表
     * @param uid       用户id
     * @return 先删除用户的角色信息, 然后增加用户的角色信息
     */
    @Override
    public boolean setUserRole(List<Integer> roleArray, int uid) {
        Preconditions.checkArgument(uid>0);
        Preconditions.checkArgument(null!=roleArray&&!roleArray.isEmpty());
        boolean removeResult= roleInfoDao.removeRoleListByUid(uid);
        if(removeResult){
            return roleInfoDao.setUserRole(roleArray,uid);
        }
        else{
            logger.info("删除用户原有的角色信息失败");
            return false;
        }
    }

    /**
     * 通过用户id得到角色的集合
     *
     * @param uid 用户id
     * @return 用户对应的角色的集合
     */
    @Override
    public List<RoleInfoEntity> findRoleList(int uid) {
        Preconditions.checkArgument(uid>0);
        return roleInfoDao.findRoleListByUid(uid);
    }

    @Override
    protected BaseDao getBaseDao() {
        return usrDao;
    }
}
