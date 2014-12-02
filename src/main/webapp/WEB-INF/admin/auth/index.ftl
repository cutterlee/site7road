<#import "/spring.ftl" as spring>
<div class="indexDiv">
            <div id="${entityName}tb" style="padding:2px;height:auto;">
                <div style="margin-bottom:2px">
                   <#include "*/common/tree_button.ftl"/>
                    权限名称:<input class="easyui-textbox" style="width:120px" id="resourceName" propertyName="resourceName" where="like" >
                    权限url:<input class="easyui-textbox" style="width:120px" id="resourceUrl" propertyName="resourceUrl" where="like" >
                    资源类型:<select class="easyui-combobox" style="width: 200px;"  name="resourceType" id="resourceType" propertyName="resourceType" where="eq" >
                        <option value=0>请选择</option>
                        <option value=1>菜单</option>
                        <option value=2>页面</option>
                        <option value=3>接口</option>
                    </select>
                    <a href="#" class="easyui-linkbutton searchEntity${entityName}" iconCls="icon-search">搜索</a>

                </div>
            </div>


            <table id="${entityName}grid" class="easyui-treegrid " style="height:auto;"
                   url="${req.contextPath}/${entityName}/tree" toolbar="#${entityName}tb"
                   iconCls="icon-reload" singleSelect="true" fitColumns="true" autoRowHeight="true" lines="true"
                   sortName="id" sortOrder="asc" idField="id" treeField="resourceName" showFooter="true"
                   rownumbers="false" pagination="true" pageSize="20">
                <thead>
                <tr>
                    <th field="resourceName" width="100" align="left" sortable="true">资源名称</th>
                    <th field="resourceUrl" width="200">资源url</th>
                    <th field="resourceType" width="200" data-options="formatter:function(value){
                    if(value==1) return '菜单';
                     if(value==2) return '页面';
                      if(value==3) return '接口';
                    }">资源类型</th>
                    <th field="orderNum" width="100">排序号</th>
                    <th field="resourceSummary" width="200" align="left">资源简介</th>
                </tr>
                </thead>
            </table>

</div>

<script type="text/javascript">
    $(function () {
        $(".searchEntity${entityName}").bind("click", function () {
            $('#' + '${entityName}grid').treegrid('reload', {
                "condition_1.propertyName": $("#resourceName").attr("propertyName"), "condition_1.where": $("#resourceName").attr("where"), "condition_1.propertyValue": $("#resourceName").val(),
                "condition_2.propertyName": $("#resourceUrl").attr("propertyName"), "condition_2.where": $("#resourceUrl").attr("where"), "condition_2.propertyValue": $("#resourceUrl").val(),
                "condition_3.propertyName": $("#resourceType").attr("propertyName"), "condition_3.where": $("#resourceType").attr("where"), "condition_3.propertyValue": $("input[name=resourceType]").val()
            });
        });
    });
</script>