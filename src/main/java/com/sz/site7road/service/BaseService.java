package com.sz.site7road.service;

import com.sz.site7road.entity.system.PageEntity;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.treegrid.RequestTreeGridEntity;

import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 15:54
 * 备注： 基本的服务接口
 */
public interface BaseService <T>{

    List<T> findAll();

    List<T> findByPage(PageEntity pageEntity);

    boolean remove(int id);

    T findEntityById(int id);

    boolean modify(T entity);

    /**
     * 更具dataGrid的参数查询出总数量
     * @param dataGridParam  dataGrid的请求参数
     * @return  符合条件的总数量
     */
    long getCountByRequestGridEntity(RequestGridEntity dataGridParam);

    /**
     * 更具dataGrid的请求参数分页查询出一页的数据
     * @param dataGridParam dataGrid的请求参数
     * @return 一页的数据
     */
    List findEntityListByRequestGridEntity(RequestGridEntity dataGridParam);

    /**
     * 创建一个空的实体来初始化增加页面的数据,跟编辑页面统一
     * @return
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    T createEmptyEntity() throws  Exception;

    /**
     * 根据treeGrid的参数,得到总条数
     * @param treeGridParam treeGrid的请求参数
     * @return 符合条件的数量
     */
    long getCountByRequestTreeGridEntity(RequestTreeGridEntity treeGridParam);

    /**
     * 根据treeGrid的参数,查询出符合条件的列表
     * @param treeGridParam treeGrid的请求参数
     * @return 符合条件的列表
     */
    List findEntityListByRequestTreeGridEntity(RequestTreeGridEntity treeGridParam);

    /**
     * 删除孩子
     * @param pid 父id
     * @return  删除的结果
     */
    boolean removeChildrenByPid(int pid);


    /**
     * 获取treeGrid的树形数据
     * @param pid 父id
     *  @param titleField title字段的名称
     * @return  treeGrid所需树形数据
     */
    public List<ComboTreeResponse> getComboTreeListByPid(int pid,String titleField);
}
