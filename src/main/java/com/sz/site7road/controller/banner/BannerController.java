package com.sz.site7road.controller.banner;

import com.sz.site7road.controller.base.BaseTreeController;
import com.sz.site7road.entity.banner.BannerEntity;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.service.BannerService;
import com.sz.site7road.service.BaseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/2 17:46.
 * remark:栏目管理
 */
@Controller
@RequestMapping(value = "/banner")
public class BannerController extends BaseTreeController<BannerEntity>{

    @Resource
    private BannerService bannerService;

    /**
     * 获取comboTree的数据
     *
     * @return
     */
    @Override
    protected List<ComboTreeResponse> getComboTreeResponse() {
        return null;
    }

    /**
     * 获得service
     *
     * @return
     */
    @Override
    protected BaseService getService() {
        return bannerService;
    }

    /**
     * 获取所要管理的实体标题信息
     *
     * @return
     */
    @Override
    protected String getTitle() {
        return MESSAGE.getString("banner.title");
    }

    /**
     * 获取模板的目录名称
     *
     * @return
     */
    @Override
    protected String getTemplateDir() {
        return "banner";
    }
}
