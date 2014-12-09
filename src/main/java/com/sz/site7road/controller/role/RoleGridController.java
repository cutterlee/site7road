package com.sz.site7road.controller.role;

import com.sz.site7road.controller.base.BaseGridController;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.framework.grid.ResultForGridForm;
import com.sz.site7road.framework.tree.TreeNode;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.ResourceService;
import com.sz.site7road.service.RoleInfoService;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

/**
 * USER： cutter.li
 * CREATE TIME： 2014-08-01 17:53
 * REMARK：角色管理控制器
 */
@Controller
@RequestMapping(value = "/role")
public class RoleGridController extends BaseGridController<RoleInfoEntity> {

    private static final Logger log = Logger.getLogger(RoleGridController.class);

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
     *
     * @return
     */
    @RequestMapping(value = "/auth")
    public String auth(ModelMap map, int roleId) {
        String authPermission = getTemplateDir() + ":auth";
        if (hasPermission(authPermission)) {
            map.addAttribute("title", MESSAGE.getString("give.right"));
            map.addAttribute("entityName", getTemplateDir());
            map.addAttribute("roleId", roleId);
            //set index title and icon
            setIndexPageIcon(map,"/"+getTemplateDir()+"/index");
            return getTemplateDir() + "/right";
        } else {
            return "redirect:/noRight";
        }
    }

    @RequestMapping(value = "/authTree")
    @ResponseBody
    public List<TreeNode> authTree(ModelMap map, int roleId) {
        String authPermission = getTemplateDir() + ":auth";
        if (hasPermission(authPermission)) {
            return resourceService.getAuthCheckedTree(roleId);
        }
        return null;
    }


    /**
     * 权限分配
     *
     * @return
     */
    @RequestMapping(value = "/giveRight")
    @ResponseBody
    public ResultForGridForm giveRight(String resourceIdArray, int roleId) {

        String giveRightPermission = getTemplateDir() + ":auth";

        ResultForGridForm resultForGridForm = new ResultForGridForm();
        resultForGridForm.setSubject("分配权限");
        if (hasPermission(giveRightPermission)) {
            //get the login userId
            //remove the old resource
            boolean removeResult = resourceService.removeByRoleId(roleId);
            log.info("删除原有权限");
            //insert the new resource
            int[] resourceIds = {};
            try {
                resourceIds = new ObjectMapper().readValue(resourceIdArray, (new int[]{}).getClass());
            } catch (IOException e) {
                e.printStackTrace();
            }
            boolean giveRightResult = resourceService.batchInsertResource(resourceIds, roleId);
            log.info("增加现有权限");
            if (giveRightResult) {
                resultForGridForm.setSuccess();
                resultForGridForm.setErrorMsg("分配权限成功");
            } else {
                resultForGridForm.setFail();
                resultForGridForm.setErrorMsg("分配权限失败");
            }
        } else {
            resultForGridForm.setErrorMsg(MESSAGE.getString("no.right"));
        }
        return resultForGridForm;
    }

    /**
     * 删除角色之后,顺带删除角色对应的权限信息
     *
     * @param id 角色id
     * @return 删除的结果
     */
    @Override
    public ResultForGridForm removeEntity(@PathVariable(value = "id") int id) {
        //remove the role resource
        resourceService.removeByRoleId(id);
        return super.removeEntity(id);
    }

    /**
     * 列表页
     *
     * @param map ftl用到的数据
     * @return 数据列表页
     */
    @Override
    protected String index(ModelMap map) {

        String indexPage = super.index(map);
        //check user has the auth
        String authPermission = getTemplateDir() + ":auth";
        map.addAttribute("authPermission", hasPermission(authPermission));
        return indexPage;
    }
}
