package com.sz.site7road.dao.base;

import com.sz.site7road.entity.system.PageEntity;
import com.sz.site7road.framework.grid.RequestGridEntity;

import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/30 16:46
 * 备注： 基本的dao接口实现类
 */
public interface BaseDao<T> {


    List<T> findByPage(PageEntity pageEntity);

    void remove(int id);

    T findEntityById(int id);

    void modify(T entity);

    void create(T entity);

    /**
     * 根据查询条件得到总数
     * @param dataGridParam  dataGrid的查询条件封装对象
     * @return
     */
    Long getCountByRequestGridEntity(RequestGridEntity dataGridParam);

    /**
     * 更具查询条件得到一页的数据
     * @param dataGridParam dataGrid的查询条件封装对象
     * @return  一页的数据
     */
    List findEntityListByRequestGridEntity(RequestGridEntity dataGridParam);

    /**
     * 创建一个没有数据,但是非空的实体
     * @return
     */
    T createEmptyEntity() throws IllegalAccessException, InstantiationException;
}
