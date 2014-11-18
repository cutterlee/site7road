<#import "/spring.ftl" as spring>
<#if addPagePermission>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="
    <#if page_show_way == 'dialog'>SITE_7ROAD.openAddDialog('${entityName}','<@spring.message "create"/>${title}');
    <#else>SITE_7ROAD.openAddTreeTagPage('${entityName}','<@spring.message "create"/>${title}','${req.contextPath}');
    </#if>"><@spring.message "create"/></a>
</#if>
<#if editPagePermission>
<a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="
    <#if page_show_way == 'dialog'>SITE_7ROAD.openEditDialog('${entityName}','<@spring.message "modify"/>${title}');
    <#else>SITE_7ROAD.openEditTreeTagPage('${entityName}','<@spring.message "modify"/>${title}','${req.contextPath}');
    </#if>"><@spring.message "modify"/></a>
</#if>
<#if removePagePermission>
<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="SITE_7ROAD.removeTreeItem('${entityName}','${req.contextPath}')"><@spring.message "remove"/></a>
</#if>
<a href="#" class="easyui-linkbutton" iconCls="icon-book-open"  onclick="SITE_7ROAD.expandTree('${entityName}');"><@spring.message "expand"/></a>
<a href="#" class="easyui-linkbutton" iconCls="icon-book"  onclick="SITE_7ROAD.collapseTree('${entityName}');"><@spring.message "collapse"/></a>