<#import "/spring.ftl" as spring>
<div class="indexDiv" >
    <div style="margin-bottom:2px">
    <#include "*/common/grid_button.ftl"/>
    <@spring.message "role.name"/>:<input class="easyui-textbox" style="width:120px" id="roleName" propertyName="roleName" where="like">
        <a href="#" class="easyui-linkbutton searchEntity${entityName}" iconCls="icon-search"><@spring.message "search"/></a>
    </div>

    <table id="${entityName}grid" class="easyui-datagrid indexTableDiv" style="height: 85%;"
           url="${req.contextPath}/${entityName}/list" toolbar="#${entityName}tb"
           singleSelect="true" fitColumns="true"
           sortName="id" sortOrder="asc" stripe="true"
           rownumbers="true" pagination="true" pageSize="20">
        <thead>
        <tr>
            <th field="roleName" width="100" sortable="true" align="center"><@spring.message "role.name"/></th>
            <th field="roleSummary" width="100" align="left" sortable="true"><@spring.message "role.summary"/></th>
            <th field="lastModifyTime" width="100" align="left" data-options="formatter:function(value){return SITE_7ROAD.formateGridDate(value);}"><@spring.message "update.time"/></th>
             <#if authPermission><th field="id" width="200" align="center" data-options="formatter:function(row){ return initButton(row);}"><@spring.message "operate"/></th></#if>
        </tr>
        </thead>
    </table>
<#if page_show_way == "dialog">
    <div style="display: none;">
        <div id="${entityName}dlg" class="easyui-dialog" style="width:40%;height:30%;padding:10px 20px;" closed="true" buttons="#${entityName}dlg-buttons">
            <form id="${entityName}Fm" method="post" novalidate>
                <table cellpadding="5">
                    <tr style="display: none;">
                        <td><input name="id" id="entityId" class="easyui-textbox"/></td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "user.role"/>:</label></td>
                        <td><input name="roleName" class="easyui-textbox" required="true" validType="length[4,20]" style="width: 400px;" maxlength="20"/></td>
                    </tr>
                    <tr>
                        <td><label><@spring.message "role.summary"/>:</label></td>
                        <td><input name="roleSummary" class="easyui-textbox" required="true" data-options="multiline:true" validType="length[4,200]" style="height: 60px;width: 400px;" maxlength="200"></td>
                    </tr>
                </table>
            </form>
        </div>

        <div id="${entityName}dlg-buttons" style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton c6 saveEntity${entityName}" iconCls="icon-ok" style="width:90px" onclick="saveGridForm('${entityName}','${req.contextPath}')"><@spring.message "save"/></a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#'+'${entityName}dlg').dialog('close')" style="width:90px"><@spring.message "cancel"/></a>
        </div>
    </div>
</#if>
</div>
<script type="text/javascript">
    function initButton(row) {
        return "<a iconCls='icon_edit'  href='javascript:void(0)' onclick='giveRight("+row.id+")'><span class='icon-wheel'>&nbsp;&nbsp;&nbsp;</span><@spring.message "give.right"/></a>";
    }
    function giveRight(roleId)
    {
        //打开一个tab,到赋权限的页面
        SITE_7ROAD.openTab("<@spring.message "give.right"/>","${req.contextPath}/role/auth?roleId="+roleId,"icon-man",'${req.contextPath}');
    }

    $(function () {
        $(".searchEntity${entityName}").bind("click", function () {
            $('#' + '${entityName}grid').datagrid('reload',
                    {"condition_1.propertyName": $("#roleName").attr("propertyName"), "condition_1.where": $("#roleName").attr("where"), "condition_1.propertyValue": $("#roleName").val()});
        });
    });
</script>