package com.sz.site7road.controller.config;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.sz.site7road.controller.base.BaseTreeController;
import com.sz.site7road.entity.config.ConfigEntity;
import com.sz.site7road.entity.config.ConfigType;
import com.sz.site7road.framework.config.AppConstant;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.ConfigService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
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




    @Override
    public String index(ModelMap map) {
        map.put("configTypes", ConfigType.values());
        return super.index(map);
    }

    /**
     * 获得树的title字段
     *
     * @return
     */
    @Override
    protected String getTreeNodeTitleField() {
        return "configTitle";
    }

    @Override
    protected String create(ModelMap map,int pid,@RequestParam(required = false)int typeId) throws IllegalAccessException, InstantiationException, Exception {
        map.put("configParent",configService.getTopLevelConfig());
        return super.create(map,pid,typeId);
    }

    @Override
    public String modifyEntity(@PathVariable(value = "id") int id, ModelMap map) {
        map.put("configParent",configService.getTopLevelConfig());
        return super.modifyEntity(id, map);
    }


    @RequestMapping(value = "/select")
    @ResponseBody
    public List<ConfigEntity> select( String  configKey) {

        List<ConfigEntity> configEntityList=Lists.newLinkedList();

        if(Strings.isNullOrEmpty(configKey))
        {
            return configEntityList;
        }

        configEntityList=configService.findChildrenByConfigKey(configKey);
        return configEntityList;

    }

}
