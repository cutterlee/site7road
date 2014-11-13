package com.sz.site7road.framework.combotree;

import com.google.common.collect.Lists;

import java.util.Collection;
import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/10 15:46.
 * remark: comboTree的返回消息实体
 */
public class ComboTreeResponse {

    private int id;

    private String text;

    private String iconCls;

    private Collection<ComboTreeResponse> children= Lists.newLinkedList();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Collection<ComboTreeResponse> getChildren() {
        return children;
    }

    public void setChildren(List<ComboTreeResponse> children) {
        this.children = children;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }
}
