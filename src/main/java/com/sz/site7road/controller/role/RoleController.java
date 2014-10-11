package com.sz.site7road.controller.role;

import com.sz.site7road.controller.base.BaseController;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.framework.tree.TreeNode;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.ResourceService;
import com.sz.site7road.service.RoleInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.ResourceBundle;

/**
 * USER： cutter.li
 * CREATE TIME： 2014-08-01 17:53
 * REMARK：角色管理控制器
 */
@Controller
@RequestMapping(value = "/role")
public class RoleController extends BaseController<RoleInfoEntity> {

    @Resource
    private RoleInfoService service;

    @Resource
    private ResourceService resourceService;

    @Override
    protected BaseService getService() {
        return service;
    }

    @Override
    protected String getTitle() {
        return ResourceBundle.getBundle("message").getString("role.title");
    }

    @Override
    protected String getTemplateDir() {
        return "role";
    }

    /**
     * 给角色分配权限
     * @return
     */
    @RequestMapping(value = "/auth")
    public String auth(ModelMap map) {
        map.addAttribute("title", getTitle());
        map.addAttribute("entityName", getTemplateDir());
        return getTemplateDir() + "/right";
    }

    @RequestMapping(value = "/authTree")
    @ResponseBody
    public List<TreeNode> authTree(ModelMap map) {
        return resourceService.getTreeNodeListByPid(0);
    }

}
