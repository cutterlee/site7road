package com.sz.site7road.controller.article;

import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.primitives.Ints;
import com.sz.site7road.controller.base.BaseGridController;
import com.sz.site7road.entity.article.ArticleEntity;
import com.sz.site7road.entity.banner.BannerEntity;
import com.sz.site7road.entity.banner.BannerFieldInfo;
import com.sz.site7road.service.ArticleService;
import com.sz.site7road.service.BannerService;
import com.sz.site7road.service.BaseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/2 19:21.
 * remark: 文章管理控制器
 */
@Controller
@RequestMapping(value = "/article")
public class ArticleController  extends BaseGridController<ArticleEntity>{

    @Resource
    private ArticleService articleService;

    @Resource
    private BannerService bannerService;

    private List<BannerFieldInfo> bannerFieldInfoList;

    @PostConstruct
    public void init()
    {
        bannerFieldInfoList= Lists.newLinkedList();
        BannerFieldInfo bannerFieldInfo=new BannerFieldInfo();
        bannerFieldInfo.setName(MESSAGE.getString("banner.keywords"));
        bannerFieldInfo.setTag("keywords");
        bannerFieldInfoList.add(bannerFieldInfo);

        BannerFieldInfo bannerFieldInfo2=new BannerFieldInfo();
        bannerFieldInfo2.setName(MESSAGE.getString("banner.description"));
        bannerFieldInfo2.setTag("description");
        bannerFieldInfoList.add(bannerFieldInfo2);

        BannerFieldInfo bannerFieldInfo3=new BannerFieldInfo();
        bannerFieldInfo3.setName("关键字");
        bannerFieldInfo3.setTag("keywords");
        bannerFieldInfoList.add(bannerFieldInfo3);

        BannerFieldInfo bannerFieldInfo4=new BannerFieldInfo();
        bannerFieldInfo4.setName("关键字");
        bannerFieldInfo4.setTag("keywords");
        bannerFieldInfoList.add(bannerFieldInfo4);


        BannerFieldInfo bannerFieldInfo5=new BannerFieldInfo();
        bannerFieldInfo5.setName("关键字");
        bannerFieldInfo5.setTag("keywords");
        bannerFieldInfoList.add(bannerFieldInfo5);
    }

    /**
     * 获得service
     *
     * @return
     */
    @Override
    protected BaseService getService() {
        return articleService;
    }

    /**
     * 获取所要管理的实体标题信息
     *
     * @return
     */
    @Override
    protected String getTitle() {
        return MESSAGE.getString("article.title");
    }

    /**
     * 获取模板的目录名称
     *
     * @return
     */
    @Override
    protected String getTemplateDir() {
        return "article";
    }

    /**
     * 跳转到增加页面
     *
     * @param map    请求的数据
     * @param pid
     * @param typeId @return 增加信息页面
     * @throws Exception
     */
    @Override
    protected String create(ModelMap map, int pid, @RequestParam(required = false) int typeId) throws Exception {
        //set the property , if it is need to show the field
       BannerEntity bannerEntity= bannerService.findEntityById(typeId);
       String showFields= bannerEntity.getShowFields();
       if(!Strings.isNullOrEmpty(showFields))
       {
          String[] fieldShow= showFields.split("|");
           int position=0;
           for(String str:fieldShow)
           {
                int flag= Ints.tryParse(str);
               if(1==flag)
               {
                   bannerFieldInfoList.get(position).setFlag(true);
               }
               position++;
           }
       }
        map.addAttribute("bannerFieldInfoList",bannerFieldInfoList);
        return super.create(map, pid, typeId);
    }
}
