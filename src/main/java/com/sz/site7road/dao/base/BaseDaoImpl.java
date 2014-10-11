package com.sz.site7road.dao.base;

import com.google.common.base.Strings;
import com.google.common.primitives.Ints;
import com.sz.site7road.entity.companyInfo.CompanyEntity;
import com.sz.site7road.entity.system.PageEntity;
import com.sz.site7road.framework.grid.GridQueryCondition;
import com.sz.site7road.framework.grid.RequestGridEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.*;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 * USER： cutter.li
 * CREATE TIME： 2014-07-30 17:27
 * REMARK：
 */
@Component
public class BaseDaoImpl<T> implements BaseDao<T> {
    @Resource
    private SessionFactory sessionFactory;

    private Class<T> entityClass = null;

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
    public void modify(T entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.update(entity);
            transaction.commit();
        } catch (Exception ex) {
            transaction.rollback();
        }
    }

    @Override
    public void create(T entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.save(entity);
            transaction.commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            transaction.rollback();
        }
    }

    @Override
    public Long getCountByRequestGridEntity(RequestGridEntity dataGridParam) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Long total = 0l;
        Criteria criteria = session.createCriteria(entityClass);

        if (null != dataGridParam.getCondition() && !Strings.isNullOrEmpty(dataGridParam.getCondition().getPropertyName())) {//优先单字段查询
            GridQueryCondition condition = dataGridParam.getCondition();
            Criterion queryCondition = null;
            String where = condition.getWhere();//得到条件
            if ("eq".equalsIgnoreCase(where)) {
                queryCondition = Restrictions.eq(condition.getPropertyName(), condition.getPropertyValue());
            } else if ("ge".equalsIgnoreCase(where)) {
                queryCondition = Restrictions.ge(condition.getPropertyName(), condition.getPropertyValue());
            } else if ("le".equalsIgnoreCase(where)) {
                queryCondition = Restrictions.le(condition.getPropertyName(), condition.getPropertyValue());
            } else if ("like".equalsIgnoreCase(where)) {
                queryCondition = Restrictions.like(condition.getPropertyName(), condition.getPropertyValue().toString(), MatchMode.ANYWHERE);
            }
            criteria.add(queryCondition);
        } else {
            //增加查询条件
            if (!dataGridParam.getQueryConditionList().isEmpty()) {
                for (GridQueryCondition condition : dataGridParam.getQueryConditionList()) {
                    Criterion queryCondition = null;
                    String where = condition.getWhere();//得到条件
                    if ("eq".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.eq(condition.getPropertyName(), condition.getPropertyValue());
                    } else if ("ge".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.ge(condition.getPropertyName(), condition.getPropertyValue());
                    } else if ("le".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.le(condition.getPropertyName(), condition.getPropertyValue());
                    } else if ("like".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.like(condition.getPropertyName(), condition.getPropertyValue().toString(), MatchMode.ANYWHERE);
                    }
                    criteria.add(queryCondition);
                }
            }
        }


        total = (Long) (criteria.setProjection(Projections.countDistinct("id")).uniqueResult());
        transaction.commit();
        return total;
    }

    @Override
    public List findEntityListByRequestGridEntity(RequestGridEntity dataGridParam) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        Criteria criteria = session.createCriteria(entityClass);

        //拼装查询条件
        if (null != dataGridParam.getCondition()) {//优先单字段查询
            GridQueryCondition condition = dataGridParam.getCondition();
            Criterion queryCondition = null;
            String where = condition.getWhere();//得到条件
            if ("eq".equalsIgnoreCase(where)) {
                queryCondition = Restrictions.eq(condition.getPropertyName(), condition.getPropertyValue());
            } else if ("ge".equalsIgnoreCase(where)) {
                queryCondition = Restrictions.ge(condition.getPropertyName(), condition.getPropertyValue());
            } else if ("le".equalsIgnoreCase(where)) {
                queryCondition = Restrictions.le(condition.getPropertyName(), condition.getPropertyValue());
            } else if ("like".equalsIgnoreCase(where)) {
                queryCondition = Restrictions.like(condition.getPropertyName(), condition.getPropertyValue().toString(), MatchMode.ANYWHERE);
            }
            criteria.add(queryCondition);
        } else {
            //增加查询条件
            if (!dataGridParam.getQueryConditionList().isEmpty()) {
                for (GridQueryCondition condition : dataGridParam.getQueryConditionList()) {
                    Criterion queryCondition = null;
                    String where = condition.getWhere();//得到条件
                    if ("eq".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.eq(condition.getPropertyName(), condition.getPropertyValue());
                    } else if ("ge".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.ge(condition.getPropertyName(), condition.getPropertyValue());
                    } else if ("le".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.le(condition.getPropertyName(), condition.getPropertyValue());
                    } else if ("like".equalsIgnoreCase(where)) {
                        queryCondition = Restrictions.like(condition.getPropertyName(), condition.getPropertyValue().toString(), MatchMode.ANYWHERE);
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
        List<T> enityList = criteria.setFirstResult(dataGridParam.getStart()).setMaxResults(dataGridParam.getRows()).list();
        transaction.commit();
        return enityList;
    }
}
