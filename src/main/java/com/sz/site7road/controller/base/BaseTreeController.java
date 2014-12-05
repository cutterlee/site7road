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
import org.springframework.web.bind.annotation.*;

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
    protected  List<ComboTreeResponse> getComboTreeResponse(){
        ComboTreeResponse treeNode=new ComboTreeResponse();
        treeNode.setId(0);
        treeNode.setText("根");
        List<ComboTreeResponse> children=getService().getComboTreeListByPid(0, getTreeNodeTitleField());
        if(children.isEmpty()){
            children=null;
        }
        treeNode.setChildren(children);
        List<ComboTreeResponse> comboTreeResponseList= Lists.newLinkedList();
        comboTreeResponseList.add(treeNode);
        return comboTreeResponseList;
    }

    /**
     * 获得树的title字段
     * @return
     */
    protected abstract String getTreeNodeTitleField();

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
            }

            entityList.add(dataMap);
        }
        return entityList;
    }

    /**
     * treeGrid的数据
     * @param treeGridParam 查询参数
     * @return treegrid的数据
     */
    @RequestMapping(value = "/tree")
    @ResponseBody
    public ResponseTreeGridEntity tree(RequestTreeGridEntity treeGridParam) {
        ResponseTreeGridEntity responseTreeGridEntity = new ResponseTreeGridEntity();
        String indexPermission=getTemplateDir()+":index";
        if(hasPermission(indexPermission)) {
            treeGridParam.setSort("orderNum");
            List entityListByRequestTreeGridEntity = getService().findEntityListByRequestTreeGridEntity(treeGridParam);
            if (entityListByRequestTreeGridEntity != null && !entityListByRequestTreeGridEntity.isEmpty()) {
                List entityList = appendParentProperty(entityListByRequestTreeGridEntity);
                responseTreeGridEntity.setRows(entityList);
            }
            responseTreeGridEntity.setTotal(getService().getCountByRequestTreeGridEntity(treeGridParam));
        }
        return responseTreeGridEntity;
    }


    /**
     * @return 新增或者编辑页面的的comboTree所需数据
     */
    @RequestMapping(value = "/comboTree")
    @ResponseBody
    protected List<ComboTreeResponse> comboTree() {
        return getComboTreeResponse();
    }


    /**
     * 跳转到增加页面,比Grid多了一个pid的属性
     * @param map 请求的数据
     * @return 增加信息页面
     * @throws Exception
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    protected String create(ModelMap map, int pid,@RequestParam(required = false)int typeId) throws Exception {
        Object emptyEntity = getService().createEmptyEntity();
        if (pid > 0) {
            BeanUtils.setProperty(emptyEntity, "pid", pid);
        }

        String cratePage = super.create(map,pid,typeId);
        map.addAttribute("entity", emptyEntity);
        return cratePage;
    }

    /**
     * @param id 删除信息的id
     * @return   删除数据,连带删除它的孩子节点
     */
    @RequestMapping(value = "/{id}/remove", method = RequestMethod.POST)
    @ResponseBody
    public ResultForGridForm removeEntity(@PathVariable(value = "id") int id) {
        String removePagePermission = getTemplateDir() + ":remove";
        ResultForGridForm result = new ResultForGridForm();
        result.setSubject(MESSAGE.getString("remove"));
        if (hasPermission(removePagePermission)) {
            try {
                boolean removeResult = getService().removeChildrenByPid(id);
                if (removeResult) {
                    result = super.removeEntity(id);
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
