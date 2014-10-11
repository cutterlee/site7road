package com.sz.site7road.controller.job;

import com.sz.site7road.controller.base.BaseController;
import com.sz.site7road.entity.job.JobEntity;
import com.sz.site7road.framework.config.AppConstant;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.JobService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ResourceBundle;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/19 10:57.
 * remark:职位信息管理
 */
@Controller
@RequestMapping(value = "/job")
public class JobController extends BaseController<JobEntity> {

    private static final Logger log = Logger.getLogger(JobController.class);

    @Resource
    private JobService jobService;

    @Override
    protected BaseService getService() {
        return jobService;
    }

    @Override
    protected String getTitle() {
        return ResourceBundle.getBundle(AppConstant.MESSAGE_NAME).getString("job.title");
    }

    @Override
    protected String getTemplateDir() {
        return "job";
    }
}
