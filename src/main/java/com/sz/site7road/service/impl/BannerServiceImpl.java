package com.sz.site7road.service.impl;

import com.sz.site7road.dao.banner.BannerDao;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.entity.banner.BannerEntity;
import com.sz.site7road.service.BannerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/12/2 17:57.
 * remark:栏目管理服务实现类
 */
@Service
public class BannerServiceImpl extends AbstractBaseServiceImpl<BannerEntity> implements BannerService {

    @Resource
    private BannerDao bannerDao;
    @Override
    protected BaseDao getBaseDao() {
        return bannerDao;
    }


}
