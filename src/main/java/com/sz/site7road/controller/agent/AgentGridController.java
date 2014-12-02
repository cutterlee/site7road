package com.sz.site7road.controller.agent;

import com.sz.site7road.controller.base.BaseGridController;
import com.sz.site7road.entity.agent.AgentInfo;
import com.sz.site7road.framework.config.AppConstant;
import com.sz.site7road.service.AgentService;
import com.sz.site7road.service.BaseService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.ResourceBundle;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/22 17:37.
 * remark:代理商控制器
 */
@Controller
@RequestMapping(value = "/agent")
public class AgentGridController extends BaseGridController<AgentInfo> {

    private static final Logger log=Logger.getLogger(AgentGridController.class);

    @Autowired
    private AgentService agentService;
    @Override
    protected BaseService getService() {
        return agentService;
    }

    @Override
    protected String getTitle() {
        return ResourceBundle.getBundle(AppConstant.MESSAGE_NAME).getString("agent.title");
    }

    @Override
    protected String getTemplateDir() {
        return "agent";
    }

    /**
     * 上传文件之后,把得到的路径保存到实体的属性中去
     *
     * @param entity       实体
     * @param fileUrlArray 文件的url路径列表
     */
    @Override
    protected void setFilePathToEntityProperty(AgentInfo entity, List<String> fileUrlArray) {
        super.setFilePathToEntityProperty(entity, fileUrlArray);
        if(!fileUrlArray.isEmpty())
        {
            entity.setAgentImg(fileUrlArray.get(0));
        }
    }
}
