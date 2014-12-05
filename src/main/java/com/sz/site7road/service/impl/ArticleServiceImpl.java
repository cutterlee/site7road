package com.sz.site7road.service.impl;

import com.sz.site7road.dao.article.ArticleDao;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.entity.article.ArticleEntity;
import com.sz.site7road.service.ArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/3 9:54.
 * remark:文章的服务接口实现类
 */
@Service
public class ArticleServiceImpl extends AbstractBaseServiceImpl<ArticleEntity> implements ArticleService{

    @Resource
    private ArticleDao articleDao;

    @Override
    protected BaseDao getBaseDao() {
        return articleDao;
    }
}
