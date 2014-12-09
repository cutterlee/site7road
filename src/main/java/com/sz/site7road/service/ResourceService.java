package com.sz.site7road.service;

import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.entity.role.RoleInfoEntity;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.tree.TreeNode;

import java.util.Collection;
import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/15 17:33.
 * remark:权限控制的服务类
 */
public interface ResourceService extends BaseService<ResourceEntity>{

    /**
     * 从id加载得到树或者节点
     * @param id 编号
     * @return 节点或者树
     */
    TreeNode getTreeNodeById(int id);

    /**
     * 从pid得到树节点列表
     * @param pid 父id
     * @return 节点列表
     */
    List<TreeNode> getTreeNodeListByPid(int pid);

    /**
     * 从pid得到树节点列表
     * @param pid 父id
     * @return comboTree的树
     */
    List<ComboTreeResponse> getComboTreeChildrenByPid(int pid);

    /**
     * 删除某用户的所有权限
     * @param userId 用户id
     * @return 删除的结果
     */
    boolean removeByRoleId(int userId);

    /**
     * 给某用户添加新的权限
     * @param resourceIdArray 权限的编号数组
     * @param userId  用户id
     * @return 添加权限的结果
     */
    boolean batchInsertResource(int[] resourceIdArray, int userId);

    /**
     * 获得授权的树,有权限的设置为选中状态
     * @param roleId 角色id
     * @return  授权的树
     */
    List<TreeNode> getAuthCheckedTree(int roleId);

    /**
     * 获取菜单,显示导航
     * @param roleId 角色id
     * @return 角色对应的权限树
     */
    List<TreeNode> getUserAuthTree(int roleId);

    /**
     * 通过权限字符串查找到对应的权限信息
     * @param permission 权限字符串
     * @return 权限信息
     */
    ResourceEntity findResourceByPermission(String permission);

    /**
     * 多角色获得用户的操作权限
     * @param roleInfoEntityList 角色集合
     * @return 多角色的用户对应的权限集合
     */
    List<TreeNode> getUserAuthTree( Collection<RoleInfoEntity> roleInfoEntityList);
}
