package com.sz.site7road.service.impl;

import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.job.JobDao;
import com.sz.site7road.entity.job.JobEntity;
import com.sz.site7road.service.JobService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/19 15:48.
 * remark:职位信息服务实现类
 */
@Service
public class JobServiceImpl extends AbstractBaseServiceImpl<JobEntity> implements JobService{

    private static final Logger log=Logger.getLogger(JobServiceImpl.class);

    @Autowired
    private JobDao jobDao;

    @Override
    protected BaseDao getBaseDao() {
        return jobDao;
    }
}
