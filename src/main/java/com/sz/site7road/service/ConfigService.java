package com.sz.site7road.service;

import com.sz.site7road.entity.config.ConfigEntity;

import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/10 10:32.
 * remark: 配置管理的service接口
 */
public interface ConfigService extends BaseService<ConfigEntity>{
    /**
     * 获取第一级别的配置信息,也就是pid为0的配置信息
     * @return 第一级别的配置信息列表
     */
    List<ConfigEntity> getTopLevelConfig();
}
