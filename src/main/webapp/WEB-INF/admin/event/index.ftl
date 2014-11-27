<#import "/spring.ftl" as spring>
<div class="easyui-panel indexDiv">
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
        <#include "*/common/grid_button.ftl"/>
        <@spring.message "event.title"/>:<input class="easyui-textbox" style="width:120px"  id="title"   propertyName="title" where="like">
        <a href="#" class="easyui-linkbutton searchEntity${entityName}" iconCls="icon-search"><@spring.message "search"/></a>
    </div>
</div>

<table id="${entityName}grid" class="easyui-datagrid indexTableDiv" style="height: 88%;"
       url="${req.contextPath}/${entityName}/list" toolbar="#${entityName}tb"
       iconCls="icon-reload" singleSelect="true" fitColumns="true"
       sortName="id" sortOrder="asc" stripe="true"
       rownumbers="true" pagination="true" pageSize="20">
    <thead>
        <tr>
            <th field="title"  sortable="true" align="center">大事件标题</th>
            <th sortable="true"  align="left" data-options="field:'publishTime',formatter:
            function(value,row,index){
            return SITE_7ROAD.transGridDate(value);
            }
            ">发生日期</th>
            <th field="eventContentSmall"  align="left">大事件内容简介</th>
            <th field="eventContentDetail"  align="left">大事件详细内容</th>
            <th field="eventImgInEventPage"  align="left">列表页图片</th>

        </tr>
    </thead>
</table>


</div>
<script type="text/javascript">
    $(function () {
        $(".searchEntity${entityName}").bind("click", function () {
                    $('#' + '${entityName}grid').datagrid('load',
                            {"condition_1.propertyName": $("#title").attr("propertyName"),"condition_1.propertyValue": $("#title").val() ,"condition_1.where":$("#title").attr("where")
                            });
        });
    });
</script>