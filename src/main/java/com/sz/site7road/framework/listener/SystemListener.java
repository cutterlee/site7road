package com.sz.site7road.framework.listener;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.combotree.IconComboTree;
import org.apache.log4j.Logger;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletContextEvent;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/20 15:10.
 * remark:自定义的监听器
 */
public class SystemListener extends ContextLoaderListener {
    private static final Logger log= Logger.getLogger(SystemListener.class);
    @Override
    public void contextInitialized(ServletContextEvent event) {
        super.contextInitialized(event);
        //初始化图标树
        IconComboTree.init(event.getServletContext());
        log.info("初始化图标树成功...");


    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        super.contextDestroyed(event);
    }


}
