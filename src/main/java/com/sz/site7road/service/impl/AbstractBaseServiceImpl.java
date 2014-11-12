package com.sz.site7road.service.impl;

import com.google.common.base.Strings;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.entity.companyInfo.CompanyEntity;
import com.sz.site7road.entity.system.PageEntity;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.grid.GridQueryCondition;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.treegrid.RequestTreeGridEntity;
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
    public boolean modify(T entity) {
        try {
            String idStr = BeanUtils.getProperty(entity, "id");
            if (Strings.isNullOrEmpty(idStr) || "0".equalsIgnoreCase(idStr)) {
              return   getBaseDao().create(entity);
            } else {
              return   getBaseDao().modify(entity);
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        return false;
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

    @Override
    public T createEmptyEntity() throws InstantiationException, IllegalAccessException {
        return (T) getBaseDao().createEmptyEntity();
    }

    /**
     * 根据treeGrid的参数,得到总条数
     *
     * @param treeGridParam treeGrid的请求参数
     * @return 符合条件的数量
     */
    @Override
    public long getCountByRequestTreeGridEntity(RequestTreeGridEntity treeGridParam) {
        if(null==treeGridParam)
        {
            treeGridParam=new RequestTreeGridEntity();
        }
        //设置条件为pid为0
        GridQueryCondition condition = new GridQueryCondition();
        condition.setPropertyName("pid");
        condition.setPropertyValue("0");
        condition.setWhere("eq");
        treeGridParam.setCondition_1(condition);
        return getBaseDao().getCountByRequestTreeGridEntity(treeGridParam);
    }

    /**
     * 根据treeGrid的参数,查询出符合条件的列表
     *
     * @param treeGridParam treeGrid的请求参数
     * @return 符合条件的列表
     */
    @Override
    public List findEntityListByRequestTreeGridEntity(RequestTreeGridEntity treeGridParam) {
        if(null==treeGridParam)
        {
            treeGridParam=new RequestTreeGridEntity();
        }
        treeGridParam.setRows(1000);
        return getBaseDao().findEntityListByRequestTreeGridEntity(treeGridParam);
    }


}
