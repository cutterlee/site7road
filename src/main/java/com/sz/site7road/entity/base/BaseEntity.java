package com.sz.site7road.entity.base;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

/**
 * User： cutter.li
 * Date： 2014/7/25
 * Time： 11:39
 * 备注： 实体的父对象
 */

public class BaseEntity implements Serializable {

    /**
     * 主键id
     */
    private Long id;
    /**
     * 创建日期
     */
    private Date createDate;
    /**
     * 修改日期
     */
    private Date modifyDate;

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    @Override
    public boolean equals(Object obj) {
        if (null == obj) {
            return false;
        }
        if (this == obj) {
            return true;
        }

        if (!this.getClass().isAssignableFrom(obj.getClass())) {
            return false;
        }

        BaseEntity baseEntity = (BaseEntity) obj;

        return  getId()==baseEntity.getId();

    }


}
