package com.sz.site7road.controller.base;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.grid.ResultForGridForm;
import com.sz.site7road.framework.treegrid.RequestTreeGridEntity;
import com.sz.site7road.framework.treegrid.ResponseTreeGridEntity;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 15:52
 * 备注： 基本的增删改查,针对TreeGrid单独编写的的通用controller模板
 */
public abstract class BaseTreeController<T> extends BaseController<T> {


    /**
     * 获取comboTree的数据
     *
     * @return
     */
    protected abstract List<ComboTreeResponse> getComboTreeResponse();

    /**
     * 给返回的list对象添加parent属性
     *
     * @param entityListByRequestTreeGridEntity 查询得到的列表
     * @return 添加_parentId 之后的list
     */
    protected List appendParentProperty(List entityListByRequestTreeGridEntity) {

        Preconditions.checkArgument(entityListByRequestTreeGridEntity != null);
        Preconditions.checkArgument(!entityListByRequestTreeGridEntity.isEmpty());
        Map<Integer, Integer> idMap = Maps.newHashMap();
        for (Object entity : entityListByRequestTreeGridEntity) {
            int id = 0;
            try {
                id = Integer.parseInt(BeanUtils.getProperty(entity, "id"));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
            idMap.put(id, id);
        }

        List entityList = Lists.newLinkedList();
        for (Object treeGridEntity : entityListByRequestTreeGridEntity) {
            T entity = (T) treeGridEntity;
            Map<String, Object> dataMap = Maps.newHashMap();
            try {
                //把已知的属性都放到map里面
                Map entityMap = BeanUtils.describe(entity);
                dataMap.putAll(entityMap);
                //把pid替换为_parentId
                String pid = BeanUtils.getProperty(entity, "pid");
                if (!Strings.isNullOrEmpty(pid)) {
                    int intPid = Integer.parseInt(pid);
                    if (intPid > 0 && idMap.containsKey(intPid)) {
                        dataMap.remove("pid");
                        dataMap.put("_parentId", intPid);
//                        dataMap.put("state","closed");
                    } else {
                        //默认一级配置都是打开的
//                        dataMap.put("state","closed");
                    }
                }

                //设置图标
                String icon = BeanUtils.getProperty(entity, "resourceIcon");
                if (!Strings.isNullOrEmpty(icon)) {
                    dataMap.put("iconCls", icon);
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


    @RequestMapping(value = "/tree")
    @ResponseBody
    public ResponseTreeGridEntity tree(RequestTreeGridEntity treeGridParam) {
        ResponseTreeGridEntity responseTreeGridEntity = new ResponseTreeGridEntity();

        treeGridParam.setSort("orderNum");
        List entityListByRequestTreeGridEntity = getService().findEntityListByRequestTreeGridEntity(treeGridParam);
        if (entityListByRequestTreeGridEntity != null && !entityListByRequestTreeGridEntity.isEmpty()) {
            List entityList = appendParentProperty(entityListByRequestTreeGridEntity);
            responseTreeGridEntity.setRows(entityList);
        }
        responseTreeGridEntity.setTotal(getService().getCountByRequestTreeGridEntity(treeGridParam));
        return responseTreeGridEntity;
    }


    @RequestMapping(value = "/comboTree")
    @ResponseBody
    protected List<ComboTreeResponse> comboTree() {
        return getComboTreeResponse();
    }


    /**
     * 跳转到增加页面
     *
     * @param map 请求的数据
     * @return 增加信息页面
     * @throws Exception
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    protected String create(ModelMap map, int pid) throws Exception {
        Subject currentUser = SecurityUtils.getSubject();
        String addPagePermission = getTemplateDir() + ":create";
        if (currentUser.isPermitted(addPagePermission)) {
            Object emptyEntity = getService().createEmptyEntity();
            if (pid > 0) {
                BeanUtils.setProperty(emptyEntity, "pid", pid);
            }
            map.addAttribute("entity", emptyEntity);
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

    @RequestMapping(value = "/{id}/remove", method = RequestMethod.POST)
    @ResponseBody
    public ResultForGridForm removeEntity(@PathVariable(value = "id") int id) {
        Subject currentUser = SecurityUtils.getSubject();
        String removePagePermission = getTemplateDir() + ":remove";
        ResultForGridForm result = new ResultForGridForm();
        result.setSubject(MESSAGE.getString("remove"));
        if (currentUser.isPermitted(removePagePermission)) {
            try {
                boolean removeResult = getService().remove(id) && getService().removeChildrenByPid(id);
                if (removeResult) {
                    result.setSuccess();
                    result.setErrorMsg(ResourceBundle.getBundle("message").getString("delete.success"));
                } else {
                    result.setFail();
                    result.setErrorMsg(ResourceBundle.getBundle("message").getString("delete.fail"));
                }
            } catch (Exception ex) {
                result.setFail();
                result.setErrorMsg(ResourceBundle.getBundle("message").getString("delete.fail"));
                ex.printStackTrace();
            }
        } else {
            result.setErrorMsg(MESSAGE.getString("no.right"));
        }
        return result;
    }


}
