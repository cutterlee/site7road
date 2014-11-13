package com.sz.site7road.entity.config;

import com.google.common.base.Strings;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.Date;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/10 9:45.
 * remark:配置信息实体
 */
@Entity
@Table(name = "t_config")
public class ConfigEntity {

    /**
     * 主键id
     */
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    private int id;

    /**
     * 配置的种类
     */
    @Column(name = "config_type")
    private int configType=ConfigType.SYSTEM.getKey();

    /**
     * 父id
     */
    @Column(name = "pid")
    private int pid;

    /**
     * 配置的key
     */
    @Column(name = "config_key")
    private String  configKey;

    /**
     * 配置的标题或者内容
     */
    @NotBlank
    @Column(name = "config_title")
    private String  configTitle;

    /**
     * 配置的描述说明
     */
    @Column(name = "config_remark")
    private String  configRemark;


    /**
     * 排序号
     */
    @Column(name = "order_num")
    private int orderNum=1;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime=new Date(System.currentTimeMillis());

    /**
     * 状态
     */
    @Column(name = "item_status")
    private int ItemStatus=1;

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

    public String getConfigKey() {
        if(Strings.isNullOrEmpty(configKey))
        {
            configKey="config_key_"+System.currentTimeMillis();
        }
        return configKey;
    }

    public void setConfigKey(String configKey) {
        this.configKey = configKey;
    }

    public String getConfigTitle() {
        return configTitle;
    }

    public void setConfigTitle(String configTitle) {
        this.configTitle = configTitle;
    }

    public String getConfigRemark() {
        return configRemark;
    }

    public void setConfigRemark(String configRemark) {
        this.configRemark = configRemark;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public int getConfigType() {
        return configType;
    }

    public ConfigType getConfigTypeEnum() {
        return ConfigType.getConfigType(configType);
    }

    public void setConfigType(int configType) {
        this.configType = configType;
    }

    public Date getCreateTime() {
        if(null!=createTime)
        {
            return createTime;
        }else{
            return null;
        }
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getItemStatus() {
        return ItemStatus;
    }

    public void setItemStatus(int itemStatus) {
        ItemStatus = itemStatus;
    }

    public ConfigEntity() {
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("ConfigEntity{");
        sb.append("id=").append(id);
        sb.append(", configType=").append(configType);
        sb.append(", pid=").append(pid);
        sb.append(", configKey='").append(configKey).append('\'');
        sb.append(", configTitle='").append(configTitle).append('\'');
        sb.append(", configRemark='").append(configRemark).append('\'');
        sb.append(", orderNum=").append(orderNum);
        sb.append('}');
        return sb.toString();
    }
}
