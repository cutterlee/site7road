package com.sz.site7road.dao.role;


import com.sz.site7road.dao.base.BaseDaoImpl;
import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.entity.role.RoleInfoEntity;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * USER： cutter.li
 * CREATE TIME： 2014-08-01 17:56
 * REMARK：角色信息dao实现类
 */
@Repository
public class RoleInfoDaoImpl extends BaseDaoImpl<RoleInfoEntity> implements RoleInfoDao {
    /**
     * 根据角色id查询到权限的集合
     *
     * @param roleId 角色id
     * @return 权限的集合
     */
    @Override
    public List<ResourceEntity> findRolePermissionSet(int roleId) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
           Query query= session.createQuery("  from ResourceEntity res where res.id in ( select resourceId from  RoleResourceEntity roleRes where roleRes.roleId=:roleId)");
            query.setInteger("roleId",roleId);
            List<ResourceEntity> resourceEntityList= query.list();
            transaction.commit();
            return resourceEntityList;
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }finally {
            session.close();
        }
        return null;
    }
}
