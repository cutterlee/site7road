package com.sz.site7road.dao.site;

import com.sz.site7road.dao.base.BaseDaoImpl;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.entity.site.SiteEntity;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/30 003017:21
 * 备注：
 */
@Repository
public class SiteDaoImpl extends BaseDaoImpl<SiteEntity> implements SiteDao {
    /**
     * 通过角色集合得到用户可操作的站点列表
     *
     * @param roleInfoEntityList 角色集合
     * @return 站点列表
     */
    @Override
    public List<SiteEntity> findSiteListByRoleList(List<RoleInfoEntity> roleInfoEntityList) {
        Object[] paramList=new Object[roleInfoEntityList.size()];
        int i=0;
        for(RoleInfoEntity roleInfoEntity:roleInfoEntityList)
        {
            paramList[i]=roleInfoEntity.getSiteId();
            i++;
        }

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Query query= session.createQuery("  from SiteEntity site where site.id in (:siteId)");
            query.setParameterList("siteId",paramList);
            List<SiteEntity> siteEntityList= query.list();
            transaction.commit();
            return siteEntityList;
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }finally {
            session.close();
        }
        return null;
    }
}
