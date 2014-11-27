package com.sz.site7road.entity.job;

import com.sz.site7road.entity.base.ItemStatus;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/19 11:01.
 * remark:职位实体
 */
@Entity
@Table(name = "t_job")
public class JobEntity {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    private int id;

    @Column(name = "order_num")
    private int orderNum;

    @Column(name = "position_name")
    private String positionName;//职位名称

    @Column(name = "position_place")
    private String positionPlace;//职位所在地

    @Column(name = "position_need_num")
    private int positionNeedNum=1; //所需人数

    @Column(name = "position_property")
    private String positionProperty;//职位性质

    @Column(name = "is_hot_job")
    private JobStatus hotStatus=JobStatus.hot;//是否是热招职位

    @Column(name = "position_duty")
    private String positionDuty;//工作职责

    @Column(name = "position_requirement")
    private String positionRequirement;//要求

    @Column(name = "item_status")
    private ItemStatus itemStatus= ItemStatus.normal;

    @Column(name = "create_time")
    private Date createTime=new Date();


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getPositionPlace() {
        return positionPlace;
    }

    public void setPositionPlace(String positionPlace) {
        this.positionPlace = positionPlace;
    }

    public int getPositionNeedNum() {
        return positionNeedNum;
    }

    public void setPositionNeedNum(int positionNeedNum) {
        this.positionNeedNum = positionNeedNum;
    }

    public String getPositionProperty() {
        return positionProperty;
    }

    public void setPositionProperty(String positionProperty) {
        this.positionProperty = positionProperty;
    }

    public JobStatus getHotStatus() {
        return hotStatus;
    }

    public void setHotStatus(JobStatus hotStatus) {
        this.hotStatus = hotStatus;
    }

    public void setHotStatus(int hotStatus) {
        this.hotStatus =JobStatus.getJobStatus(hotStatus);
    }

    public String getPositionDuty() {
        return positionDuty;
    }

    public void setPositionDuty(String positionDuty) {
        this.positionDuty = positionDuty;
    }

    public String getPositionRequirement() {
        return positionRequirement;
    }

    public void setPositionRequirement(String positionRequirement) {
        this.positionRequirement = positionRequirement;
    }


    public ItemStatus getItemStatus() {
        return itemStatus;
    }

    public void setItemStatus(ItemStatus itemStatus) {
        this.itemStatus = itemStatus;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append("Recruit");
        sb.append("{positionName='").append(positionName).append('\'');
        sb.append(", positionPlace='").append(positionPlace).append('\'');
        sb.append(", positionNeedNum=").append(positionNeedNum);
        sb.append(", positionProperty='").append(positionProperty).append('\'');
        sb.append(", positionDuty='").append(positionDuty).append('\'');
        sb.append(", positionRequirement='").append(positionRequirement).append('\'');
        sb.append('}');
        return sb.toString();
    }

}
