package com.sz.site7road.service.impl;

import com.google.common.collect.Lists;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.resource.ResourceDao;
import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.framework.grid.RequestGridEntity;
import com.sz.site7road.framework.tree.TreeNode;
import com.sz.site7road.service.ResourceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/15 17:35.
 * remark:权限控制服务实现类
 */
@Service
public class ResourceServiceImpl extends AbstractBaseServiceImpl<ResourceEntity> implements ResourceService {

    @Resource
    private ResourceDao resourceDao;

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
        RequestGridEntity requestGridEntity=new RequestGridEntity();
        requestGridEntity.setRows(10000);
        requestGridEntity.setPage(1);
        List<ResourceEntity> resourceEntityList = getBaseDao().findEntityListByRequestGridEntity(requestGridEntity);

        if (resourceEntityList == null || resourceEntityList.isEmpty()) {
            return null;
        }

        TreeNode root = new TreeNode();
        //构造父节点
        ResourceEntity resource= findById(resourceEntityList,id);
        if(null!=resource) {
            root.setId(resource.getId());
            root.setText(resource.getResourceName());
        }
        //构造叶子节点
       initTreeNode(id,root,resourceEntityList);
        return root;
    }

    /**
     * 递归的初始化树
     * @param id
     * @param treeNode
     * @param resourceEntityList
     */
    private  void initTreeNode(int id ,TreeNode treeNode, List<ResourceEntity> resourceEntityList)
    {

        //构造叶子节点
        List<ResourceEntity> children=findChildrenByPid(id,resourceEntityList);
        if(children!=null&&!children.isEmpty())
        {
            for(ResourceEntity resourceEntity:children)
            {
                TreeNode leaf=new TreeNode();
                leaf.setId(resourceEntity.getId());
                leaf.setIconCls(resourceEntity.getResourceIcon());
                leaf.setText(resourceEntity.getResourceName());
                leaf.setPath(resourceEntity.getResourceUrl());
                initTreeNode(leaf.getId(), leaf, resourceEntityList);
                if(treeNode.getChildren()==null)
                {
                    List<TreeNode> childreNode=Lists.newLinkedList();
                    treeNode.setChildren(childreNode);
                }
                treeNode.getChildren().add(leaf);
            }
        }
    }


    private List<ResourceEntity> findChildrenByPid(int pid, List<ResourceEntity> resourceList) {
        List<ResourceEntity> resourceEntityList=null;
        for(ResourceEntity resourceEntity:resourceList)
        {
            if(resourceEntity.getPid()==pid)
            {
                if(resourceEntityList==null)
                {
                    resourceEntityList= Lists.newLinkedList();
                }
                resourceEntityList.add(resourceEntity);
            }
        }
        if(resourceEntityList!=null&&resourceEntityList.size()>1)
        {
            Collections.sort(resourceEntityList,new Comparator<ResourceEntity>() {
                @Override
                public int compare(ResourceEntity o1, ResourceEntity o2) {
                    return o1.getOrderNum()-o2.getOrderNum();
                }
            });
        }
        return resourceEntityList;
    }

    /**
     * 从集合里查找某id的资源对象
     * @param resourceEntityList
     * @param id
     * @return
     */
    private ResourceEntity findById(List<ResourceEntity> resourceEntityList,int id) {
        for(ResourceEntity resourceEntity:resourceEntityList)
        {
            if(resourceEntity.getId()==id)
            {
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
        RequestGridEntity requestGridEntity=new RequestGridEntity();
        requestGridEntity.setRows(10000);
        requestGridEntity.setPage(1);
        List<ResourceEntity> resourceEntityList = getBaseDao().findEntityListByRequestGridEntity(requestGridEntity);

        if (resourceEntityList == null || resourceEntityList.isEmpty()) {
            return null;
        }

        List<TreeNode> treeNodeList=Lists.newLinkedList();
        //构造叶子节点
        List<ResourceEntity> children=findChildrenByPid(pid,resourceEntityList);
        if(children!=null&&!children.isEmpty())
        {
            for(ResourceEntity resourceEntity:children)
            {
                TreeNode leaf=new TreeNode();
                leaf.setId(resourceEntity.getId());
                leaf.setIconCls(resourceEntity.getResourceIcon());
                leaf.setText(resourceEntity.getResourceName());
                initTreeNode(leaf.getId(), leaf, resourceEntityList);
                treeNodeList.add(leaf);
            }
        }

        return treeNodeList;
    }
}
