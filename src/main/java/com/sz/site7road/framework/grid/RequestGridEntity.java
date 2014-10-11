package com.sz.site7road.framework.grid;

import com.google.common.collect.Lists;

import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/11 12:08.
 * remark: datagrid的查询参数对象
 */
public class RequestGridEntity {

    /***
     * 第几页
     */
    private int page=1;

    /**
     * 一页多少条数据
     */
    private int rows=20;

    /**
     * 排序字段
     */
    private String sort;

    /**
     *排序的命令,升序还是降序
     */
    private String order="asc";

    private List<GridQueryCondition> queryConditionList= Lists.newLinkedList();

    private GridQueryCondition condition;

    public int getPage() {
        return page;
    }

    /**
     * 得到sql分页数据的起始序号
     * @return
     */
    public int getStart() {
        if(page>0)
        {
            return  (page-1)*rows;
        }else{
            return 0;
        }
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public List<GridQueryCondition> getQueryConditionList() {
        return queryConditionList;
    }

    public void setQueryConditionList(List<GridQueryCondition> queryConditionList) {
        this.queryConditionList = queryConditionList;
    }

    public GridQueryCondition getCondition() {
        return condition;
    }

    public void setCondition(GridQueryCondition condition) {
        this.condition = condition;
    }
}
