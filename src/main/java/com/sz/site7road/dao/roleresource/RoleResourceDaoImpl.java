package com.sz.site7road.dao.roleresource;

import com.sz.site7road.dao.base.BaseDaoImpl;
import com.sz.site7road.entity.role.RoleResourceEntity;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/12 17:42.
 * remark:角色权限对应
 */
@Repository
public class RoleResourceDaoImpl extends BaseDaoImpl<RoleResourceEntity> implements RoleResourceDao {

    private static final Logger log = Logger.getLogger(RoleResourceDaoImpl.class);

    /**
     * 删除某个角色对应的权限
     *
     * @param roleId 角色id
     * @return 删除的结果
     */
    @Override
    public boolean removeByRoleId(int roleId) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        int removeCount = -1;
        try {
            Query query = session.createQuery(" delete from RoleResourceEntity entity where entity.roleId=:roleId");
            query.setInteger("roleId", roleId);
            removeCount = query.executeUpdate();
            transaction.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }
        return removeCount >= 0;
    }

    /**
     * 批量增加某角色的权限
     *
     * @param resourceIdArray 权限id的数组
     * @param roleId          角色id
     * @return 批量增加的结果
     */
    @Override
    public boolean batchInsertResource(int[] resourceIdArray, int roleId) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            int i = 1;
            for (int resourceId : resourceIdArray) {
                RoleResourceEntity entity = new RoleResourceEntity();
                entity.setRoleId(roleId);
                entity.setResourceId(resourceId);
                session.save(entity);
                i++;
                if (i % 20 == 0) {
                    session.flush();
                    session.clear();
                }
            }
            transaction.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }
        return false;
    }

    /**
     * 根据角色id找出权限的集合
     *
     * @param roleId 角色id
     * @return roleId对应的权限集合
     */
    @Override
    public List<RoleResourceEntity> findResourceByRoleId(int roleId) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        Criteria criteria = session.createCriteria(RoleResourceEntity.class);
        Criterion queryCondition = Restrictions.eq("roleId",roleId);
        criteria.add(queryCondition);
        criteria.addOrder(Order.desc("roleId"));

        List<RoleResourceEntity> entityList = criteria.list();
        transaction.commit();
        return entityList;
    }
}
