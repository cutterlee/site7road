package com.sz.site7road.controller.base;

import com.baidu.ueditor.ActionEnter;
import com.google.common.base.Charsets;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Map;
import java.util.UUID;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/10/21 10:51.
 * remark:读取ueditor的上传配置信息,完成文件上传等功能
 */
@Controller
@RequestMapping(value = "/img")
public class ImgUploadController {

    @RequestMapping(value = "/upload")
    public void upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type", "text/html");
        String rootPath = request.getServletContext().getRealPath("/");
        String exec = new ActionEnter(request, rootPath).exec();
        response.getOutputStream().write(exec.getBytes(Charsets.UTF_8));
    }


}
