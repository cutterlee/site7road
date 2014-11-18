package com.sz.site7road.service.impl;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Strings;
import com.google.common.collect.Collections2;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.resource.ResourceDao;
import com.sz.site7road.dao.roleresource.RoleResourceDao;
import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.entity.resource.ResourceType;
import com.sz.site7road.entity.role.RoleResourceEntity;
import com.sz.site7road.framework.combotree.ComboTreeResponse;
import com.sz.site7road.framework.grid.GridQueryCondition;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.tree.TreeNode;
import com.sz.site7road.service.ResourceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/15 17:35.
 * remark:权限控制服务实现类
 */
@Service
public class ResourceServiceImpl extends AbstractBaseServiceImpl<ResourceEntity> implements ResourceService {

    @Resource
    private ResourceDao resourceDao;

    @Resource
    private RoleResourceDao roleResourceDao;

    @Override
    protected BaseDao getBaseDao() {
        return resourceDao;
    }

    /**
     * 从id加载得到树或者节点
     *
     * @param id 编号
     * @return 节点或者树
     */
    @Override
    public TreeNode getTreeNodeById(int id) {

        //查出所有的资源
        RequestGridEntity requestGridEntity = new RequestGridEntity();
        requestGridEntity.setRows(10000);
        requestGridEntity.setPage(1);
        List<ResourceEntity> resourceEntityList = getBaseDao().findEntityListByRequestGridEntity(requestGridEntity);

        if (resourceEntityList == null || resourceEntityList.isEmpty()) {
            return null;
        }

        TreeNode root = new TreeNode();
        //构造父节点
        ResourceEntity resource = findById(resourceEntityList, id);
        if (null != resource) {
            root.setId(resource.getId());
            root.setText(resource.getResourceName());
        }
        //构造叶子节点
        initTreeNode(id, root, resourceEntityList);
        return root;
    }

    /**
     * 递归的初始化树
     *
     * @param id
     * @param treeNode
     * @param resourceEntityList
     */
    private void initTreeNode(int id, TreeNode treeNode, List<ResourceEntity> resourceEntityList) {

        //构造叶子节点
        List<ResourceEntity> children = findChildrenByPid(id, resourceEntityList);
        if (children != null && !children.isEmpty()) {
            for (ResourceEntity resourceEntity : children) {
                TreeNode leaf = new TreeNode();
                leaf.setId(resourceEntity.getId());
                leaf.setIconCls(resourceEntity.getResourceIcon());
                leaf.setText(resourceEntity.getResourceName());
                leaf.setPath(resourceEntity.getResourceUrl());
                initTreeNode(leaf.getId(), leaf, resourceEntityList);
                if (treeNode.getChildren() == null) {
                    List<TreeNode> childreNode = Lists.newLinkedList();
                    treeNode.setChildren(childreNode);
                }
                treeNode.getChildren().add(leaf);
            }
        }
    }


    private List<ResourceEntity> findChildrenByPid(int pid, List<ResourceEntity> resourceList) {
        List<ResourceEntity> resourceEntityList = null;
        for (ResourceEntity resourceEntity : resourceList) {
            if (resourceEntity.getPid() == pid) {
                if (resourceEntityList == null) {
                    resourceEntityList = Lists.newLinkedList();
                }
                resourceEntityList.add(resourceEntity);
            }
        }
        if (resourceEntityList != null && resourceEntityList.size() > 1) {
            Collections.sort(resourceEntityList, new Comparator<ResourceEntity>() {
                @Override
                public int compare(ResourceEntity o1, ResourceEntity o2) {
                    return o1.getOrderNum() - o2.getOrderNum();
                }
            });
        }
        return resourceEntityList;
    }

    /**
     * 从集合里查找某id的资源对象
     *
     * @param resourceEntityList
     * @param id
     * @return
     */
    private ResourceEntity findById(List<ResourceEntity> resourceEntityList, int id) {
        for (ResourceEntity resourceEntity : resourceEntityList) {
            if (resourceEntity.getId() == id) {
                return resourceEntity;
            }
        }
        return null;
    }

    /**
     * 从pid得到树节点列表
     *
     * @param pid 父id
     * @return 节点列表
     */
    @Override
    public List<TreeNode> getTreeNodeListByPid(int pid) {

        //查出所有的资源
        RequestGridEntity requestGridEntity = new RequestGridEntity();
        requestGridEntity.setRows(10000);
        requestGridEntity.setPage(1);
        List<ResourceEntity> resourceEntityList = getBaseDao().findEntityListByRequestGridEntity(requestGridEntity);

        if (resourceEntityList == null || resourceEntityList.isEmpty()) {
            return null;
        }

        List<TreeNode> treeNodeList = Lists.newLinkedList();
        //构造叶子节点
        List<ResourceEntity> children = findChildrenByPid(pid, resourceEntityList);
        if (children != null && !children.isEmpty()) {
            for (ResourceEntity resourceEntity : children) {
                TreeNode leaf = new TreeNode();
                leaf.setId(resourceEntity.getId());
                leaf.setIconCls(resourceEntity.getResourceIcon());
                leaf.setText(resourceEntity.getResourceName());
                initTreeNode(leaf.getId(), leaf, resourceEntityList);
                treeNodeList.add(leaf);
            }
        }

        return treeNodeList;
    }

