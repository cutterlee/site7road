package com.sz.site7road.entity.user;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/8 15:14.
 * remark:用户角色关联实体
 */
@Entity
@Table(name = "t_user_role")
public class UserRoleEntity {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(strategy = "increment", name = "increment")
    private int id;

    @Column(name = "uid")
    private int uid;

    @Column(name = "role_id")
    private int roleId;

    @Column(name = "create_time")
    private Date crateTime=new Date(System.currentTimeMillis());

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Date getCrateTime() {
        return crateTime;
    }

    public void setCrateTime(Date crateTime) {
        this.crateTime = crateTime;
    }
}
