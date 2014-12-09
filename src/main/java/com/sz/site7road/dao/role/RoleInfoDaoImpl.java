package com.sz.site7road.dao.role;


import com.google.common.base.Preconditions;
import com.sz.site7road.dao.base.BaseDaoImpl;
import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.entity.role.RoleResourceEntity;
import com.sz.site7road.entity.user.UserRoleEntity;
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

    /**
     * 设置用户的角色
     *
     * @param roleArray 角色的id数组
     * @param uid       用户id
     * @return 设置用户的角色的处理结果
     */
    @Override
    public boolean setUserRole(List<Integer> roleArray, int uid) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            int i = 1;
            for (int roleId : roleArray) {
                UserRoleEntity entity = new UserRoleEntity();
                entity.setRoleId(roleId);
                entity.setUid(uid);
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
        }finally {
            session.close();
        }
        return false;
    }

    /**
     * 查找到用户的角色集合
     *
     * @param uid
     * @return
     */
    @Override
    public List<RoleInfoEntity> findRoleListByUid(int uid) {

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Query query= session.createQuery("  from RoleInfoEntity  role where role.id in ( select roleId from  UserRoleEntity userRole where userRole.uid=:uid)");
            query.setInteger("uid",uid);
            List<RoleInfoEntity> roleInfoEntityList= query.list();
            transaction.commit();
            return roleInfoEntityList;
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }finally {
            session.close();
        }
        return null;
    }

    /**
     * 批量删除用户的角色
     *
     * @param uid
     * @return
     */
    @Override
    public boolean removeRoleListByUid(int uid) {
        Preconditions.checkArgument(uid>0);
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        int removeCount = -1;
        try {
            Query query = session.createQuery(" delete from UserRoleEntity entity where entity.uid=:uid");
            query.setInteger("uid", uid);
            removeCount = query.executeUpdate();
            transaction.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }finally {
            session.close();
        }
        return removeCount >= 0;
    }

    /**
     * 查找角色集合对应的资源集合
     *
     * @param roleInfoEntityList 角色集合
     * @return 资源集合
     */
    @Override
    public List<ResourceEntity> findRolePermissions(List<RoleInfoEntity> roleInfoEntityList) {


        Object[] paramList=new Object[roleInfoEntityList.size()];
        int i=0;
        for(RoleInfoEntity roleInfoEntity:roleInfoEntityList)
        {
            paramList[i]=roleInfoEntity.getId();
            i++;
        }

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Query query= session.createQuery("  from ResourceEntity res where res.id in ( select resourceId from  RoleResourceEntity roleRes where roleRes.roleId in (:roleId))");
            query.setParameterList("roleId",paramList);
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
