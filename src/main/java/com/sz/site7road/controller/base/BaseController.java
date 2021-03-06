package com.sz.site7road.controller.base;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.framework.grid.ResultForGridForm;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.service.ResourceService;
import com.sz.site7road.util.BeanHelpUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.RandomUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.env.Environment;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import java.util.UUID;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/18 14:59.
 * remark:
 */
public abstract class BaseController<T> {
    public static final ResourceBundle MESSAGE = ResourceBundle.getBundle("message");

    @Resource
    private ResourceService resourceService;

    protected String IMG_SAVE_PATH=MESSAGE.getString("image.save.path");

    /**
     * 获得service
     * @return
     */
    protected abstract BaseService getService();

    /**
     * 获取所要管理的实体标题信息
     * @return
     */
    protected abstract String getTitle();

    /**
     * 获取模板的目录名称
     * @return
     */
    protected abstract String getTemplateDir();

    /**
     * 上传文件之后,把得到的路径保存到实体的属性中去
     * @param entity 实体
     * @param fileUrlArray 文件的url路径列表
     */
    protected  void setFilePathToEntityProperty(T entity, List<String> fileUrlArray){}

    /**
     * 列表页
     *
     * @param map ftl用到的数据
     * @return 数据列表页
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    protected String index(ModelMap map) {
        String indexPermission = getTemplateDir() + ":index";
        if (hasPermission(indexPermission)) {
            map.addAttribute("title", getTitle());
            map.addAttribute("entityName", getTemplateDir());
            //set add edit remove button permission
            String addPagePermission = getTemplateDir() + ":create";
            map.addAttribute("addPagePermission", hasPermission(addPagePermission));
            String editPagePermission = getTemplateDir() + ":modify";
            map.addAttribute("editPagePermission", hasPermission(editPagePermission));
            String removePagePermission = getTemplateDir() + ":remove";
            map.addAttribute("removePagePermission", hasPermission(removePagePermission));
            return getTemplateDir() + "/index";
        } else {
            return "redirect:/noRight";
        }
    }


    /**
     * 修改信息页面
     * @param id 信息的id
     * @param map 请求对象
     * @return  修改信息页面
     */
    @RequestMapping(value = "/{id}/modify", method = RequestMethod.GET)
    public String modifyEntity(@PathVariable(value = "id") int id, ModelMap map) {
        String editPagePermission = getTemplateDir() + ":modify";
        if (hasPermission(editPagePermission)) {
            map.addAttribute("entity", getService().findEntityById(id));
            map.addAttribute("title", MESSAGE.getString("modify")+getTitle());
            map.addAttribute("op", System.currentTimeMillis());
            map.addAttribute("entityName", getTemplateDir());
            String permissionUrl = "/" + getTemplateDir() + "/index";
            setIndexPageIcon(map, permissionUrl);
            return getTemplateDir() + "/form";
        } else {
            return "redirect:/noRight";
        }
    }

    /**
     * 设置列表页的图标
     * @param map 当前请求对象的数据
     * @param permission  权限字符串
     */
    protected void setIndexPageIcon(ModelMap map, String permission) {
        //set index page icon
        ResourceEntity resourceEntity= resourceService.findResourceByPermission(permission);
        String indexPageIcon="icon-wheel";
        String indexTitle=MESSAGE.getString("manage");
        if(null!=resourceEntity)
        {
            indexPageIcon=resourceEntity.getResourceIcon();
            indexTitle=resourceEntity.getResourceName();
        }
        map.addAttribute("indexIconCls",indexPageIcon);
        map.addAttribute("indexTitle",indexTitle);
    }

