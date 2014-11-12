package com.sz.site7road.controller.company;

import com.sz.site7road.controller.base.BaseGridController;
import com.sz.site7road.entity.companyInfo.CompanyEntity;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.CompanyService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * User： cutter.li
 * Date： 2014/7/25
 * Time： 14:52
 * 备注： 公司信息管理
 */
@Controller
@RequestMapping(value = "/company")
public class CompanyGridController extends BaseGridController<CompanyEntity> {

    private static final Logger log = Logger.getLogger(CompanyGridController.class);

    @Resource
    private CompanyService service;


    @Override
    protected BaseService getService() {
        return  service;
    }

    @Override
    protected String getTitle() {
        return "公司信息";
    }

    @Override
    protected String getTemplateDir() {
        return "company";
    }



}
