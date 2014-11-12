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
     * 站点名称
     */
    private String siteName;
    /**
     * 站点简称
     */
    private String siteAlias;
    /**
     * 站点url
     */
    private String siteUrl;
    /**
     * 图片域名
     */

    private String staticUrl;
    /**
     * 站点图标
     */
    private String siteIcon;
    /**
     * 站点目录
     */
    private String siteDir;
    /**
     * 静态资源目录
     */
    private String staticDir;
    /**
     * 模版目录
     */
    private String templateDir;
    /**
     * 公司信息
     */
    @JsonIgnore
    private CompanyEntity companyEntity=new CompanyEntity();

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

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH},fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    public CompanyEntity getCompanyEntity() {
        return companyEntity;
    }

    public void setCompanyEntity(CompanyEntity companyEntity) {
        this.companyEntity = companyEntity;
    }
}
