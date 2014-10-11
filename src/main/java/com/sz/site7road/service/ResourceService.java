package com.sz.site7road.service;

import com.sz.site7road.entity.resource.ResourceEntity;
import com.sz.site7road.framework.tree.TreeNode;

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


}
