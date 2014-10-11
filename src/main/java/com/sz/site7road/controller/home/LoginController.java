package com.sz.site7road.controller.home;

import com.google.code.kaptcha.Producer;
import com.sz.site7road.service.ResourceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.util.ResourceBundle;

/**
 * Created by cutter.li on 2014/9/10.
 */
@Controller
@RequestMapping(value = "/")
public class LoginController {

    @Resource
    private  Producer captchaProducer;
    @Resource
    private ResourceService resourceService;

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("common/login");
        modelAndView.addObject("systemName", ResourceBundle.getBundle("message").getString("system.name"));

        return modelAndView;
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public ModelAndView logout() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("common/login");
        modelAndView.addObject("systemName", ResourceBundle.getBundle("message").getString("system.name"));
        return modelAndView;
    }


    @RequestMapping(value = "/noRight")
    public ModelAndView noRight() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("common/noRight");
        modelAndView.addObject("systemName", ResourceBundle.getBundle("message").getString("system.name"));
        return modelAndView;
    }

    @RequestMapping(value = "/home")
    public ModelAndView loginSubmit(String username,String password,String code) {
        ModelAndView modelAndView = new ModelAndView();

        //判断登录的密码和用户名


        modelAndView.setViewName("common/home");
        modelAndView.addObject("systemName", ResourceBundle.getBundle("message").getString("system.name"));
        modelAndView.addObject("authList", resourceService.getTreeNodeListByPid(0));
        return modelAndView;
    }

    @RequestMapping("/captchaImage")
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        response.setDateHeader("Expires", 0);
        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");
        // return a jpeg
        response.setContentType("image/jpeg");
        // create the text for the image
        String capText = captchaProducer.createText();
        // store the text in the session
        request.getSession().setAttribute("KAPTCHA_SESSION_KEY", capText);
        // create the image with the text
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();
        // write the data out
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
        return null;
    }

}
