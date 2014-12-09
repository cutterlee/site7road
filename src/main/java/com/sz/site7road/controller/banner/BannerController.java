package com.sz.site7road.controller.banner;

import com.google.common.base.Strings;
import com.google.common.collect.Maps;
import com.sz.site7road.controller.base.BaseTreeController;
import com.sz.site7road.entity.article.ArticleEntity;
import com.sz.site7road.entity.banner.BannerEntity;
import com.sz.site7road.entity.system.PageEntity;
import com.sz.site7road.framework.grid.GridQueryCondition;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.grid.ResultForGridForm;
import com.sz.site7road.service.ArticleService;
import com.sz.site7road.service.BannerService;
import com.sz.site7road.service.BaseService;
import com.sz.site7road.util.FtlUtil;
import freemarker.template.TemplateException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/2 17:46.
 * remark:栏目管理
 */
@Controller
@RequestMapping(value = "/banner")
public class BannerController extends BaseTreeController<BannerEntity> {

    @Resource
    private BannerService bannerService;
    @Resource
    private ArticleService articleService;


    /**
     * 获得service
     *
     * @return
     */
    @Override
    protected BaseService getService() {
        return bannerService;
    }

    /**
     * 获取所要管理的实体标题信息
     *
     * @return
     */
    @Override
    protected String getTitle() {
        return MESSAGE.getString("banner.title");
    }

    /**
     * 获取模板的目录名称
     *
     * @return
     */
    @Override
    protected String getTemplateDir() {
        return "banner";
    }


    /**
     * 列表页
     *
     * @param map ftl用到的数据
     * @return 数据列表页
     */
    @Override
    protected String index(ModelMap map) {
        String setTemplatePermission = getTemplateDir() + ":template";
        map.addAttribute("setTemplatePermission", hasPermission(setTemplatePermission));
        String setColumnPermission = getTemplateDir() + ":column";
        map.addAttribute("setColumnPermission", hasPermission(setColumnPermission));
        String generatePagePermission = getTemplateDir() + ":generate";
        map.addAttribute("generatePagePermission", hasPermission(generatePagePermission));
        return super.index(map);
    }

    /**
     * 获得树的title字段
     *
     * @return
     */
    @Override
    protected String getTreeNodeTitleField() {
        return "bannerName";
    }

    @RequestMapping(value = "/template", method = RequestMethod.GET)
    public String setTemplate(ModelMap map, int bannerId) {
        String setTemplatePermission = getTemplateDir() + ":template";
        if (hasPermission(setTemplatePermission)) {
            BannerEntity bannerEntity = bannerService.findEntityById(bannerId);
            map.addAttribute("entity", bannerEntity);
            map.addAttribute("title", getTitle());
            map.addAttribute("entityName", getTemplateDir());
            String permissionUrl = "/" + getTemplateDir() + "/index";
            setIndexPageIcon(map, permissionUrl);
            return getTemplateDir()+"/template";
        } else {
            return "redirect:/noRight";
        }
    }



    @RequestMapping(value = "/column", method = RequestMethod.GET)
    public String setColumn(ModelMap map, int bannerId) {
        String setTemplatePermission = getTemplateDir() + ":column";
        if (hasPermission(setTemplatePermission)) {
            BannerEntity bannerEntity = bannerService.findEntityById(bannerId);
            map.addAttribute("entity", bannerEntity);
            map.addAttribute("title", getTitle());
            map.addAttribute("entityName", getTemplateDir());
            String permissionUrl = "/" + getTemplateDir() + "/index";
            setIndexPageIcon(map, permissionUrl);
            return getTemplateDir()+"/column";
        } else {
            return "redirect:/noRight";
        }
    }


    /**
     * 删除信息接口
     * @param id 删除信息的id
     * @return 删除的结果
     */
    @RequestMapping(value = "/{id}/generate")
    @ResponseBody
    public ResultForGridForm removeEntity(@PathVariable(value = "id") int id) {
        ResultForGridForm resultForGridForm=new ResultForGridForm();
        FtlUtil.setMessage(MESSAGE);
        FtlUtil ftlUtil=  FtlUtil.getInstance();
        List<BannerEntity> bannerEntityList= bannerService.findAll();
        if(null!=bannerEntityList&&!bannerEntityList.isEmpty())
        {
            for(BannerEntity bannerEntity:bannerEntityList)
            {
                if(bannerEntity.getIsMenu()!=1) {
                    String ftlTemplate = bannerEntity.getPagePath();
                    Map map= Maps.newConcurrentMap();
                    RequestGridEntity queryParam = new RequestGridEntity();
                    queryParam.setRows(10000);
                    GridQueryCondition condition = new GridQueryCondition();
                    condition.setPropertyName("typeId");
                    condition.setPropertyValue(bannerEntity.getId());
                    condition.setWhere("eq");
                    queryParam.setCondition_1(condition);
                    List<ArticleEntity> articleEntityList=articleService.findEntityListByRequestGridEntity(queryParam);
                    map.put("articleList",articleEntityList);
                    map.put("banner",bannerEntity);
                    try {
                        String htmlName = bannerEntity.getHtmlName();
                        if(Strings.isNullOrEmpty(htmlName)){
                            htmlName=String.valueOf(bannerEntity.getId());
                        }
                        htmlName+=".html";
                        ftlUtil.createHTML(ftlTemplate,map, htmlName,"dm");
                        resultForGridForm.setSuccess();
                    } catch (IOException e) {
                        e.printStackTrace();
                    } catch (TemplateException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return resultForGridForm;

    }


}
