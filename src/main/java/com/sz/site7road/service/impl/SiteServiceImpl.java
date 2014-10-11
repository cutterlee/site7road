package com.sz.site7road.service.impl;

import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.site.SiteDao;
import com.sz.site7road.entity.site.SiteEntity;
import com.sz.site7road.service.SiteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 16:27
 * 备注： 站点服务实现类
 */
@Service
public class SiteServiceImpl extends AbstractBaseServiceImpl<SiteEntity> implements SiteService {

@Resource
private SiteDao dao;

    @Override
    protected BaseDao getBaseDao() {
        return dao;
    }
}
