package com.sz.site7road.controller.base;

import com.baidu.ueditor.ActionEnter;
import com.google.common.base.Charsets;
import com.sz.site7road.entity.upload.UploadEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/10/21 10:51.
 * remark:图片上传的控制器
 */
@Controller
@RequestMapping(value = "/img")
public class ImgUploadController  {

    @RequestMapping(value = "/upload")
//    @ResponseBody
    public void upload(HttpServletRequest request,HttpServletResponse response) throws Exception{
        request.setCharacterEncoding( "utf-8" );
        response.setHeader("Content-Type" , "text/html");

        String rootPath = request.getServletContext().getRealPath("/");

        response.getOutputStream().write((new ActionEnter( request, rootPath ).exec()).getBytes(Charsets.UTF_8 ));
    }



}
