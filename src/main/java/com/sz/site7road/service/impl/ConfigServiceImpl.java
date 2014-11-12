package com.sz.site7road.service.impl;

import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.config.ConfigDao;
import com.sz.site7road.entity.config.ConfigEntity;
import com.sz.site7road.framework.grid.GridQueryCondition;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.service.ConfigService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/10 10:33.
 * remark: 配置管理的service接口实现类
 */
@Service
public class ConfigServiceImpl extends AbstractBaseServiceImpl<ConfigEntity> implements ConfigService{

    @Resource
    private ConfigDao configDao;

    @Override
    protected BaseDao getBaseDao() {
        return configDao;
    }

    /**
     * 获取第一级别的配置信息,也就是pid为0的配置信息
     *
     * @return 第一级别的配置信息列表
     */
    @Override
    public List<ConfigEntity> getTopLevelConfig() {
        RequestGridEntity dataGridParam=new RequestGridEntity();
        dataGridParam.setPage(1);
        dataGridParam.setRows(100);
        dataGridParam.setOrder("order_num");
        GridQueryCondition condition = new GridQueryCondition();
        condition.setPropertyName("pid");
        condition.setPropertyValue("0");
        condition.setWhere("eq");
        dataGridParam.setCondition_1(condition);
        return configDao.findEntityListByRequestGridEntity(dataGridParam);
    }
}
