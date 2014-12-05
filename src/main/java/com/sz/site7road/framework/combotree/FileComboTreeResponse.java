package com.sz.site7road.framework.combotree;

import java.util.Collection;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/4 10:57.
 * remark: 文件树
 */
public class FileComboTreeResponse{

    private String id;

    private String text;

    private String iconCls;

    private String state="open";

    private Collection<FileComboTreeResponse> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Collection<FileComboTreeResponse> getChildren() {
        return children;
    }

    public void setChildren(Collection<FileComboTreeResponse> children) {
        this.children = children;
    }
}
