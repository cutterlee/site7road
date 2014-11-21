package com.sz.site7road.entity.site;


import com.sz.site7road.entity.companyInfo.CompanyEntity;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * User： cutter.li
 * Date： 2014/7/25
 * Time： 12:04
 * 备注： 站点信息
 */
@Entity
@Table(name = "t_site")
public class SiteEntity implements Serializable {
    /**
     * 主键id
     */
    private int id;
    /**
     * 站点简称
     */
    private String siteAlias;
    /**
     * 站点名称
     */
    private String siteName;
    /**
     * 站点图标
     */
    private String siteIcon;
    /**
     * 站点url
     */
    private String siteUrl;
    /**
     * 站点目录
     */
    private String siteDir;
    /**
     * 图片域名
     */

    private String staticUrl;
    /**
     * 静态资源目录
     */
    private String staticDir;
    /**
     * 模版目录
     */
    private String templateDir;
    /**
     * 站点所有者,如果是公司,填写公司名称,如果是个人,填写个人的口号
     */
    private String siteOwner;
    /**
     * 联系地址
     */
    private String address;
    /**
     * 联系电话
     */
    private String phoneNum;
    /**
     * 邮政编码
     */
    private String zipCode;
    /**
     * 备案编号
     */
    private String backUpNum;
    /**
     * 站点关闭信息
     */
    private String closeMsg;
    /**
     * 最大的上传文件大小
     */
    private Integer maxFileSize=1024;
    /**
     * 上传文件的后缀限制
     */
    private String fileTypes;
    /**
     * 图片的保存路径
     */
    private String imageSavePath;
    /**
     * css的保存路径
     */
    private String cssSavePath;
    /**
     * js文件的保存路径
     */
    private String jsSavePath;
    /**
     * 其它文件的保存路径
     */
    private String otherSavePath;
    /**
     * cookie的域名
     */
    private String cookieDomain;


    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(strategy = "increment", name = "increment")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "site_name")
    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    @Column(name = "site_alias")
    public String getSiteAlias() {
        return siteAlias;
    }

    public void setSiteAlias(String siteAlias) {
        this.siteAlias = siteAlias;
    }

    @Column(name = "site_url")
    public String getSiteUrl() {
        return siteUrl;
    }

    public void setSiteUrl(String siteUrl) {
        this.siteUrl = siteUrl;
    }

    @Column(name = "static_url")
    public String getStaticUrl() {
        return staticUrl;
    }

    public void setStaticUrl(String staticUrl) {
        this.staticUrl = staticUrl;
    }

    @Column(name = "site_icon")
    public String getSiteIcon() {
        return siteIcon;
    }

    public void setSiteIcon(String siteIcon) {
        this.siteIcon = siteIcon;
    }

    @Column(name = "site_dir")
    public String getSiteDir() {
        return siteDir;
    }

    public void setSiteDir(String siteDir) {
        this.siteDir = siteDir;
    }


    @Column(name = "static_dir")
    public String getStaticDir() {
        return staticDir;
    }

    public void setStaticDir(String staticDir) {
        this.staticDir = staticDir;
    }

    @Column(name = "template_dir")
    public String getTemplateDir() {
        return templateDir;
    }

    public void setTemplateDir(String templateDir) {
        this.templateDir = templateDir;
    }
    @Column(name = "site_owner")
    public String getSiteOwner() {
        return siteOwner;
    }

    public void setSiteOwner(String siteOwner) {
        this.siteOwner = siteOwner;
    }

    @Column(name = "site_address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "site_phonenum")
    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }
    @Column(name = "zip_code")
    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
    @Column(name = "back_up_num")
    public String getBackUpNum() {
        return backUpNum;
    }

    public void setBackUpNum(String backUpNum) {
        this.backUpNum = backUpNum;
    }

    @Column(name = "close_msg")
    public String getCloseMsg() {
        return closeMsg;
    }

    public void setCloseMsg(String closeMsg) {
        this.closeMsg = closeMsg;
    }

    @Column(name = "max_file_size")
    public Integer getMaxFileSize() {
        return maxFileSize;
    }

    public void setMaxFileSize(Integer maxFileSize) {
        this.maxFileSize = maxFileSize;
    }

    @Column(name = "file_types")
    public String getFileTypes() {
        return fileTypes;
    }

    public void setFileTypes(String fileTypes) {
        this.fileTypes = fileTypes;
    }
    @Column(name = "image_save_path")
    public String getImageSavePath() {
        return imageSavePath;
    }

    public void setImageSavePath(String imageSavePath) {
        this.imageSavePath = imageSavePath;
    }
    @Column(name = "css_save_path")
    public String getCssSavePath() {
        return cssSavePath;
    }

    public void setCssSavePath(String cssSavePath) {
        this.cssSavePath = cssSavePath;
    }
    @Column(name = "js_save_path")
    public String getJsSavePath() {
        return jsSavePath;
    }

    public void setJsSavePath(String jsSavePath) {
        this.jsSavePath = jsSavePath;
    }
    @Column(name = "other_save_path")
    public String getOtherSavePath() {
        return otherSavePath;
    }

    public void setOtherSavePath(String otherSavePath) {
        this.otherSavePath = otherSavePath;
    }
    @Column(name = "cookie_domain")
    public String getCookieDomain() {
        return cookieDomain;
    }

    public void setCookieDomain(String cookieDomain) {
        this.cookieDomain = cookieDomain;
    }
}
