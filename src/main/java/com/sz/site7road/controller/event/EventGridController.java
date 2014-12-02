package com.sz.site7road.controller.event;

import com.sz.site7road.controller.base.BaseGridController;
import com.sz.site7road.entity.event.EventInfo;
import com.sz.site7road.framework.config.AppConstant;
import com.sz.site7road.framework.grid.ResultForGridForm;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.EventService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.List;
import java.util.ResourceBundle;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/22 17:30.
 * remark:公司大事件控制器
 */
@Controller
@RequestMapping(value = "/event")
public class EventGridController extends BaseGridController<EventInfo> {

    private static final Logger log=Logger.getLogger(EventGridController.class);

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


    /**
     * 上传文件之后,把得到的路径保存到实体的属性中去
     *
     * @param entity       实体
     * @param fileUrlArray 文件的url路径列表
     */
    @Override
    protected void setFilePathToEntityProperty(EventInfo entity, List<String> fileUrlArray) {
        if(!fileUrlArray.isEmpty())
        {
            entity.setEventImgInEventPage(fileUrlArray.get(0));
        }
        super.setFilePathToEntityProperty(entity, fileUrlArray);
    }

}
