<#import "/spring.ftl" as spring>
<#if addPagePermission>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="
    <#if page_show_way == 'dialog'>SITE_7ROAD.openAddDialog('${entityName}','<@spring.message "create"/>${title}');
    <#else>SITE_7ROAD.openAddGridTagPage('${entityName}','<@spring.message "create"/>${title}','${req.contextPath}');
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