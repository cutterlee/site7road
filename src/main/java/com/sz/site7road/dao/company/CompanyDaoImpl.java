package com.sz.site7road.dao.company;

import com.google.common.base.Strings;
import com.sz.site7road.dao.base.BaseDaoImpl;
import com.sz.site7road.entity.companyInfo.CompanyEntity;
import com.sz.site7road.entity.system.PageEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/28
 * Time： 15:44
 * 备注： 公司信息的dao实现类
 */
@Repository
public class CompanyDaoImpl extends BaseDaoImpl<CompanyEntity> implements CompanyDao {

    @Autowired
    private SessionFactory sessionFactory;

    /**
     * 创建公司信息
     *
     * @param entity 公司信息实体
     * @return 创建结果
     */
    @Override
    public boolean creatComany(CompanyEntity entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.save(entity);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            transaction.rollback();
        }
        return false;
    }

    /**
     * 删除公司信息
     *
     * @param id 公司信息的id
     * @return 删除结果
     */
    @Override
    public boolean removeCompany(long id) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            CompanyEntity entity = (CompanyEntity) session.get(CompanyEntity.class, id);
            session.delete(entity);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }
        return false;
    }

    /**
     * 修改公司信息
     *
     * @param entity 公司信息
     * @return 修改的结果
     */
    @Override
    public boolean modifyCompany(CompanyEntity entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.saveOrUpdate(entity);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            transaction.rollback();
        }
        return false;
    }

    /**
     * 查询公司信息
     *
     * @param id 公司信息id
     * @return 公司信息
     */
    @Override
    public CompanyEntity findCompanyById(long id) {
        CompanyEntity entity = (CompanyEntity) sessionFactory.openSession().get(CompanyEntity.class, id);
        return entity;
    }

    /**
     * 简单的分页，查询公司信息列表
     *
     * @param pageEntity
     * @return
     */
    @Override
    public List<CompanyEntity> findByPage(PageEntity pageEntity) {
        Session session= sessionFactory.openSession();
       Transaction transaction= session.beginTransaction();
        List<CompanyEntity> companyEntityList = session.createQuery(" from CompanyEntity").setFirstResult(pageEntity.getStartPosition()).setMaxResults(pageEntity.getPageSize()).list();
       transaction.commit();
        return companyEntityList;
    }

    /**
     * 根据条件查询公司信息的总条数
     *
     * @param where 查询条件
     * @return 符合条件的条数
     */
    @Override
    public int countComany(String where) {
        String whereCause = "";
        if (!Strings.isNullOrEmpty(where)) {
            whereCause = " where " + where;
        }
        Integer count = (Integer) sessionFactory.openSession().createQuery(" select count(*) from t_company_information " + whereCause).uniqueResult();
        return count;
    }
}
