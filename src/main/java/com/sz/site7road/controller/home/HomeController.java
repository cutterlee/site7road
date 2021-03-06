package com.sz.site7road.controller.home;

import com.google.code.kaptcha.Producer;
import com.google.common.base.Predicate;
import com.google.common.base.Strings;
import com.google.common.collect.Collections2;
import com.sz.site7road.entity.config.ConfigEntity;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.entity.site.SiteEntity;
import com.sz.site7road.entity.system.PageEntity;
import com.sz.site7road.entity.user.LoginRequestEntity;
import com.sz.site7road.entity.user.UserInfoEntity;
import com.sz.site7road.framework.config.AppConstant;
import com.sz.site7road.framework.grid.ResultForGridForm;
import com.sz.site7road.framework.tree.TreeNode;
import com.sz.site7road.service.*;
import com.sz.site7road.util.HttpUtil;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.awt.image.BufferedImage;
import java.util.*;

/**
 * Created by cutter.li on 2014/9/10.
 * 登陆到后台主页面的控制器
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {

    private Logger logger = Logger.getLogger(HomeController.class);
    public static final ResourceBundle MESSAGE = ResourceBundle.getBundle("message");

    @Resource
    private Producer captchaProducer;
    @Resource
    private ResourceService resourceService;
    @Resource
    private UserService userService;
    @Resource
    private ConfigService configService;
    @Resource
    private SiteService siteService;

    private String PAGE_SHOW_WAY=MESSAGE.getString("page.show.way");
    private  String MENU_TYPE=MESSAGE.getString("system.menu") ;

    Session subjectSession = null;

    @RequestMapping(value = "/login.html", method = RequestMethod.GET)
    public ModelAndView login(HttpServletRequest request) {

        String errorClassName = (String) request.getAttribute("shiroLoginFailure");

        String errorMsg = "";

        if (UnknownAccountException.class.getSimpleName().equals(errorClassName)) {
            errorMsg = "用户名不存在";
        } else if (IncorrectCredentialsException.class.getSimpleName().equals(errorClassName)) {
            errorMsg = "密码错误";
        } else if (!Strings.isNullOrEmpty(errorClassName)) {
            errorMsg = "未知错误";
        }

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("common/login");
        subjectSession = SecurityUtils.getSubject().getSession(true);
        subjectSession.setAttribute("version", System.currentTimeMillis());//用户信息
        Subject currentUser=SecurityUtils.getSubject();
        String username = "";
        if(currentUser.getPrincipals()!=null)
        {
            username=(String) currentUser.getPrincipals().getPrimaryPrincipal();
        }
        subjectSession.setAttribute("username", username);
        subjectSession.setAttribute("errorMsg", errorMsg);
        return modelAndView;
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public ResultForGridForm loginSubmit(@Valid @ModelAttribute("entity") LoginRequestEntity entity, BindingResult bindingResult, HttpServletRequest request) {

        ResultForGridForm result = new ResultForGridForm();
        result.setSuccess();
        if (bindingResult.hasErrors()) {
            FieldError fieldError = null;
            if (!bindingResult.getFieldErrors().isEmpty()) {
                fieldError = bindingResult.getFieldErrors().get(0);
            }
            String fieldName = LoginRequestEntity.getFiledName(fieldError.getField());
            String errorMsg = fieldName + fieldError.getDefaultMessage();
            result.setFail();
            result.setErrorMsg(errorMsg);
        } else {
            Subject subject = SecurityUtils.getSubject();
            //check verifyCode
            String verifyCode = WebUtils.getCleanParam(request, "verifyCode");
            String sessionCode = (String) request.getSession().getAttribute(AppConstant.LOGIN_CAPTCHA_KEY);
            if (!sessionCode.equalsIgnoreCase(verifyCode)) {
                result.setFail();
                result.setErrorMsg(MESSAGE.getString("verifyCode.error"));
            } else {
                UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(entity.getUsername(), entity.getPassword());
                usernamePasswordToken.setRememberMe(entity.getRememberMe());
                try {
                    subject.login(usernamePasswordToken);
                    result.setSuccess();
                } catch (UnknownAccountException ex) {
                    usernamePasswordToken.clear();
                    result.setFail();
                    result.setErrorMsg(MESSAGE.getString("username.not.exist"));
                } catch (IncorrectCredentialsException ex) {
                    usernamePasswordToken.clear();
                    result.setFail();
                    result.setErrorMsg(MESSAGE.getString("password.error"));
                } catch (Exception ex) {
                    usernamePasswordToken.clear();
                    result.setFail();
                    result.setErrorMsg(ex.getMessage());
                }
            }


        }
        return result;
    }


    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout() {
        SecurityUtils.getSubject().logout();
        return "redirect:/login.html";
    }


    @RequestMapping(value = "/noRight")
    public ModelAndView noRight() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("common/noRight");
        return modelAndView;
    }

    @RequestMapping(value = "/{siteId}/home.html")
    public ModelAndView loginSubmit(HttpServletRequest request,@PathVariable(value = "siteId") final int siteId) {


        ModelAndView modelAndView = new ModelAndView();
        Subject subject = SecurityUtils.getSubject();
        subjectSession = SecurityUtils.getSubject().getSession(true);
        logger.info("shiro.session的过期时间:" + subjectSession.getTimeout());
        if (!subject.isAuthenticated()) {
            modelAndView.setViewName("redirect:/login");
        } else {
            //判断登录的密码和用户名
            modelAndView.setViewName("common/home");
            String username = subject.getPrincipals().getPrimaryPrincipal().toString();
            UserInfoEntity userInfoEntity = userService.findUserInfoByUserName(username);
            subjectSession.setAttribute("systemName", ResourceBundle.getBundle("message").getString("system.name"));
            subjectSession.setAttribute("userInfo", userInfoEntity);//用户信息


            List<RoleInfoEntity> roleInfoEntityList= userService.findRoleList(userInfoEntity.getId());
            int roleSize = roleInfoEntityList.size();
            if(roleSize == 0)
            {
                modelAndView.setViewName("redirect:/noRight");
            }else{
                    Collection<RoleInfoEntity> currentSiteRoleInfoList= Collections2.filter(roleInfoEntityList,new Predicate<RoleInfoEntity>() {
                        @Override
                        public boolean apply(RoleInfoEntity roleInfoEntity) {
                            boolean acceptFlag = (siteId == roleInfoEntity.getSiteId());
                            return acceptFlag;
                        }
                    });
                List<TreeNode>   treeNodeListByPid = resourceService.getUserAuthTree(currentSiteRoleInfoList);
                subjectSession.setAttribute("authList", treeNodeListByPid);//权限列表
            }


            //加载系统的新增和编辑页面的交互方式,放到session和application中
            subjectSession.setAttribute("page_show_way",PAGE_SHOW_WAY);

            //更新登陆次数和最后登陆ip
            userInfoEntity.setLastLoginIp(HttpUtil.getIpAddress(request));
            userInfoEntity.setLastLoginTime(new Date(System.currentTimeMillis()));
            userInfoEntity.setLoginTimes(userInfoEntity.getLoginTimes() + 1);
            userService.modify(userInfoEntity);

            subjectSession.setAttribute("menu", MENU_TYPE);

            Properties properties = System.getProperties();
            //获取系统的信息
            subjectSession.setAttribute("osName", properties.getProperty("os.name")+properties.getProperty("os.version"));
            subjectSession.setAttribute("osArch", properties.getProperty("os.arch"));
            subjectSession.setAttribute("javaVersion", properties.getProperty("java.version"));
            subjectSession.setAttribute("javaHome", properties.getProperty("java.home"));
            subjectSession.setAttribute("host",request.getRemoteHost()+request.getRemotePort());
            subjectSession.setAttribute("ip", request.getRemoteAddr());
            subjectSession.setAttribute("sid",siteId);

            PageEntity pageEntity = new PageEntity();
            pageEntity.setPageIndex(1);
            pageEntity.setPageSize(10000);
            List<ConfigEntity> configEntityList= configService.findByPage(pageEntity);
            subjectSession.setAttribute("configList",configEntityList);

            }

//            List<ComboTreeResponse> comboTreeResponseList=Lists.newLinkedList();
//            for(ComboTreeResponse treeResponse:IconComboTree.getIconComboTreeResponseList())
//            {
//                if(treeResponse.getChildren()==null)
//                {
//                    comboTreeResponseList.add(treeResponse);
//                }else{
//                    comboTreeResponseList.addAll(treeResponse.getChildren());
//                }
//            }
//            subjectSession.setAttribute("icons", comboTreeResponseList);
        return modelAndView;
    }

    @RequestMapping(value = "/site.html")
    public ModelAndView site(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("common/site");
        Subject subject = SecurityUtils.getSubject();
        subjectSession = SecurityUtils.getSubject().getSession(true);
        if (!subject.isAuthenticated()) {
            modelAndView.setViewName("redirect:/login.html");
        } else {

            String username = subject.getPrincipals().getPrimaryPrincipal().toString();
            UserInfoEntity userInfoEntity = userService.findUserInfoByUserName(username);
            subjectSession.setAttribute("systemName", ResourceBundle.getBundle("message").getString("system.name"));
            subjectSession.setAttribute("userInfo", userInfoEntity);//用户信息
            List<RoleInfoEntity> roleInfoEntityList = userService.findRoleList(userInfoEntity.getId());

            List<SiteEntity> siteEntityList = siteService.findSiteListByRoleList(roleInfoEntityList);
            subjectSession.setAttribute("siteList", siteEntityList);
        }
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
        request.getSession().setAttribute(AppConstant.LOGIN_CAPTCHA_KEY, capText);
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
