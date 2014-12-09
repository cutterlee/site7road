package com.sz.site7road.service.impl;

import com.google.common.base.Preconditions;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.site.SiteDao;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.entity.site.SiteEntity;
import com.sz.site7road.service.SiteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    /**
     * 通过角色集合得到用户有权限操作的站点列表
     *
     * @param roleInfoEntityList 角色集合
     * @return 站点列表
     */
    @Override
    public List<SiteEntity> findSiteListByRoleList(List<RoleInfoEntity> roleInfoEntityList) {
        Preconditions.checkArgument(null!=roleInfoEntityList);
        Preconditions.checkArgument(!roleInfoEntityList.isEmpty());
        return dao.findSiteListByRoleList(roleInfoEntityList);
    }
}
