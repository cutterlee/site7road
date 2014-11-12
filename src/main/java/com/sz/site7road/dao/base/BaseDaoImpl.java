package com.sz.site7road.dao.base;

import com.google.common.base.Strings;
import com.sz.site7road.entity.system.PageEntity;
import com.sz.site7road.framework.grid.GridQueryCondition;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.treegrid.RequestTreeGridEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.*;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 * USER： cutter.li
 * CREATE TIME： 2014-07-30 17:27
 * REMARK：通用的dao实现类
 */
@Component
public class BaseDaoImpl<T> implements BaseDao<T> {
    @Resource
    protected SessionFactory sessionFactory;

    protected Class<T> entityClass = null;

    public BaseDaoImpl() {
        Class c = getClass();
        Type t = c.getGenericSuperclass();
        if (t instanceof ParameterizedType) {
            Type[] p = ((ParameterizedType) t).getActualTypeArguments();
            this.entityClass = (Class<T>) p[0];
        }
    }


    @Override
    public List<T> findByPage(PageEntity pageEntity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        List<T> enityList = session.createQuery(" from " + entityClass.getSimpleName()).setFirstResult(pageEntity.getStartPosition()).setMaxResults(pageEntity.getPageSize()).list();
        transaction.commit();
        return enityList;
    }

    @Override
    public void remove(int id) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            T entity = (T) session.get(entityClass, id);
            session.delete(entity);
            transaction.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }
    }

    @Override
    public T findEntityById(int id) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            T entity = (T) session.load(entityClass, id);
            transaction.commit();
            return entity;
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }
        return null;
    }

    @Override
    public boolean modify(T entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.update(entity);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            transaction.rollback();
        }
        return false;
    }

    @Override
    public boolean create(T entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Serializable id=null;
        try {
            id= session.save(entity);
            transaction.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }
        return id!=null;
    }

    @Override
    public Long getCountByRequestGridEntity(RequestGridEntity dataGridParam) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Long total = 0l;
        Criteria criteria = session.createCriteria(entityClass);

        //增加查询条件
        List<GridQueryCondition> queryConditionList = dataGridParam.getQueryConditionList();
        if (queryConditionList != null && !queryConditionList.isEmpty()) {
            for (GridQueryCondition condition : queryConditionList) {
                Object propertyValue = condition.getPropertyValue();
                if (!Strings.isNullOrEmpty(condition.getPropertyName()) && propertyValue !=null&&!Strings.isNullOrEmpty(propertyValue.toString())) {
                    Criterion queryCondition = null;
                    String where = condition.getWhere();//得到条件
                    if(org.apache.commons.lang3.StringUtils.isNumeric(propertyValue.toString()))
                    {
                        propertyValue=Integer.parseInt(propertyValue.toString());
                    }
                    if ("eq".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.eq(condition.getPropertyName(), propertyValue);
                    } else if ("ge".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.ge(condition.getPropertyName(), propertyValue);
                    } else if ("le".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.le(condition.getPropertyName(), propertyValue);
                    } else if ("like".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.like(condition.getPropertyName(), propertyValue.toString(), MatchMode.ANYWHERE);
                    }
                    criteria.add(queryCondition);
                }
            }
        }


        criteria.setProjection(Projections.rowCount());
        Object idCount = criteria.uniqueResult();
        total = (Long) idCount;
        transaction.commit();
        return total;
    }

    @Override
    public List findEntityListByRequestGridEntity(RequestGridEntity dataGridParam) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        Criteria criteria = session.createCriteria(entityClass);


        //增加查询条件
        List<GridQueryCondition> queryConditionList = dataGridParam.getQueryConditionList();
        if (queryConditionList != null && !queryConditionList.isEmpty()) {
            for (GridQueryCondition condition : queryConditionList) {
                Object propertyValue = condition.getPropertyValue();
                if (!Strings.isNullOrEmpty(condition.getPropertyName()) && propertyValue !=null&&!Strings.isNullOrEmpty(propertyValue.toString())) {
                    Criterion queryCondition = null;
                    String where = condition.getWhere();//得到条件

                    if(org.apache.commons.lang3.StringUtils.isNumeric(propertyValue.toString()))
                    {
                        propertyValue=Integer.parseInt(propertyValue.toString());
                    }

                    if ("eq".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.eq(condition.getPropertyName(), propertyValue);
                    } else if ("ge".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.ge(condition.getPropertyName(), propertyValue);
                    } else if ("le".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.le(condition.getPropertyName(), propertyValue);
                    } else if ("like".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.like(condition.getPropertyName(), propertyValue.toString(), MatchMode.ANYWHERE);
                    }
                    criteria.add(queryCondition);
                }
            }
        }

        //拼装排序
        Order order = null;
        if (!Strings.isNullOrEmpty(dataGridParam.getSort())) {
            if ("asc".equalsIgnoreCase(dataGridParam.getOrder())) {
                order = Order.asc(dataGridParam.getSort());
            } else if ("desc".equalsIgnoreCase(dataGridParam.getOrder())) {
                order = Order.desc(dataGridParam.getSort());
            }
        }

        if (null != order) {
            criteria.addOrder(order);
        }
        List<T> entityList = criteria.setFirstResult(dataGridParam.getStart()).setMaxResults(dataGridParam.getRows()).list();
        transaction.commit();
        return entityList;
    }

    /**
     * 创建一个没有数据,但是非空的实体
     *
     * @return
     */
    @Override
    public T createEmptyEntity() throws IllegalAccessException, InstantiationException {
        return entityClass.newInstance();
    }

    /**
     * 根据treeGrid的参数,查询得到总数量
     *
     * @param treeGridParam treeGrid的查询参数
     * @return 数量
     */
    @Override
    public long getCountByRequestTreeGridEntity(RequestTreeGridEntity treeGridParam) {
        return getCountByRequestGridEntity(treeGridParam);
    }

    /**
     * 根据treeGrid的查询参数,查询得到树形的list
     *
     * @param treeGridParam
     * @return
     */
    @Override
    public List findEntityListByRequestTreeGridEntity(RequestTreeGridEntity treeGridParam) {
        return findEntityListByRequestGridEntity(treeGridParam);
    }
}
