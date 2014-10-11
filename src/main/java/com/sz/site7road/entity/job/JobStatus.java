package com.sz.site7road.entity.job;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/19 10:57.
 * remark:职位的状态
 */
public enum JobStatus {

    normal(0, "正常招聘"),
    hot(1, "热招");

    private int value;

    private String text;

    public int getValue() {
        return value;
    }

    public String getText() {
        return text;
    }

    private JobStatus(int value, String text) {
        this.value = value;
        this.text = text;
    }

    public static JobStatus getJobStatus(int value) {
        JobStatus jobStatus = normal;

        for (JobStatus job : JobStatus.values()) {
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
