package com.sz.site7road.service;

import com.sz.site7road.entity.companyInfo.CompanyEntity;
import com.sz.site7road.entity.system.PageEntity;
import com.sz.site7road.framework.grid.RequestGridEntity;

import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 15:54
 * 备注： 基本的服务接口
 */
public interface BaseService <T>{

    List<T> findByPage(PageEntity pageEntity);

    void remove(int id);

    T findEntityById(int id);

    void modify(T entity);

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

    T createEmptyEntity() throws InstantiationException, IllegalAccessException;
}
