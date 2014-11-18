<#if addPagePermission>
<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="
    <#if page_show_way == 'dialog'>openAddDialog('${entityName}','${title}');
    <#else>openAddGridTagPage('${entityName}','${title}','${req.contextPath}');
    </#if>"><@spring.message "create"/></a>
</#if>
<#if editPagePermission>
<a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="
    <#if page_show_way == 'dialog'>openEditDialog('${entityName}','${title}');
    <#else>openEditGridTagPage('${entityName}','${title}','${req.contextPath}');
    </#if>"><@spring.message "modify"/></a>
</#if>
<#if removePagePermission>
<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="removeGridItem('${entityName}','${req.contextPath}')"><@spring.message "remove"/></a>
</#if>