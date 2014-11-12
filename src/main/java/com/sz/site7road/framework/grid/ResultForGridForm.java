package com.sz.site7road.framework.grid;

import java.io.Serializable;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/12 10:36.
 * remark:dataGrid对于的表单的增加,删除,修改接口对应的json数据
 */
public class ResultForGridForm implements Serializable{
    /**
     * 是否成功
     */
    private boolean success=false;

    /**
     * 错误信息
     */
    private String errorMsg;

    /**
     * 提示的主题
     */
    private String subject;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess() {
        this.success = true;
    }

    public void setFail() {
        this.success = false;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