    /**
     * 从pid得到树节点列表
     *
     * @param pid 父id
     * @return comboTree的树
     */
    @Override
    public List<ComboTreeResponse> getComboTreeChildrenByPid(int pid) {
        List<ComboTreeResponse> comboTreeResponseList = Lists.newLinkedList();
        List<TreeNode> treeNodeList = getTreeNodeListByPid(0);
        for (TreeNode treeNode : treeNodeList) {
            ComboTreeResponse comboTreeResponse = new ComboTreeResponse();
            comboTreeResponse.setId(treeNode.getId());
            comboTreeResponse.setText(treeNode.getText());
            comboTreeResponse.setIconCls(treeNode.getIconCls());
            Collection<TreeNode> children = treeNode.getChildren();
            if (children != null && !children.isEmpty()) {
                comboTreeResponse.setChildren(getComboTreeChildrenFromTreeNode(children));
            }
            comboTreeResponseList.add(comboTreeResponse);
        }
        return comboTreeResponseList;
    }

    /**
     * 删除某用户的所有权限
     *
     * @param roleId 用户id
     * @return 删除的结果
     */
    @Override
    public boolean removeByRoleId(int roleId) {
        Preconditions.checkArgument(roleId > 0, "userId不合法");
        return roleResourceDao.removeByRoleId(roleId);
    }

    /**
     * 给某用户添加新的权限
     *
     * @param resourceIdArray 权限的编号数组
     * @param roleId          用户id
     * @return 添加权限的结果
     */
    @Override
    public boolean batchInsertResource(int[] resourceIdArray, int roleId) {
        Preconditions.checkArgument(roleId > 0, "userId不合法");
        Preconditions.checkArgument(resourceIdArray != null && resourceIdArray.length > 0, "resourceIdArray不能为空");
        return roleResourceDao.batchInsertResource(resourceIdArray, roleId);
    }

    /**
     * 获得授权的树,有权限的设置为选中状态
     *
     * @param roleId 角色id
     * @return 授权的树
     */
    @Override
    public List<TreeNode> getAuthCheckedTree(int roleId) {
        List<TreeNode> treeNodeList = getTreeNodeListByPid(0);
        List<RoleResourceEntity> resourceEntityList = roleResourceDao.findResourceByRoleId(roleId);
        Map<Integer, Integer> resourceIdMap = Maps.newHashMap();
        for (RoleResourceEntity roleResourceEntity : resourceEntityList) {
            resourceIdMap.put(roleResourceEntity.getResourceId(), roleResourceEntity.getResourceId());
        }
        for (TreeNode treeNode : treeNodeList) {
            if (resourceIdMap.containsKey(treeNode.getId())) {
                treeNode.setChecked(true);
            }
            getAuthTreeChecked(treeNode.getChildren(), resourceIdMap);
        }
        return treeNodeList;
    }

    /**
     * 获取菜单,显示导航
     *
     * @param roleId 角色id
     * @return 角色对应的权限树
     */
    @Override
    public List<TreeNode> getUserAuthTree(int roleId) {
        Preconditions.checkArgument(roleId > 0);
        List<TreeNode> treeNodeList = Lists.newLinkedList();
        //find the role auth list
        List<RoleResourceEntity> roleResourceEntityList = roleResourceDao.findResourceByRoleId(roleId);
        //build the auth map
        final Map<Integer, Integer> resourceIdMap = Maps.newHashMap();
        if (null != roleResourceEntityList && !roleResourceEntityList.isEmpty()) {
            for (RoleResourceEntity roleResourceEntity : roleResourceEntityList) {
                resourceIdMap.put(roleResourceEntity.getResourceId(), roleResourceEntity.getResourceId());
            }
        }
        //find the complete resource list
        RequestGridEntity dataGridParam = new RequestGridEntity();
        dataGridParam.setPage(1);
        dataGridParam.setRows(10000);
        dataGridParam.setSort("orderNum");
        dataGridParam.setOrder("asc");
        List<ResourceEntity> resourceEntityList = resourceDao.findEntityListByRequestGridEntity(dataGridParam);

        if (resourceEntityList != null && !resourceEntityList.isEmpty()) {
            for (final ResourceEntity resourceEntity : resourceEntityList) {
                if (resourceIdMap.containsKey(resourceEntity.getId())&&resourceEntity.getResourceType()== ResourceType.menu.getTypeId()) {
                    TreeNode treeNode = new TreeNode();
                    treeNode.setId(resourceEntity.getId());
                    treeNode.setText(resourceEntity.getResourceName());
                    treeNode.setIconCls(resourceEntity.getResourceIcon());
                    treeNode.setPath(resourceEntity.getResourceUrl());

                    Collection<ResourceEntity> children = Collections2.filter(resourceEntityList, new Predicate<ResourceEntity>() {
                        @Override
                        public boolean apply(ResourceEntity resource) {
                            return resourceEntity.getId() == resource.getPid() && resourceIdMap.containsKey(resource.getId());
                        }
                    });
                    // add the first level treenode
                    if (children != null && !children.isEmpty()&&resourceEntity.getPid()==0) {
                        //递归,构造子节点
                        List<TreeNode> childrenNode = recursionResource(children, resourceIdMap, resourceEntityList);
                        treeNode.setChildren(childrenNode);
                        treeNodeList.add(treeNode);

                    }

                }


            }


        }
        return treeNodeList;
    }

