package com.sz.site7road.dao.config;

import com.sz.site7road.dao.base.BaseDaoImpl;
import com.sz.site7road.entity.config.ConfigEntity;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/10 10:35.
 * remark: 配置信息的dao实现类
 */
@Repository
public class ConfigDaoImpl extends BaseDaoImpl<ConfigEntity> implements ConfigDao {
    /**
     * 根据configKey找到孩子集合
     *
     * @param configKey 配置key
     * @return 孩子集合
     */
    @Override
    public List<ConfigEntity> findChildrenByConfigKey(String configKey) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        Criteria criteria = session.createCriteria(entityClass);

        Query query= session.createQuery(" from ConfigEntity as config where pid in (select id from ConfigEntity as con where con.configKey=:configKey) order by  config.orderNum asc");
        query.setString("configKey",configKey);

        List<ConfigEntity> entityList = query.list();
        transaction.commit();
        session.close();
        return entityList;
    }
}
