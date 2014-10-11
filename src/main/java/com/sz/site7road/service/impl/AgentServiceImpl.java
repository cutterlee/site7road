package com.sz.site7road.service.impl;

import com.sz.site7road.dao.agent.AgentDao;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.entity.agent.AgentInfo;
import com.sz.site7road.service.AgentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/22 17:40.
 * remark:
 */
@Service
public class AgentServiceImpl extends AbstractBaseServiceImpl<AgentInfo> implements AgentService {

    @Autowired
    private AgentDao agentDao;

    @Override
    protected BaseDao getBaseDao() {
        return agentDao;
    }
}
