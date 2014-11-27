<#import "/spring.ftl" as spring>
<tr>
    <td>
        <a class="easyui-linkbutton" iconCls="icon-save" style="width:120px;height: 36px;" onclick="SITE_7ROAD.saveEntity('${entityName}','${req.contextPath}','${indexTitle}','${indexIconCls}','${title}',function(){});"><@spring.message "save"/></a>
    </td>
    <td>
        <a class="easyui-linkbutton" iconCls="icon-left" style="width:120px;;height: 36px;" onclick="SITE_7ROAD.returnIndexPage('${entityName}','${req.contextPath}','${indexTitle}','${indexIconCls}','${title}');"><@spring.message "return"/></a>
    </td>
</tr>