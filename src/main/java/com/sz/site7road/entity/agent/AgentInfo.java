package com.sz.site7road.entity.agent;

import com.sz.site7road.entity.base.ItemStatus;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/22 17:30.
 * remark:公司大事件
 */
@Entity
@Table(name = "t_agent")
public class AgentInfo {


    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    private int id;
    @Column(name = "order_num")
    private int orderNum;
    @Column(name = "region_tag")
    private String regionTag; //地区代号英文名
    @Column(name = "agent_name")
    private String agentName; //代理商名称
    @Column(name = "agent_img")
    private String agentImg; //代理上图片
    @Column(name = "agent_url")
    private String agentUrl; //代理商的链接地址
    @Column(name = "item_status")
    private ItemStatus itemStatus= ItemStatus.normal;
    @Column(name = "update_time")
    private Date updateTime=new Date();

    public String getRegionTag() {
        return regionTag;
    }

    public void setRegionTag(String regionTag) {
        this.regionTag = regionTag;
    }


    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public String getAgentImg() {
        return agentImg;
    }

    public void setAgentImg(String agentImg) {
        this.agentImg = agentImg;
    }

    public String getAgentUrl() {
        return agentUrl;
    }

    public void setAgentUrl(String agentUrl) {
        this.agentUrl = agentUrl;
    }

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

    public ItemStatus getItemStatus() {
        return itemStatus;
    }

    public void setItemStatus(ItemStatus itemStatus) {
        this.itemStatus = itemStatus;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
