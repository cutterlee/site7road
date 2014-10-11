package com.sz.site7road.framework.tree;

import com.google.common.collect.Lists;

import java.io.Serializable;
import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/16 14:53.
 * remark:easyui的tree节点数据对象
 ****************************************************************
 * Every node can contains following properties:

 id: node id, which is important to load remote data
 text: node text to show
 state: node state, 'open' or 'closed', default is 'open'. When set to 'closed', the node have children nodes and will load them from remote site
 checked: Indicate whether the node is checked selected.
 attributes: custom attributes can be added to a node
 children: an array nodes defines some children nodes
 */
public class TreeNode implements Serializable{

    private int id;

    private String text;

    private String iconCls="icon-edit";

    private String path;

    private String state="open";//open closed

    boolean checked=false;

    private List<TreeNode> children;

    private Object attributes;


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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public List<TreeNode> getChildren() {
            return children;
    }

    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }

    public Object getAttributes() {
        return attributes;
    }

    public void setAttributes(Object attributes) {
        this.attributes = attributes;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
