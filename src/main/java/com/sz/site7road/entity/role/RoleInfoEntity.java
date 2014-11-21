package com.sz.site7road.entity.role;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 10:57
 * 备注： 角色信息实体
 */
@Entity
@Table(name = "t_role")
public class RoleInfoEntity implements Serializable {

    private int id;

    @NotBlank
    @Length(min = 4,max = 20)
    private String roleName;

    @NotBlank
    @Length(min = 4,max = 200)
    private String roleSummary;


    private Date lastModifyTime=new Date();

    private int siteId;


    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(strategy = "increment", name = "increment")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "role_name")
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Column(name = "role_summary")
    public String getRoleSummary() {
        return roleSummary;
    }

    public void setRoleSummary(String roleSummary) {
        this.roleSummary = roleSummary;
    }


    @Column(name = "last_modify_time")
    public Date getLastModifyTime() {
        return lastModifyTime;
    }

    public void setLastModifyTime(Date lastModifyTime) {
        this.lastModifyTime = lastModifyTime;
    }

    @Column(name = "site_id")
    public int getSiteId() {
        return siteId;
    }

    public void setSiteId(int siteId) {
        this.siteId = siteId;
    }
}
