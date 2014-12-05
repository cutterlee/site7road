package com.sz.site7road.service.impl;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Strings;
import com.google.common.collect.Collections2;
import com.google.common.collect.Lists;
import com.google.common.primitives.Ints;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.entity.companyInfo.CompanyEntity;
import com.sz.site7road.entity.config.ConfigEntity;
import com.sz.site7road.entity.system.PageEntity;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.grid.GridQueryCondition;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.treegrid.RequestTreeGridEntity;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.util.BeanHelpUtil;
import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
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
    public boolean remove(int id) {
       return getBaseDao().remove(id);
    }

    @Override
    public T findEntityById(int id) {
        Preconditions.checkArgument(id>0);
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
    public T createEmptyEntity() throws InstantiationException, Exception {
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


    /**
     * 删除孩子
     *
     * @param pid 父id
     * @return 删除的结果
     */
    @Override
    public boolean removeChildrenByPid(int pid) {
        return getBaseDao().removeChildrenByPid(pid);
    }

    public List<ComboTreeResponse> getComboTreeChildrenFromTreeNode(Collection<T> treeNodeList,String titleField) {
        List<ComboTreeResponse> comboTreeResponseList = Lists.newLinkedList();
        if (treeNodeList != null && !treeNodeList.isEmpty())
            for (final T treeNode : treeNodeList) {

                String treeNodeId = BeanHelpUtil.getStringProperty(treeNode,"id");
                String treeNodeTitle=BeanHelpUtil.getStringProperty(treeNode,titleField);

                ComboTreeResponse comboTreeResponse = new ComboTreeResponse();
                comboTreeResponse.setId(Ints.tryParse(treeNodeId));
                comboTreeResponse.setText(treeNodeTitle);
                final String finalTreeNodeId = treeNodeId;
                Collection<T> children = Collections2.filter(treeNodeList, new Predicate<T>() {
                    @Override
                    public boolean apply(T t) {
                        String pid = BeanHelpUtil.getStringProperty(t,"pid");
                        return finalTreeNodeId.equals(pid);
                    }
                });
                if (children != null && !children.isEmpty()) {
                    comboTreeResponse.setChildren(getComboTreeChildrenFromTreeNode(children,titleField));
                }
                comboTreeResponseList.add(comboTreeResponse);
            }
        return comboTreeResponseList;
    }

    public List<ComboTreeResponse> getComboTreeListByPid(int pid,String titleField) {
        List<ComboTreeResponse> comboTreeResponseList = Lists.newLinkedList();
        //find the whole config list
        RequestGridEntity dataGridParam = new RequestGridEntity();
        dataGridParam.setPage(1);
        dataGridParam.setRows(10000);
        List<T> configEntityList = getBaseDao().findEntityListByRequestGridEntity(dataGridParam);

        for (final T entity : configEntityList) {
            int entityPid=BeanHelpUtil.getIntProperty(entity,"pid");
            if (entityPid == 0) {
                ComboTreeResponse comboTreeResponse = new ComboTreeResponse();
               final int id = BeanHelpUtil.getIntProperty(entity, "id");
                comboTreeResponse.setId(id);
                String treeNodeTitle = BeanHelpUtil.getStringProperty(entity, titleField);
                comboTreeResponse.setText(treeNodeTitle);
                Collection<T> children = Collections2.filter(configEntityList, new Predicate<T>() {
                    @Override
                    public boolean apply(T configEntity) {
                        int configEntityPid = BeanHelpUtil.getIntProperty(configEntity, "pid");
                        return configEntityPid == id;
                    }
                });
                if (children != null && !children.isEmpty()) {
                    comboTreeResponse.setChildren(getComboTreeChildrenFromTreeNode(children,titleField));
                } else {
                    comboTreeResponse.setChildren(null);
                }
                comboTreeResponseList.add(comboTreeResponse);
            }
        }
        return comboTreeResponseList;
    }

    @Override
    public List<T> findAll() {

        PageEntity pageEntity=new PageEntity();
        pageEntity.setPageIndex(1);
        pageEntity.setPageSize(100000);
        return getBaseDao().findByPage(pageEntity);
    }
}
