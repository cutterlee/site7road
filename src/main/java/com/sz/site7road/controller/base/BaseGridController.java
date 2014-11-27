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

import java.util.List;

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
        String indexPermission = getTemplateDir() + ":index";
        ResponseGridEntity responseGridEntity = new ResponseGridEntity();
        if (hasPermission(indexPermission)) {
            responseGridEntity.setTotal(getService().getCountByRequestGridEntity(dataGridParam));
            responseGridEntity.setRows(getService().findEntityListByRequestGridEntity(dataGridParam));
        }
        return responseGridEntity;
    }

    /**
     * 上传文件之后,把得到的路径保存到实体的属性中去
     *
     * @param entity       实体
     * @param fileUrlArray 文件的url路径列表
     */
    @Override
    protected void setFilePathToEntityProperty(T entity, List<String> fileUrlArray) {

    }
}
