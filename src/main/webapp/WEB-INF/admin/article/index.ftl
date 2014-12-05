<#import "/spring.ftl" as spring>
<div class="easyui-panel">
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
    <@spring.message "banner.name"/>:
        <select class="easyui-combotree" id="typeId" propertyName="typeId" where="eq"
                data-options="url:'${req.contextPath}/banner/comboTree',method:'post',panelHeight:'auto',panelWidth:'auto',textField:'text',valueField:'id',
                onSelect:function(node){
                    queryArticle();
                    if(node.children){
                        $('a[id=add]').hide();
                    }else{
                        $('a[id=add]').show();
                    }
                }
                "
                style="width: 200px;"></select>
    <#if addPagePermission>
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" id="add" style="display: none;" onclick="
            <#if page_show_way == 'dialog'>SITE_7ROAD.openAddDialog('${entityName}','<@spring.message "create"/>${title}');
            <#else>SITE_7ROAD.openAddArticleTagPage('${entityName}','<@spring.message "create"/>${title}','${req.contextPath}', $('#typeId').combotree('tree').tree('getSelected').id);
            </#if>"><@spring.message "create"/></a>
    </#if>
    <#if editPagePermission>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="
            <#if page_show_way == 'dialog'>SITE_7ROAD.openEditDialog('${entityName}','<@spring.message "modify"/>${title}');
            <#else>SITE_7ROAD.openEditGridTagPage('${entityName}','<@spring.message "modify"/>${title}','${req.contextPath}');
            </#if>"><@spring.message "modify"/></a>
    </#if>
    <#if removePagePermission>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="SITE_7ROAD.removeGridItem('${entityName}','${req.contextPath}')"><@spring.message "remove"/></a>
    </#if>
        <@spring.message "article.name"/>:<input class="easyui-textbox" style="width:120px"  id="title"   propertyName="title" where="like">
         <a href="#" class="easyui-linkbutton searchEntity${entityName}" iconCls="icon-search"><@spring.message "search"/></a>
    </div>
</div>

<table id="${entityName}grid" class="easyui-datagrid indexTableDiv"
       url="${req.contextPath}/${entityName}/list" toolbar="#${entityName}tb"
       iconCls="icon-reload" singleSelect="true" fitColumns="true"  autoRowHeight="false"
       sortName="id" sortOrder="asc" stripe="true"
       rownumbers="true" pagination="true" pageSize="20">
    <thead>
        <tr>
            <th field="title" width="200" sortable="true" align="lefe"><@spring.message "article.name"/></th>
            <th field="addTime" width="100"  data-options="field:'lastLoginTime',formatter:function(value){return SITE_7ROAD.formateGridDate(value);}" ><@spring.message "article.add.time"/></th>
            <th field="hits" width="100"><@spring.message "article.hits"/></th>
    </tr>
    </thead>
</table>


<script type="text/javascript">
        function queryArticle() {
            $('#' + '${entityName}grid').datagrid('load',
                    {
                        "condition_2.propertyName": $("#typeId").attr("propertyName"),"condition_2.propertyValue": $("#typeId").combotree("tree").tree("getSelected").id ,"condition_2.where":$("#typeId").attr("where")
                    });
        }
    $(function () {
        $(".searchEntity${entityName}").bind("click", function() {
            $('#' + '${entityName}grid').datagrid('load',
                    {"condition_1.propertyName": $("#title").attr("propertyName"),"condition_1.propertyValue": $("#title").val() ,"condition_1.where":$("#title").attr("where")
                    });
        });
    });
</script>