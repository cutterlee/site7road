package com.sz.site7road.dao.site;

import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.entity.site.SiteEntity;

import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * 17:20
 * 备注：site的dao接口
 */
public interface SiteDao extends BaseDao<SiteEntity>{
    /**
     * 通过角色集合得到用户可操作的站点列表
     * @param roleInfoEntityList 角色集合
     * @return 站点列表
     */
    List<SiteEntity> findSiteListByRoleList(List<RoleInfoEntity> roleInfoEntityList);
}
