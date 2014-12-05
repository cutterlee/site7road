package com.sz.site7road.controller.auth;

import com.google.common.collect.Lists;
import com.sz.site7road.controller.base.BaseTreeController;
import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.tree.TreeNode;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.ResourceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.ResourceBundle;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/15 17:20.
 * remark:权限控制管理器
 */
@Controller
@RequestMapping(value = "/auth")
public class ResourceGridController extends BaseTreeController<ResourceEntity> {

    @Resource
    private ResourceService resourceService;

    @Override
    protected BaseService getService() {
        return resourceService;
    }

    @Override
    protected String getTitle() {
        return ResourceBundle.getBundle("message").getString("auth.title");
    }

    @Override
    protected String getTemplateDir() {
        return "auth";
    }


    /**
     * 获得树的title字段
     *
     * @return
     */
    @Override
    protected String getTreeNodeTitleField() {
        return "resourceName";
    }
}
