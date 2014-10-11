package com.sz.site7road.controller.site;

import com.sz.site7road.controller.base.BaseController;
import com.sz.site7road.entity.site.SiteEntity;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.SiteService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 15:51
 * 备注： 站点管理控制器
 */
@Controller
@RequestMapping(value = "/site")
public class SiteController extends BaseController<SiteEntity> {

    @Resource
    private SiteService service;

    @Override
    protected BaseService getService() {
        return service;
    }

    @Override
    protected String getTitle() {
        return "站点信息" ;
    }

    @Override
    protected String getTemplateDir() {
        return "site";
    }


}
