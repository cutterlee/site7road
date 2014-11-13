package com.sz.site7road.controller.base;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sz.site7road.entity.config.ConfigEntity;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.grid.ResponseGridEntity;
import com.sz.site7road.framework.grid.ResultForGridForm;
import com.sz.site7road.framework.tree.TreeNode;
import com.sz.site7road.framework.treegrid.RequestTreeGridEntity;
import com.sz.site7road.framework.treegrid.ResponseTreeGridEntity;
import com.sz.site7road.service.BaseService;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.lang.reflect.InvocationTargetException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 15:52
 * 备注： 基本的增删改查,针对TreeGrid单独编写的的通用controller模板
 */
public abstract class BaseTreeController<T> {

    /**
     * 获得service
     * @return
     */
    protected abstract BaseService getService();

    /**
     * 获取所要管理的实体标题信息
     * @return
     */
    protected abstract String getTitle();

    /**
     * 获取模板的目录名称
     * @return
     */
    protected abstract String getTemplateDir();

    /**
     * 获取comboTree的数据
     * @return
     */
    protected abstract List<ComboTreeResponse>  getComboTreeResponse();

    /**
     * 给返回的list对象添加parent属性
     * @param entityListByRequestTreeGridEntity 查询得到的列表
     * @return 添加_parentId 之后的list
     */
    protected  List appendParentProperty(List entityListByRequestTreeGridEntity){

        Preconditions.checkArgument(entityListByRequestTreeGridEntity!=null);
        Preconditions.checkArgument(!entityListByRequestTreeGridEntity.isEmpty());
        Map<Integer,Integer> idMap=Maps.newHashMap();
        for(Object entity:entityListByRequestTreeGridEntity)
        {
            int id= 0;
            try {
                id = Integer.parseInt(BeanUtils.getProperty(entity, "id"));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
            idMap.put(id,id);
        }

        List entityList= Lists.newLinkedList();
        for(Object treeGridEntity:entityListByRequestTreeGridEntity)
        {
            T entity= (T) treeGridEntity;
            Map<String,Object> dataMap= Maps.newHashMap();
            try {
                //把已知的属性都放到map里面
                Map entityMap= BeanUtils.describe(entity);
                dataMap.putAll(entityMap);
                //把pid替换为_parentId
                String pid= BeanUtils.getProperty(entity,"pid");
                if(!Strings.isNullOrEmpty(pid))
                {
                    int intPid=Integer.parseInt(pid);
                    if(intPid>0&&idMap.containsKey(intPid))
                    {
                        dataMap.remove("pid");
                        dataMap.put("_parentId",intPid);
//                        dataMap.put("state","closed");
                    }else{
                        //默认一级配置都是打开的
//                        dataMap.put("state","closed");
                    }
                }

                //设置图标
               String icon=  BeanUtils.getProperty(entity,"resourceIcon");
               if(!Strings.isNullOrEmpty(icon))
               {
                   dataMap.put("iconCls",icon);
               }


            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
//                e.printStackTrace();
            }

            entityList.add(dataMap);
        }
        return entityList;
    }


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap map) {
        map.addAttribute("title", getTitle());
        map.addAttribute("entityName", getTemplateDir());
        return getTemplateDir() + "/index";
    }


    @RequestMapping(value = "/tree")
    @ResponseBody
    public ResponseTreeGridEntity tree(RequestTreeGridEntity treeGridParam) {
        ResponseTreeGridEntity responseTreeGridEntity = new ResponseTreeGridEntity();

        treeGridParam.setSort("orderNum");
        List entityListByRequestTreeGridEntity = getService().findEntityListByRequestTreeGridEntity(treeGridParam);
        if(entityListByRequestTreeGridEntity!=null&&!entityListByRequestTreeGridEntity.isEmpty())
        {
            List entityList= appendParentProperty(entityListByRequestTreeGridEntity);
            responseTreeGridEntity.setRows(entityList);
        }
        responseTreeGridEntity.setTotal(getService().getCountByRequestTreeGridEntity(treeGridParam));
        return responseTreeGridEntity;
    }


    @RequestMapping(value = "/comboTree")
    @ResponseBody
    public List<ComboTreeResponse>  comboTree() {
       return getComboTreeResponse();
    }




    @RequestMapping(value = "/create",method = RequestMethod.GET)
    protected String create( ModelMap map,int pid) throws IllegalAccessException, InstantiationException, InvocationTargetException,Exception {
        Object emptyEntity = getService().createEmptyEntity();
        if(pid>0)
        {
            BeanUtils.setProperty(emptyEntity,"pid",pid);
        }
        map.addAttribute("entity", emptyEntity);
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
        result.setSubject("删除信息");
        try {
           boolean removeResult= getService().remove(id)&&getService().removeChildrenByPid(id);
            if(removeResult) {
                result.setSuccess();
                result.setErrorMsg(ResourceBundle.getBundle("message").getString("delete.success"));
            }
            else{
                result.setFail();
                result.setErrorMsg(ResourceBundle.getBundle("message").getString("delete.fail"));
            }
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
