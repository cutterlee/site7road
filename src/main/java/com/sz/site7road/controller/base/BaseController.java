package com.sz.site7road.controller.base;

import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.grid.ResponseGridEntity;
import com.sz.site7road.framework.grid.ResultForGridForm;
import com.sz.site7road.service.BaseService;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 15:52
 * 备注： 基本的增删改查
 */
public abstract class BaseController<T> {

    protected abstract BaseService getService();

    protected abstract String getTitle();

    protected abstract String getTemplateDir();


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map) {
        map.addAttribute("title", getTitle());
        map.addAttribute("entityName", getTemplateDir());
        return getTemplateDir() + "/index";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public ResponseGridEntity list(RequestGridEntity dataGridParam) {
        ResponseGridEntity responseGridEntity = new ResponseGridEntity();
        responseGridEntity.setTotal(getService().getCountByRequestGridEntity(dataGridParam));
        responseGridEntity.setRows(getService().findEntityListByRequestGridEntity(dataGridParam));
        return responseGridEntity;
    }

    @RequestMapping(value = "/create",method = RequestMethod.GET)
    protected String create( ModelMap map) throws IllegalAccessException, InstantiationException {
        map.addAttribute("entity", getService().createEmptyEntity());
        map.addAttribute("title", "增加"+getTitle());
        map.addAttribute("titleName", getTitle());
        map.addAttribute("op",System.currentTimeMillis());
        map.addAttribute("entityName", getTemplateDir());
        return getTemplateDir()+"/form";
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
        map.addAttribute("op",System.currentTimeMillis());
        map.addAttribute("entityName", getTemplateDir());
        return getTemplateDir() + "/form";
    }

    @RequestMapping(value = "/save")
    @ResponseBody
    protected ResultForGridForm modifyEntitySave(T entity) {
        ResultForGridForm result = new ResultForGridForm();
        try {
            getService().modify(entity);
            result.setSuccess();
            result.setErrorMsg(ResourceBundle.getBundle("message").getString("save.success"));
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
