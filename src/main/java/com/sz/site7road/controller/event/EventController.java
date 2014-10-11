package com.sz.site7road.controller.event;

import com.sz.site7road.controller.base.BaseController;
import com.sz.site7road.entity.event.EventInfo;
import com.sz.site7road.framework.config.AppConstant;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.EventService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ResourceBundle;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/22 17:30.
 * remark:公司大事件控制器
 */
@Controller
@RequestMapping(value = "/event")
public class EventController extends BaseController<EventInfo> {

    private static final Logger log=Logger.getLogger(EventController.class);

    @Autowired
    private EventService eventService;

    @Override
    protected BaseService getService() {
        return eventService;
    }

    @Override
    protected String getTitle() {
        return ResourceBundle.getBundle(AppConstant.MESSAGE_NAME).getString("event.title");
    }

    @Override
    protected String getTemplateDir() {
        return "event";
    }
}
