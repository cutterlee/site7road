<#import "/spring.ftl" as spring>
<div class="easyui-panel indexDiv">
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
        <#include "*/common/grid_button.ftl"/>
        <@spring.message "user.username"/>:<input class="easyui-textbox" style="width:120px"  id="username"   propertyName="username" where="like">
        <@spring.message "user.nick.name"/>:<input class="easyui-textbox" style="width:120px"     id="nickName" propertyName="nickName" where="like">
        <@spring.message "user.status"/>:<select class="easyui-combobox" style="width:120px"  id="userStatus" propertyName="userStatus" where="eq">
        <option value="0" checked="checked"><@spring.message "select"/></option>
        <option value="1" checked="checked"><@spring.message "account.normal"/></option>
        <option value="2"><@spring.message "account.fenghao"/></option>
        </select>
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
            <th field="username" width="100" sortable="true" align="center"><@spring.message "user.username"/></th>
            <th field="nickName" width="50" align="left"><@spring.message "user.nick.name"/></th>
            <th field="userEmail" width="100"><@spring.message "user.email"/></th>
            <th data-options="field:'lastLoginTime',formatter:function(value){return SITE_7ROAD.formateGridDate(value);}"  width="100"><@spring.message "user.last.login.time"/></th>
            <th field="lastLoginIp" width="100"><@spring.message "user.last.login.ip"/></th>
            <th field="userStatus" width="80" align="center"  data-options="field:'createTime',formatter:
                        function(value){
                        if(value=='1') return '<@spring.message "account.normal"/>';
                        else if(value=='2') return '<@spring.message "account.fenghao"/>';
                        }"><@spring.message "user.status"/></th>
            <th field="loginTimes" width="80"><@spring.message "user.login.times"/></th>
            <th  data-options="field:'createTime',formatter:function(value){return SITE_7ROAD.formateGridDate(value);}" width="100"><@spring.message "user.create.time"/></th>
    </tr>
    </thead>
</table>

<#if page_show_way == "dialog">
<div style="display: none;">
    <div id="${entityName}dlg" class="easyui-dialog" style="width:50%;height:55%;padding:10px 20px;"  closed="true" buttons="#${entityName}dlg-buttons">
        <form id="${entityName}Fm" method="post" novalidate>
            <table cellpadding="5">
                <tr style="display: none;">
                    <td><input name="id" id="entityId" class="easyui-textbox" /></td>
                </tr>
                <tr>
                    <td style="width: 150px;"><label><@spring.message "user.role"/>:</label></td>
                    <td>
                        <select name="roleId" style="width: 300px;" class="easyui-combogrid" required="true" validType="selectValueRequired"data-options="
                            panelWidth: 500,
                            idField: 'id',
                            textField: 'roleName',
                            url: '${req.contextPath}/role/list',
                            method: 'get',
                            pagination:true,
                            columns: [[
                                {field:'roleName',title:'<@spring.message "role.name"/>',width:80},
                                {field:'roleSummary',title:'<@spring.message "role.summary"/>',width:200}
                            ]],
                            fitColumns: true
                        ">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label><@spring.message "user.username"/>:</label></td>
                    <td>
                        <input name="username" class="easyui-validatebox" required="true" validType="username" style="width: 400px;" />
                    </td>
                </tr>
                <tr>
                    <td><label><@spring.message "user.password"/>:</label></td>
                    <td>
                        <input name="password" class="easyui-validatebox" id="password" type="password" required="true"  validType="length[6,20]" style="width: 400px;">
                    </td>
                </tr>
                <tr>
                    <td><label><@spring.message "user.re.password"/>:</label></td>
                    <td>
                        <input name="repassword" class="easyui-validatebox" type="password" validType="same['password']" required="true" style="width: 400px;">
                    </td>
                </tr>
                <tr>
                    <td><label><@spring.message "user.nick.name"/>:</label></td>
                    <td>
                        <input name="nickName" class="easyui-validatebox"  validType="length[2,8]" style="width: 400px;" required="true">
                    </td>
                </tr>
                <tr>
                    <td><label><@spring.message "user.email"/>:</label></td>
                    <td>
                        <input name="userEmail" class="easyui-validatebox"  style="width: 400px;" required="true" data-options="validType:'email'">
                    </td>
                </tr>
                <tr>
                    <td><label><@spring.message "user.status"/>:</label></td>
                    <td>
                    <select name="userStatus" style="width: 150px;" class="easyui-combobox" value="1" required="true" validType="selectValueRequired">
                        <option value="1" checked="checked"><@spring.message "account.normal"/></option>
                        <option value="2"><@spring.message "account.fenghao"/></option>
                    </select>
                    </td>
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
    $(function () {
        $(".searchEntity${entityName}").bind("click", function () {
                    $('#' + '${entityName}grid').datagrid('load',
                            {"condition_1.propertyName": $("#username").attr("propertyName"),"condition_1.propertyValue": $("#username").val() ,"condition_1.where":$("#username").attr("where"),
                                "condition_2.propertyName": $("#nickName").attr("propertyName"),"condition_2.propertyValue": $("#nickName").val() ,"condition_2.where":$("#nickName").attr("where"),
                                "condition_3.propertyName": $("#userStatus").attr("propertyName"),"condition_3.propertyValue": $("#userStatus").combobox('getValue') ,"condition_3.where":$("#userStatus").attr("where")
                            });
        });
    });
</script>