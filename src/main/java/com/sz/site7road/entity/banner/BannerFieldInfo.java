package com.sz.site7road.entity.banner;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/5 12:10.
 * remark:字段对象
 */
public class BannerFieldInfo {

    /**
     * 字段的英文名
     */
    private String tag;
    /**
     * 字段的中文名
     */
    private String name;

    /**
     * 字段是否显示
     */
    private boolean flag=false;

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }
}
