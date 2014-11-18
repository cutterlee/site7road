package com.sz.site7road.dao.usr;

import com.sz.site7road.dao.base.BaseDaoImpl;
import com.sz.site7road.entity.user.UserInfoEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/12 15:01.
 * remark: 后台用户的dao实现类
 */
@Repository
public class UsrDaoImpl  extends BaseDaoImpl<UserInfoEntity> implements UsrDao{
    /**
     * 根据用户名查找用户信息
     *
     * @param username
     * @return
     */
    @Override
    public UserInfoEntity findUserByUserName(String username) {
        Session session =  sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            UserInfoEntity entity= (UserInfoEntity) session.createCriteria(entityClass).add(Restrictions.eq("username",username)).uniqueResult();
            transaction.commit();
            return entity;
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }finally {
            session.close();
        }
        return null;
    }
}
