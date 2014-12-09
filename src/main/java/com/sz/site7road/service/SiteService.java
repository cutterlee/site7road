package com.sz.site7road.service;

import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.entity.site.SiteEntity;

import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 16:26
 * 备注： 站点信息服务类
 */
public interface SiteService  extends BaseService<SiteEntity>{
    /**
     * 通过角色集合得到用户有权限操作的站点列表
     * @param roleInfoEntityList 角色集合
     * @return 站点列表
     */
    List<SiteEntity> findSiteListByRoleList(List<RoleInfoEntity> roleInfoEntityList);
}
