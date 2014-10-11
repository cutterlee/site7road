package com.sz.site7road.framework.grid;

import java.io.Serializable;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/11 14:38.
 * remark: 查询的参数封装
 */
public class GridQueryCondition implements Serializable {
    /**
     * 字段名称
     */
    private String propertyName;

    /**
     * 条件
     */
    private String where= "eq";

    /**
     * 条件的值
     */
    private Object propertyValue;

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public String getWhere() {
        return where;
    }

    public void setWhere(String where) {
        this.where = where;
    }

    public Object getPropertyValue() {
        return propertyValue;
    }

    public void setPropertyValue(Object propertyValue) {
        this.propertyValue = propertyValue;
    }
}
