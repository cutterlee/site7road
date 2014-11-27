package com.sz.site7road.dao.config;

import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.entity.config.ConfigEntity;

import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/10 10:34.
 * remark:  配置信息管理的dao接口
 */
public interface ConfigDao extends BaseDao<ConfigEntity>{
    /**
     * 根据configKey找到孩子集合
     * @param configKey 配置key
     * @return 孩子集合
     */
    List<ConfigEntity> findChildrenByConfigKey(String configKey);
}
