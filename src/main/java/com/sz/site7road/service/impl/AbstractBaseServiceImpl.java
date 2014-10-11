package com.sz.site7road.service.impl;

import com.google.common.base.Strings;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.entity.companyInfo.CompanyEntity;
import com.sz.site7road.entity.system.PageEntity;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.service.BaseService;
import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/30 16:40
 * 备注：通用的服务实现类
 */
public abstract class AbstractBaseServiceImpl<T> implements BaseService<T> {

    protected abstract BaseDao getBaseDao();

    @Override
    public List findByPage(PageEntity pageEntity) {
        return getBaseDao().findByPage(pageEntity);
    }

    @Override
    public void remove(int id) {
        getBaseDao().remove(id);
    }

    @Override
    public T findEntityById(int id) {
        return (T) getBaseDao().findEntityById(id);
    }

    @Override
    public void modify(T entity) {
        try {
            String idStr = BeanUtils.getProperty(entity, "id");
            if (Strings.isNullOrEmpty(idStr) || "0".equalsIgnoreCase(idStr)) {
                getBaseDao().create(entity);
            } else {
                getBaseDao().modify(entity);
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }

    }

    @Override
    public long getCountByRequestGridEntity(RequestGridEntity dataGridParam) {
        if (null == dataGridParam) {
            dataGridParam = new RequestGridEntity();
        }
        return getBaseDao().getCountByRequestGridEntity(dataGridParam);
    }

    @Override
    public List findEntityListByRequestGridEntity(RequestGridEntity dataGridParam) {
        if (null == dataGridParam) {
            dataGridParam = new RequestGridEntity();
        }
        return getBaseDao().findEntityListByRequestGridEntity(dataGridParam);
    }
}
