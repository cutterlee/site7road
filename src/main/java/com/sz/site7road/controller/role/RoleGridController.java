package com.sz.site7road.controller.role;

import com.sz.site7road.controller.base.BaseGridController;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.entity.user.UserInfoEntity;
import com.sz.site7road.framework.grid.ResultForGridForm;
import com.sz.site7road.framework.tree.TreeNode;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.ResourceService;
import com.sz.site7road.service.RoleInfoService;
import com.sz.site7road.service.UsrService;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
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

    private static final Logger log=Logger.getLogger(RoleGridController.class);

    @Resource
    private RoleInfoService service;

    @Resource
    private ResourceService resourceService;


    @Resource
    private UsrService usrService;

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
    public String auth(ModelMap map,int roleId) {
        map.addAttribute("title", getTitle());
        map.addAttribute("titleName","角色管理");
        map.addAttribute("entityName", getTemplateDir());
        map.addAttribute("roleId",roleId);
        return getTemplateDir() + "/right";
    }

    @RequestMapping(value = "/authTree")
    @ResponseBody
    public List<TreeNode> authTree(ModelMap map,int roleId) {
        return  resourceService.getAuthCheckedTree(roleId);
    }


    /**
     * 权限分配
     * @return
     */
    @RequestMapping(value = "/giveRight")
    @ResponseBody
    public ResultForGridForm giveRight(String resourceIdArray,int roleId){

        ResultForGridForm resultForGridForm=new ResultForGridForm();
        resultForGridForm.setSubject("分配权限");
        //get the login userId
        Subject loginUser= SecurityUtils.getSubject();
        if(loginUser.isAuthenticated())
        {
            //remove the old resource
            boolean removeResult=resourceService.removeByRoleId(roleId);
            log.info("删除原有权限");
            //insert the new resource
            int[] resourceIds={};
            try {
                resourceIds=new ObjectMapper().readValue(resourceIdArray,(new int[]{}).getClass());
            } catch (IOException e) {
                e.printStackTrace();
            }
            boolean giveRightResult=resourceService.batchInsertResource(resourceIds,roleId);
            log.info("增加现有权限");
            if(giveRightResult)
            {
                resultForGridForm.setSuccess();
                resultForGridForm.setErrorMsg("分配权限成功");
            }else{
                resultForGridForm.setFail();
                resultForGridForm.setErrorMsg("分配权限失败");
            }
        }
        return resultForGridForm;
    }

    /**
     * 删除角色之后,顺带删除角色对应的权限信息
     * @param id 角色id
     * @return 删除的结果
     */
    @Override
    public ResultForGridForm removeEntity(@PathVariable(value = "id") int id) {
        //remove the role resource
        resourceService.removeByRoleId(id);
        return super.removeEntity(id);
    }
}
