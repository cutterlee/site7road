package com.sz.site7road.service.impl;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Strings;
import com.google.common.collect.Collections2;
import com.google.common.collect.Lists;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.config.ConfigDao;
import com.sz.site7road.entity.config.ConfigEntity;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.grid.GridQueryCondition;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.tree.TreeNode;
import com.sz.site7road.service.ConfigService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/10 10:33.
 * remark: 配置管理的service接口实现类
 */
@Service
public class ConfigServiceImpl extends AbstractBaseServiceImpl<ConfigEntity> implements ConfigService {

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
        RequestGridEntity dataGridParam = new RequestGridEntity();
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



    /**
     * 通过configKey获取孩子集合
     *
     * @param configKey 配置的key
     * @return 对应的孩子集合
     */
    @Override
    public List<ConfigEntity> findChildrenByConfigKey(String configKey) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(configKey));
        return configDao.findChildrenByConfigKey(configKey);
    }

}
