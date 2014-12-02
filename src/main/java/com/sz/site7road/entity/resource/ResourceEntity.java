package com.sz.site7road.entity.resource;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 11:02
 * 备注： 资源实体
 */
@Entity
@Table(name = "t_resource")
public class ResourceEntity implements Serializable {

    private int id;

    private int pid;

    @NotBlank
    @Length(min = 4,max = 20)
    private String resourceName;

    private String resourceIcon="icon-man";
   @NotBlank
   @Length(min = 4,max = 200)
    private String resourceSummary;

    @NotBlank
    @Length(min = 1,max = 100)
    private String resourceUrl;
    /**
     * 资源的类型,分为menu(1菜单,用来导航),page(2页面显示,导航),function(3功能,限定功能的使用)
     */
    private int resourceType;

    private Date createTime=new Date(System.currentTimeMillis());

    private int orderNum=0;

    private int itemStatus=1;


    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(strategy = "increment", name = "increment")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "pid")
    public int getPid() {
        return pid;
    }
    @Column(name = "res_type")
    public int getResourceType() {
        return resourceType;
    }

    public void setResourceType(int resourceType) {
        this.resourceType = resourceType;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    @Column(name = "res_name")
    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }
    @Column(name = "res_icon")
    public String getResourceIcon() {
        return resourceIcon;
    }

    public void setResourceIcon(String resourceIcon) {
        this.resourceIcon = resourceIcon;
    }




    @Column(name = "res_summary")
    public String getResourceSummary() {
        return resourceSummary;
    }

    public void setResourceSummary(String resourceSummary) {
        this.resourceSummary = resourceSummary;
    }

    @Column(name = "res_url")
    public String getResourceUrl() {
        return resourceUrl;
    }

    public void setResourceUrl(String resourceUrl) {
        this.resourceUrl = resourceUrl;
    }

    @Column(name = "create_time")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "order_num")
    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    @Column(name = "item_status")
    public int getItemStatus() {
        return itemStatus;
    }

    public void setItemStatus(int itemStatus) {
        this.itemStatus = itemStatus;
    }


}
