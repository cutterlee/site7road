package com.sz.site7road.controller.config;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sz.site7road.controller.base.BaseGridController;
import com.sz.site7road.controller.base.BaseTreeController;
import com.sz.site7road.entity.config.ConfigEntity;
import com.sz.site7road.entity.config.ConfigType;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.config.AppConstant;
import com.sz.site7road.framework.tree.TreeNode;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.ConfigService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/10 9:44.
 * remark: 配置信息管理
 */
@Controller
@RequestMapping(value = "/config")
public class ConfigGridController extends BaseTreeController<ConfigEntity> {

    @Resource
    private ConfigService configService;

    @Override
    protected BaseService getService() {
        return configService;
    }

    @Override
    protected String getTitle() {
        return ResourceBundle.getBundle(AppConstant.MESSAGE_NAME).getString("config.title");
    }

    @Override
    protected String getTemplateDir() {
        return "config";
    }

    /**
     * 获取comboTree的数据
     *
     * @return
     */
    @Override
    protected List<ComboTreeResponse>  getComboTreeResponse() {
        List<ComboTreeResponse> children=configService.getComboTreeListByPid(0);
        ComboTreeResponse treeNode=new ComboTreeResponse();
        treeNode.setId(0);
        treeNode.setText("根");
        treeNode.setChildren(children);
        List<ComboTreeResponse> comboTreeResponseList= Lists.newLinkedList();
        comboTreeResponseList.add(treeNode);
        return comboTreeResponseList;
    }


    @Override
    public String index(ModelMap map) {
        map.put("configTypes", ConfigType.values());
        return super.index(map);
    }

    @Override
    protected String create(ModelMap map,int pid) throws IllegalAccessException, InstantiationException, Exception {
        map.put("configParent",configService.getTopLevelConfig());
        return super.create(map,pid);
    }

    @Override
    public String modifyEntity(@PathVariable(value = "id") int id, ModelMap map) {
        map.put("configParent",configService.getTopLevelConfig());
        return super.modifyEntity(id, map);
    }
}
