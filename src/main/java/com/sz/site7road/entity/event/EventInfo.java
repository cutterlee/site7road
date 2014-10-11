package com.sz.site7road.entity.event;

import com.sz.site7road.entity.base.ItemStatus;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/22 17:42.
 * remark:大事件实体
 */
@Entity
@Table(name = "t_event")
public class EventInfo {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    private int id;
    @Column(name = "order_num")
    private int orderNum;
    @Column(name = "event_title")
    private String title;//事件名称
    @Column(name = "event_img_in_event_page")
    private String eventImgInEventPage;//事件列表页面的图片
    @Column(name = "event_content_summary")
    private String eventContentSmall;//事件内容简介
    @Column(name = "event_content_detail")
    private String eventContentDetail="aaa";//事件内容简介
    @Column(name = "event_html_name")
    private String eventHtmlName="aaa";//生成的详细页面的英文名称
    @Column(name = "publish_time")
    private Date publishTime;//显示的发布时间
    @Column(name = "item_status")
    private ItemStatus itemStatus=ItemStatus.normal;
    @Column(name = "update_time")
    private Date updateTime=new Date();

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getEventImgInEventPage() {
        return eventImgInEventPage;
    }

    public void setEventImgInEventPage(String eventImgInEventPage) {
        this.eventImgInEventPage = eventImgInEventPage;
    }

    public String getEventContentSmall() {
        return eventContentSmall;
    }

    public void setEventContentSmall(String eventContentSmall) {
        this.eventContentSmall = eventContentSmall;
    }

    public String getEventContentDetail() {
        return eventContentDetail;
    }

    public void setEventContentDetail(String eventContentDetail) {
        this.eventContentDetail = eventContentDetail;
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

    public String getEventHtmlName() {
        return eventHtmlName;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
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

    public void setEventHtmlName(String eventHtmlName) {
        this.eventHtmlName = eventHtmlName;
    }
}
