<#import "/spring.ftl" as spring>
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
        <a href="#" class="easyui-linkbutton addEntity${entityName}" iconCls="icon-add">增加</a>
        <a href="#" class="easyui-linkbutton editEntity${entityName}" iconCls="icon-edit">编辑</a>
        <a href="#" class="easyui-linkbutton removeEntity${entityName}" iconCls="icon-remove">删除</a>
        用户名:<input class="easyui-textbox" style="width:120px"  id="username"   propertyName="username" where="like">
        昵称:<input class="easyui-textbox" style="width:120px"     id="nickName" propertyName="nickName" where="like">
        账号状态:<select class="easyui-combobox" style="width:120px"  id="userStatus" propertyName="userStatus" where="eq">
        <option value="1" checked="checked">正常</option>
        <option value="2">封号</option>
        </select>
        <a href="#" class="easyui-linkbutton searchEntity${entityName}" iconCls="icon-search">搜索</a>
    </div>
</div>

<table id="${entityName}grid" class="easyui-datagrid" style="width:100%;height:100%"
       url="${req.contextPath}/${entityName}/list" toolbar="#${entityName}tb"
       iconCls="icon-reload" singleSelect="true" fitColumns="true"
       sortName="id" sortOrder="asc"
       rownumbers="true" pagination="true" pageSize="20">
    <thead>
        <tr>
            <th field="username" width="100" sortable="true" align="center">用户名</th>
            <th field="nickName" width="50" align="left">昵称</th>
            <th field="userEmail" width="100">工作邮箱</th>
            <th data-options="field:'lastLoginTime',formatter:
                        function(value,row,index){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.format('yyyy-MM-dd hh:mm:ss');
                        }"  width="100">最后登录时间</th>
            <th field="lastLoginIp" width="100">最后登录ip</th>
            <th field="userStatus" width="80" align="center"  data-options="field:'createTime',formatter:
                        function(value,row,index){
                        if(value=='1') return '正常';
                        else if(value=='2') return '封号';
                        }">账号状态</th>
            <th field="loginTimes" width="80">总登录次数</th>
            <th  data-options="field:'createTime',formatter:
                        function(value,row,index){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.format('yyyy-MM-dd hh:mm:ss');
                        }" width="100">创建时间</th>
    </tr>
    </thead>
</table>

<div style="display: none;">
    <div id="${entityName}dlg" class="easyui-dialog" style="width:50%;height:45%;padding:10px 20px;"  closed="true" buttons="#${entityName}dlg-buttons">
        <form id="${entityName}Fm" method="post" novalidate>
            <table cellpadding="5">
                <tr style="display: none;">
                    <td><input name="id" id="entityId" class="easyui-textbox" /></td>
                </tr>
                <tr>
                    <td><label>用户名:</label></td>
                    <td>
                        <input name="username" class="easyui-validatebox" required="true" validType="username" style="width: 400px;" />
                    </td>
                </tr>
                <tr>
                    <td><label>密码:</label></td>
                    <td>
                        <input name="password" class="easyui-validatebox" id="password" type="password" required="true"  validType="length[6,20]" style="width: 400px;">
                    </td>
                </tr>
                <tr>
                    <td><label>确认密码:</label></td>
                    <td>
                        <input name="repassword" class="easyui-validatebox" type="password" validType="same['password']" required="true" style="width: 400px;">
                    </td>
                </tr>
                <tr>
                    <td><label>昵称:</label></td>
                    <td>
                        <input name="nickName" class="easyui-validatebox"  validType="length[2,8]" style="width: 400px;" required="true">
                    </td>
                </tr>
                <tr>
                    <td><label>工作邮箱:</label></td>
                    <td>
                        <input name="userEmail" class="easyui-validatebox"  style="width: 400px;" required="true" data-options="validType:'email'">
                    </td>
                </tr>
                <tr>
                    <td><label>账号状态:</label></td>
                    <td>
                    <select name="userStatus" style="width: 150px;" class="easyui-combobox" required="true" validType="selectValueRequired">
                        <option value="1" checked="checked">正常</option>
                        <option value="2">封号</option>
                    </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div id="${entityName}dlg-buttons" style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton c6 saveEntity${entityName}" iconCls="icon-ok" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#'+'${entityName}dlg').dialog('close')" style="width:90px">取消</a>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $(".addEntity${entityName}").bind("click", function () {
            $('#' + '${entityName}Fm').form('clear');
            $('.textbox-value').val('0');
            $('#' + '${entityName}dlg').dialog('open').dialog('setTitle', '增加${title}');
        });
        $(".editEntity${entityName}").bind("click", function () {
            var row = $('#' + '${entityName}grid').datagrid('getSelected');
            if (row) {
                $('#' + '${entityName}dlg').dialog('open').dialog('setTitle', '编辑${title}');
                $('#' + '${entityName}Fm').form('load', row);
            }
        });
        $(".saveEntity${entityName}").bind("click", function () {
            $('#' + '${entityName}Fm').form('submit', {
                url: '${req.contextPath}/${entityName}/save',
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (result) {
                    var result = eval('(' + result + ')');
                    if (result.success) {
                        $('#' + '${entityName}dlg').dialog('close');        // close the dialog
                        $('#' + '${entityName}grid').datagrid('reload');    // reload the user data

                    } else {
                        $.messager.show({
                            title: '错误提示',
                            msg: result.errorMsg
                        });
                    }
                }
            });
        });
        $(".removeEntity${entityName}").bind("click", function () {
            var row = $('#' + '${entityName}grid').datagrid('getSelected');
            if (row) {
                $.messager.confirm('确认', '你确定删除这条数据?', function (r) {
                    if (r) {
                        $.post('${req.contextPath}/${entityName}/' + row.id + '/remove', function (result) {
                            if (result.success) {
                                $('#'+'${entityName}grid').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: '错误提示',
                                    msg: result.errorMsg
                                });
                            }
                        }, 'json');
                    }
                });
            }
        });
        $(".searchEntity${entityName}").bind("click", function () {
                    $('#' + '${entityName}grid').datagrid('load',
                            {"condition_1.propertyName": $("#username").attr("propertyName"),"condition_1.propertyValue": $("#username").val() ,"condition_1.where":$("#username").attr("where"),
                                "condition_2.propertyName": $("#nickName").attr("propertyName"),"condition_2.propertyValue": $("#nickName").val() ,"condition_2.where":$("#nickName").attr("where"),
                                "condition_3.propertyName": $("#userStatus").attr("propertyName"),"condition_3.propertyValue": $("#userStatus").val() ,"condition_3.where":$("#userStatus").attr("where")
                            });
        });
    });
</script>