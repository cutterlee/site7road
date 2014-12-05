package com.sz.site7road.entity.article;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/3 9:51.
 * remark:文章实体
 */
@Entity
@Table(name = "t_article")
public class ArticleEntity {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    private int id;
    @Column(name = "title")
    private String title;
    @Column(name = "title_color")
    private String titleColor;
    @Column(name = "author")
    private String author;
    @Column(name = "keywords")
    private String keywords;
    @Column(name = "description")
    private String description;
    @Column(name = "note")
    private String note;
    @Column(name = "link_url")
    private String linkUrl;
    @Column(name = "status")
    private int status;
    @Column(name = "copy_from")
    private String copyFrom;
    @Column(name = "add_time")
    private Date addTime=new Date(System.currentTimeMillis());
    @Column(name = "is_link")
    private int isLink;
    @Column(name = "is_flash")
    private int isFlash;
    @Column(name = "is_top")
    private int isTop;
    @Column(name = "is_img")
    private int isImg;
    @Column(name = "img_url")
    private String imgUrl;
    @Column(name = "is_hot")
    private int isHot;
    @Column(name = "page_num")
    private int pageNum;
    @Column(name = "hits")
    private int hits;
    @Column(name = "content")
    private String content;
    @Column(name = "type_id")
    private int typeId;
    @Column(name = "vote_id")
    private int voteId;
    @Column(name = "is_from_mobile")
    private int isFromMobile;
    @Column(name = "price")
    private String price;
    @Column(name = "color")
    private String color;
    @Column(name = "product_model")
    private String productModel;
    @Column(name = "uid")
    private int uid;


//    private int id;
//    private String title;
//    private String titlecolor;
//    private String author;
//    private String keywords;
//    private String description;
//    private String note;
//    private String linkurl;
//    private int status;
//    private String copyfrom;
//    private Date addtime;
//    private int islink;
//    private int isflash;
//    private int istop;
//    private int isimg;
//    private String imgurl;
//    private int ishot;
//    private int pagenum
//    private int hits;
//    private String content;
//    private int typeid;
//    private int voteid;
//    private int is_from_mobile;
//    private float price;
//    private String color;
//    private String product_xinghao;
//    private int uid;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitleColor() {
        return titleColor;
    }

    public void setTitleColor(String titleColor) {
        this.titleColor = titleColor;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCopyFrom() {
        return copyFrom;
    }

    public void setCopyFrom(String copyFrom) {
        this.copyFrom = copyFrom;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public int getIsLink() {
        return isLink;
    }

    public void setIsLink(int isLink) {
        this.isLink = isLink;
    }

    public int getIsFlash() {
        return isFlash;
    }

    public void setIsFlash(int isFlash) {
        this.isFlash = isFlash;
    }

    public int getIsTop() {
        return isTop;
    }

    public void setIsTop(int isTop) {
        this.isTop = isTop;
    }

    public int getIsImg() {
        return isImg;
    }

    public void setIsImg(int isImg) {
        this.isImg = isImg;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public int getIsHot() {
        return isHot;
    }

    public void setIsHot(int isHot) {
        this.isHot = isHot;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getHits() {
        return hits;
    }

    public void setHits(int hits) {
        this.hits = hits;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getVoteId() {
        return voteId;
    }

    public void setVoteId(int voteId) {
        this.voteId = voteId;
    }

    public int getIsFromMobile() {
        return isFromMobile;
    }

    public void setIsFromMobile(int isFromMobile) {
        this.isFromMobile = isFromMobile;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getProductModel() {
        return productModel;
    }

    public void setProductModel(String productModel) {
        this.productModel = productModel;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}
