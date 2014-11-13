package com.sz.site7road.entity.resource;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/11/13 10:29.
 * remark:资源的分类
 */
public enum ResourceType {
    menu(1,"菜单"),
    page(2,"页面"),
    service(3,"接口");

    private int typeId;

    private String typeName;

    public int getTypeId() {
        return typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    private ResourceType(int typeId,String typeName)
    {
        this.typeId = typeId ;
        this.typeName = typeName ;
    }

    public static  ResourceType getResourceType(int typeId)
    {
        ResourceType resourceType=null;
        if(typeId<=0)
        {
            return resourceType;
        }
        for(ResourceType type:ResourceType.values())
        {
            if(type.getTypeId()==typeId)
            {
                resourceType=type;
                break;
            }
        }
        return resourceType;
    }
}
