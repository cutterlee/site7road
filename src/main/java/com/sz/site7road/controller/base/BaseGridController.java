package com.sz.site7road.controller.base;

import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.grid.ResponseGridEntity;
import com.sz.site7road.framework.grid.ResultForGridForm;
import com.sz.site7road.framework.treegrid.RequestTreeGridEntity;
import com.sz.site7road.framework.treegrid.ResponseTreeGridEntity;
import com.sz.site7road.service.BaseService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 15:52
 * 备注： 基本的增删改查,针对dataGrid单独编写的公用Controller模板
 */
public abstract class BaseGridController<T> {

    protected abstract BaseService getService();

    protected abstract String getTitle();

    protected abstract String getTemplateDir();


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map) {
        Subject currentUser = SecurityUtils.getSubject();
        if(currentUser.isPermitted(getTemplateDir()+":index")) {
            map.addAttribute("title", getTitle());
            map.addAttribute("entityName", getTemplateDir());
            return getTemplateDir() + "/index";
        }else{
            return "redirect:/noRight";
        }
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public ResponseGridEntity list(RequestGridEntity dataGridParam) {
        ResponseGridEntity responseGridEntity = new ResponseGridEntity();
        responseGridEntity.setTotal(getService().getCountByRequestGridEntity(dataGridParam));
        responseGridEntity.setRows(getService().findEntityListByRequestGridEntity(dataGridParam));
        return responseGridEntity;
    }


    @RequestMapping(value = "/create", method = RequestMethod.GET)
    protected String create(ModelMap map) throws IllegalAccessException, Exception {
        Subject currentUser = SecurityUtils.getSubject();
        if(currentUser.isPermitted(getTemplateDir()+":create")) {
            map.addAttribute("entity", getService().createEmptyEntity());
            map.addAttribute("title", "增加" + getTitle());
            map.addAttribute("titleName", getTitle());
            map.addAttribute("op", System.currentTimeMillis());
            map.addAttribute("entityName", getTemplateDir());
            return getTemplateDir() + "/form";
        }else{
            return "redirect:/noRight";
        }
    }

    @RequestMapping(value = "/{id}/remove", method = RequestMethod.POST)
    @ResponseBody
    public ResultForGridForm removeEntity(@PathVariable(value = "id") int id) {
        ResultForGridForm result = new ResultForGridForm();
        try {
            getService().remove(id);
            result.setSuccess();
            result.setErrorMsg(ResourceBundle.getBundle("message").getString("delete.success"));
        } catch (Exception ex) {
            result.setFail();
            result.setErrorMsg(ResourceBundle.getBundle("message").getString("delete.fail"));
            ex.printStackTrace();
        }
        return result;
    }


    @RequestMapping(value = "/{id}/modify", method = RequestMethod.GET)
    public String modifyEntity(@PathVariable(value = "id") int id, ModelMap map) {
        map.addAttribute("entity", getService().findEntityById(id));
        map.addAttribute("title", "编辑" + getTitle());
        map.addAttribute("titleName", getTitle());
        map.addAttribute("op", System.currentTimeMillis());
        map.addAttribute("entityName", getTemplateDir());
        return getTemplateDir() + "/form";
    }

    @RequestMapping(value = "/save")
    @ResponseBody
    protected ResultForGridForm modifyEntitySave(@Valid @ModelAttribute("entity") T entity, BindingResult bindingResult) {
        ResultForGridForm result = new ResultForGridForm();
        result.setSubject("保存信息");
        try {
            if (!bindingResult.hasFieldErrors()) {
                boolean saveResult = getService().modify(entity);
                if (saveResult) {
                    result.setSuccess();
                    result.setErrorMsg(ResourceBundle.getBundle("message").getString("save.success"));
                } else {
                    result.setFail();
                    result.setErrorMsg(ResourceBundle.getBundle("message").getString("save.fail"));
                }
            }else{
                result.setFail();
                result.setErrorMsg(bindingResult.getFieldError().getField()+ bindingResult.getFieldError().getDefaultMessage());
            }
        } catch (Exception ex) {
            result.setFail();
            result.setErrorMsg(ResourceBundle.getBundle("message").getString("save.fail"));
            ex.printStackTrace();
        }
        return result;
    }


    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        CustomDateEditor dateEditor = new CustomDateEditor(fmt, true);
        binder.registerCustomEditor(Date.class, dateEditor);
    }
}