    /**
     * 通过权限字符串查找到对应的权限信息
     *
     * @param permission 权限字符串
     * @return 权限信息
     */
    @Override
    public ResourceEntity findResourceByPermission(String permission) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(permission));
        RequestGridEntity dataGridParam = new RequestGridEntity();
        dataGridParam.setPage(1);
        dataGridParam.setRows(1);
        dataGridParam.setSort("orderNum");
        dataGridParam.setOrder("asc");
        GridQueryCondition condition=new GridQueryCondition();
        condition.setPropertyName("resourceUrl");
        condition.setWhere("eq");
        condition.setPropertyValue(permission);
        dataGridParam.setCondition_1(condition);
        List<ResourceEntity> resourceEntityList = resourceDao.findEntityListByRequestGridEntity(dataGridParam);
        if(null!=resourceEntityList&&!resourceEntityList.isEmpty())
        {
            return  resourceEntityList.get(0);
        }
        return null;
    }

    /**
     * 递归的增加权限树
     *
     * @param children      树集合
     * @param resourceIdMap 用户的权限集合
     */
    private List<TreeNode> recursionResource(Collection<ResourceEntity> children, final Map<Integer, Integer> resourceIdMap, List<ResourceEntity> resourceEntityList) {
        List<TreeNode> childrenNode = Lists.newLinkedList();
        if (children != null && !children.isEmpty()) {
            for (final ResourceEntity resourceEntity : children) {
                if (resourceIdMap.containsKey(resourceEntity.getId())&&resourceEntity.getResourceType()== ResourceType.menu.getTypeId()) {
                    TreeNode treeNode = new TreeNode();
                    treeNode.setId(resourceEntity.getId());
                    treeNode.setText(resourceEntity.getResourceName());
                    treeNode.setIconCls(resourceEntity.getResourceIcon());
                    treeNode.setPath(resourceEntity.getResourceUrl());

                    Collection<ResourceEntity> mychilidren = Collections2.filter(resourceEntityList, new Predicate<ResourceEntity>() {
                        @Override
                        public boolean apply(ResourceEntity resource) {
                            return resourceEntity.getId() == resource.getPid() && resourceIdMap.containsKey(resource.getId())&&resource.getResourceType()== ResourceType.menu.getTypeId();
                        }
                    });

                    if (mychilidren != null && !mychilidren.isEmpty()) {
                        treeNode.setChildren(recursionResource(mychilidren, resourceIdMap, resourceEntityList));
                    }
                    childrenNode.add(treeNode);
                }

            }

        }
        return childrenNode;
    }


    public void getAuthTreeChecked(Collection<TreeNode> treeNodeList, Map<Integer, Integer> resourceIdMap) {

        if (treeNodeList != null && !treeNodeList.isEmpty()) {
            for (TreeNode treeNode : treeNodeList) {
                if (resourceIdMap.containsKey(treeNode.getId())) {
                    treeNode.setChecked(true);
                }
                getAuthTreeChecked(treeNode.getChildren(), resourceIdMap);
            }
        }
    }

    public List<ComboTreeResponse> getComboTreeChildrenFromTreeNode(Collection<TreeNode> treeNodeList) {
        List<ComboTreeResponse> comboTreeResponseList = Lists.newLinkedList();
        for (TreeNode treeNode : treeNodeList) {
            ComboTreeResponse comboTreeResponse = new ComboTreeResponse();
            comboTreeResponse.setId(treeNode.getId());
            comboTreeResponse.setText(treeNode.getText());
            comboTreeResponse.setIconCls(treeNode.getIconCls());
            Collection<TreeNode> children = treeNode.getChildren();
            if (children != null && !children.isEmpty()) {
                comboTreeResponse.setChildren(getComboTreeChildrenFromTreeNode(children));
            }
            comboTreeResponseList.add(comboTreeResponse);
        }
        return comboTreeResponseList;
    }

}
