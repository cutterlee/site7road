package com.sz.site7road.entity.banner;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/2 17:47.
 * remark:栏目实体
 */
@Entity
@Table(name = "t_banner")
public class BannerEntity {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    private int id;
    @Column(name = "pid")
    private int pid;
    @Column(name = "banner_name")
    private String bannerName;
    @Column(name = "keywords")
    private String keyWords;
    @Column(name = "description")
    private String description;
    @Column(name = "is_menu")
    private int isMenu;
    @Column(name = "is_index")
    private int isIndex;
    @Column(name = "index_num")
    private int indexNum;
    @Column(name = "is_link")
    private int isLink;
    @Column(name = "url")
    private String url;
    @Column(name = "is_user")
    private int isUser;
    @Column(name = "target")
    private int target;
    @Column(name = "read_me")
    private String readMe;
    @Column(name = "order_num")
    private int orderNum;
    @Column(name = "i_rank")
    private int iRank;
    @Column(name = "path")
    private String path;
    @Column(name = "show_fields")
    private String showFields="";
    @Column(name = "list_path")
    private String listPath;
    @Column(name = "page_path")
    private String pagePath;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getBannerName() {
        return bannerName;
    }

    public void setBannerName(String bannerName) {
        this.bannerName = bannerName;
    }

    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIsMenu() {
        return isMenu;
    }

    public void setIsMenu(int isMenu) {
        this.isMenu = isMenu;
    }

    public int getIsIndex() {
        return isIndex;
    }

    public void setIsIndex(int isIndex) {
        this.isIndex = isIndex;
    }

    public int getIndexNum() {
        return indexNum;
    }

    public void setIndexNum(int indexNum) {
        this.indexNum = indexNum;
    }

    public int getIsLink() {
        return isLink;
    }

    public void setIsLink(int isLink) {
        this.isLink = isLink;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getIsUser() {
        return isUser;
    }

    public void setIsUser(int isUser) {
        this.isUser = isUser;
    }

    public int getTarget() {
        return target;
    }

    public void setTarget(int target) {
        this.target = target;
    }

    public String getReadMe() {
        return readMe;
    }

    public void setReadMe(String readMe) {
        this.readMe = readMe;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public int getiRank() {
        return iRank;
    }

    public void setiRank(int iRank) {
        this.iRank = iRank;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getShowFields() {
        return showFields;
    }

    public void setShowFields(String showFields) {
        this.showFields = showFields;
    }

    public String getListPath() {
        return listPath;
    }

    public void setListPath(String listPath) {
        this.listPath = listPath;
    }

    public String getPagePath() {
        return pagePath;
    }

    public void setPagePath(String pagePath) {
        this.pagePath = pagePath;
    }
}
