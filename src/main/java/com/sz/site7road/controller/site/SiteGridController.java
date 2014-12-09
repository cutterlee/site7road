package com.sz.site7road.controller.site;

import com.sz.site7road.controller.base.BaseGridController;
import com.sz.site7road.entity.site.SiteEntity;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.SiteService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 15:51
 * 备注： 站点管理控制器
 */
@Controller
@RequestMapping(value = "/site")
public class SiteGridController extends BaseGridController<SiteEntity> {

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


    /**
     * 上传文件之后,把得到的路径保存到实体的属性中去
     *
     * @param entity       实体
     * @param fileUrlArray 文件的url路径列表
     */
    @Override
    protected void setFilePathToEntityProperty(SiteEntity entity, List<String> fileUrlArray) {
        if(!fileUrlArray.isEmpty())
        {
            String siteIcon=fileUrlArray.get(0);
            entity.setSiteIcon(siteIcon);
        }
        super.setFilePathToEntityProperty(entity, fileUrlArray);
    }
}
