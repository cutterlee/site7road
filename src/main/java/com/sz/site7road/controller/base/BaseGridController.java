package com.sz.site7road.controller.base;

import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.grid.ResponseGridEntity;
import com.sz.site7road.framework.grid.ResultForGridForm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 15:52
 * 备注： 基本的增删改查,针对dataGrid单独编写的公用Controller模板
 */
public abstract class BaseGridController<T> extends BaseController<T> {


    /**
     * 初始化dataGrid的接口
     * @param dataGridParam 查询参数
     * @return dataGrid的内容
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    protected ResponseGridEntity list(RequestGridEntity dataGridParam) {
        Subject currentUser = SecurityUtils.getSubject();
        String indexPermission = getTemplateDir() + ":index";
        ResponseGridEntity responseGridEntity = new ResponseGridEntity();
        if (currentUser.isPermitted(indexPermission)) {
            responseGridEntity.setTotal(getService().getCountByRequestGridEntity(dataGridParam));
            responseGridEntity.setRows(getService().findEntityListByRequestGridEntity(dataGridParam));
        }
        return responseGridEntity;
    }

    /**
     * 跳转到增加页面
     * @param map 请求的数据
     * @return 增加信息页面
     * @throws Exception
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    protected String create(ModelMap map) throws Exception {
        Subject currentUser = SecurityUtils.getSubject();
        String addPagePermission = getTemplateDir() + ":create";
        if (currentUser.isPermitted(addPagePermission)) {
            map.addAttribute("entity", getService().createEmptyEntity());
            map.addAttribute("titleName", MESSAGE.getString("create")+getTitle());
            map.addAttribute("op", System.currentTimeMillis());
            map.addAttribute("entityName", getTemplateDir());
            String permissionUrl = "/" + getTemplateDir() + "/index";
            setIndexPageIcon(map, permissionUrl);
            return getTemplateDir() + "/form";
        } else {
            return "redirect:/noRight";
        }
    }

    /**
     * 删除信息接口
     * @param id 删除信息的id
     * @return 删除的结果
     */
    @RequestMapping(value = "/{id}/remove", method = RequestMethod.POST)
    @ResponseBody
    public ResultForGridForm removeEntity(@PathVariable(value = "id") int id) {
        Subject currentUser = SecurityUtils.getSubject();
        String removePagePermission = getTemplateDir() + ":remove";
        ResultForGridForm result = new ResultForGridForm();
        result.setSubject(MESSAGE.getString("remove"));
        if (currentUser.isPermitted(removePagePermission)) {
            try {
                boolean removeResult = getService().remove(id);
                if (removeResult) {
                    result.setSuccess();
                    result.setErrorMsg(MESSAGE.getString("delete.success"));
                } else {
                    result.setFail();
                    result.setErrorMsg(MESSAGE.getString("delete.fail"));
                }
            } catch (Exception ex) {
                result.setFail();
                result.setErrorMsg(MESSAGE.getString("delete.fail"));
                ex.printStackTrace();
            }
        }else{
            result.setErrorMsg(MESSAGE.getString("no.right"));
        }
        return result;
    }

}
