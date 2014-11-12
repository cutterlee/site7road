package com.sz.site7road.framework.grid;

import com.google.common.collect.Lists;

import java.io.Serializable;
import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/11 12:03.
 * remark: dataGrid所需的对象
 */
public class ResponseGridEntity implements Serializable {
    /**
     * 总数
     */
    protected long total = 0;
    /**
     * 一页的数据
     */
    protected List rows = Lists.newLinkedList();

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }
}
