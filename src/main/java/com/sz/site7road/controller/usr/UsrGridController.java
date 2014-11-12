package com.sz.site7road.controller.usr;

import com.sz.site7road.controller.base.BaseGridController;
import com.sz.site7road.entity.user.UserInfoEntity;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.UsrService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ResourceBundle;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/12 14:55.
 * remark: 用户管理的控制器
 */
@Controller
@RequestMapping(value = "/usr")
public class UsrGridController extends BaseGridController<UserInfoEntity> {

    @Resource
    private UsrService usrService;

    @Override
    protected BaseService getService() {
        return usrService;
    }

    @Override
    protected String getTitle() {
        return ResourceBundle.getBundle("message").getString("usr.title");
    }

    @Override
    protected String getTemplateDir() {
        return "usr";
    }


}
