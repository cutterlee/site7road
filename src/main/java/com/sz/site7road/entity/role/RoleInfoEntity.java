package com.sz.site7road.entity.role;

import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.entity.site.SiteEntity;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

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

    private String roleName;

    private String roleSummary;


    private Date lastModifyTime=new Date();

    private SiteEntity site;

    private Set<ResourceEntity> funtionSet;

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

    @ManyToOne
    @JoinColumn(name = "site_id")
    public SiteEntity getSite() {
        return site;
    }

    public void setSite(SiteEntity site) {
        this.site = site;
    }
//    @Column(name = "function_set_str")
//    public Set<ResourceEntity> getFuntionSet() {
//        return funtionSet;
//    }
//
//    public void setFuntionSet(Set<ResourceEntity> funtionSet) {
//        this.funtionSet = funtionSet;
//    }
}