    /**
     * 保存数据接口
     * @param entity 保存的信息实体
     * @param bindingResult 绑定的结果
     * @return 保存数据的结果
     */
    @RequestMapping(value = "/save")
    @ResponseBody
    protected ResultForGridForm modifyEntitySave(@Valid @ModelAttribute("entity") T entity, BindingResult bindingResult,@RequestParam(required = false) MultipartFile[] files,HttpServletRequest request) {

        String savePermission = getTemplateDir() + ":create";
        try {
          int id= Integer.parseInt(BeanUtils.getProperty(entity, "id"));
            if(id>0)
            {
                savePermission = getTemplateDir() + ":modify";
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        ResultForGridForm result = new ResultForGridForm();
        result.setSubject(MESSAGE.getString("save"));
        if (hasPermission(savePermission)) {
            try {
                if (!bindingResult.hasFieldErrors()) {
                    //save file
                    if(files!=null&&files.length>0)
                    {
                       List<String> fileUrlArray= uploadFile(request,files);
                        if(!fileUrlArray.isEmpty())
                        {
                            setFilePathToEntityProperty(entity,fileUrlArray);
                        }
                    }
                    boolean saveResult = getService().modify(entity);
                    if (saveResult) {
                        result.setSuccess();
                        result.setErrorMsg(ResourceBundle.getBundle("message").getString("save.success"));
                    } else {
                        result.setFail();
                        result.setErrorMsg(ResourceBundle.getBundle("message").getString("save.fail"));
                    }
                } else {
                    result.setFail();
                    result.setErrorMsg(bindingResult.getFieldError().getField() + bindingResult.getFieldError().getDefaultMessage());
                }
            } catch (Exception ex) {
                result.setFail();
                result.setErrorMsg(ResourceBundle.getBundle("message").getString("save.fail"));
                ex.printStackTrace();
            }
        }else{
            result.setErrorMsg(MESSAGE.getString("no.right"));
        }
        return result;
    }


    /**
     * 保存上传的文件
     * @param request 请求对象
     * @param files  文件对象
     */
    protected List<String> uploadFile(HttpServletRequest request, MultipartFile[] files) {
        List<String> fileUrlArray = Lists.newLinkedList();
        //这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
            try {
                for (MultipartFile file : files) {
                    String originalFilename = file.getOriginalFilename();
                    if(!Strings.isNullOrEmpty(originalFilename))
                    {
                        String fileName = new File(UUID.randomUUID().toString())+ originalFilename.substring(originalFilename.lastIndexOf("."),originalFilename.length());
                        if(!Strings.isNullOrEmpty(getTemplateDir()))
                        {
                            fileName="/"+getTemplateDir()+"/"+fileName;
                        }
                        File destination= new File(IMG_SAVE_PATH,fileName);
                        FileUtils.copyInputStreamToFile(file.getInputStream(), destination);
                        fileUrlArray.add(fileName);
                    }

                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        return fileUrlArray;
    }


    /**
     * 跳转到增加页面
     * @param map 请求的数据
     * @return 增加信息页面
     * @throws Exception
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    protected String create(ModelMap map, int pid,@RequestParam(required = false)int typeId) throws Exception {
        String addPagePermission = getTemplateDir() + ":create";
        if (hasPermission(addPagePermission)) {
            Object emptyEntity = getService().createEmptyEntity();
            if(BeanHelpUtil.containsProperty(emptyEntity,"typeId"))
            {
                BeanUtils.setProperty(emptyEntity,"typeId",typeId);
            }
            map.addAttribute("entity", emptyEntity);
            map.addAttribute("title", MESSAGE.getString("create")+getTitle());
            map.addAttribute("op", System.currentTimeMillis());
            map.addAttribute("entityName", getTemplateDir());
            String permissionUrl = "/" + getTemplateDir() + "/index";
            setIndexPageIcon(map, permissionUrl);
            return getTemplateDir() + "/form";
        } else {
            return "redirect:/noRight";
        }
    }

    /**
     * 删除信息接口
     * @param id 删除信息的id
     * @return 删除的结果
     */
    @RequestMapping(value = "/{id}/remove", method = RequestMethod.POST)
    @ResponseBody
    public ResultForGridForm removeEntity(@PathVariable(value = "id") int id) {
        ResultForGridForm result = new ResultForGridForm();
        result.setSubject(MESSAGE.getString("remove"));
        String removePagePermission = getTemplateDir() + ":remove";
        if (hasPermission(removePagePermission)) {
            try {
                boolean removeResult = getService().remove(id);
                if (removeResult) {
                    result.setSuccess();
                    result.setErrorMsg(MESSAGE.getString("delete.success"));
                } else {
                    result.setFail();
                    result.setErrorMsg(MESSAGE.getString("delete.fail"));
                }
            } catch (Exception ex) {
                result.setFail();
                result.setErrorMsg(MESSAGE.getString("delete.fail"));
                ex.printStackTrace();
            }
        }else{
            result.setErrorMsg(MESSAGE.getString("no.right"));
        }
        return result;
    }

    /**
     * 检查是否含有权限
     * @param permission 权限字符串
     * @return 是否含有权限
     */
    protected boolean hasPermission(String permission)
    {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(permission));
        Subject currentUser = SecurityUtils.getSubject();
        if(currentUser!=null)
        {
            return currentUser.isPermitted(permission);
        }
        return false;
    }


    /**
     * 绑定日期格式
     * @param binder 绑定对象
     * @throws Exception
     */
    @InitBinder
    protected void initBinder(ServletRequestDataBinder binder) throws Exception {
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        CustomDateEditor dateEditor = new CustomDateEditor(fmt, true);
        binder.registerCustomEditor(Date.class, dateEditor);
    }
}
