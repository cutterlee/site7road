package com.sz.site7road.entity.companyInfo;

import com.google.common.collect.Sets;
import com.sz.site7road.entity.site.SiteEntity;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Set;

/**
 * User： cutter.li
 * Date： 2014/7/25
 * Time： 15:33
 * 备注： 公司信息管理
 */
@Entity
@Table(name = "t_company_info")
public class CompanyEntity {

    private long id=0;

    private String companyName;

    private String companyAddress;

    private String companyLinkway;

    private String companySummary;

    private String companyCulture;

    @JsonIgnore
    private Set<SiteEntity> siteEntitySet= Sets.newHashSet();


    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Column(name = "company_name")
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @Column(name = "company_address")
    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    @Column(name = "company_linkway")
    public String getCompanyLinkway() {
        return companyLinkway;
    }

    public void setCompanyLinkway(String companyLinkway) {
        this.companyLinkway = companyLinkway;
    }

    @Column(name = "company_summary")
    public String getCompanySummary() {
        return companySummary;
    }

    public void setCompanySummary(String comanySummary) {
        this.companySummary = comanySummary;
    }

    @Column(name = "company_culture")
    public String getCompanyCulture() {
        return companyCulture;
    }

    public void setCompanyCulture(String companyCulture) {
        this.companyCulture = companyCulture;
    }

    @OneToMany(mappedBy = "companyEntity")
    @Cascade(value = { org.hibernate.annotations.CascadeType.SAVE_UPDATE,
            org.hibernate.annotations.CascadeType.DELETE})
    @LazyCollection(LazyCollectionOption.TRUE)
    public Set<SiteEntity> getSiteEntitySet() {
        return siteEntitySet;
    }

    public void setSiteEntitySet(Set<SiteEntity> siteEntitySet) {
        this.siteEntitySet = siteEntitySet;
    }
}
