package com.sz.site7road.entity.base;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/19 10:57.
 * remark:职位的状态
 */
public enum ItemStatus {

    normal(1, "正常"),
    delete(-1, "删除");

    private int value;

    private String text;

    public int getValue() {
        return value;
    }

    public String getText() {
        return text;
    }

    private ItemStatus(int value, String text) {
        this.value = value;
        this.text = text;
    }

    public static ItemStatus getItemStatus(int value) {
        ItemStatus jobStatus = normal;

        for (ItemStatus job : ItemStatus.values()) {
            if (job.getValue() == value) {
                jobStatus = job;
            }
        }
        return jobStatus;
    }

    @Override
    public String toString() {
        return String.valueOf(getValue());
    }
}
