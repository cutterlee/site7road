<#import "/spring.ftl" as spring>
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
        <a href="#" class="easyui-linkbutton addEntity" iconCls="icon-add">增加</a>
        <a href="#" class="easyui-linkbutton editEntity" iconCls="icon-edit">编辑</a>
        <a href="#" class="easyui-linkbutton removeEntity" iconCls="icon-remove">删除</a>
        用户名:<input class="easyui-textbox" style="width:120px" id="companyNameSearch">
        <a href="#" class="easyui-linkbutton searchEntity" iconCls="icon-search">搜索</a>
    </div>
</div>


<table id="${entityName}grid" class="easyui-datagrid" style="width:100%;height:100%"
       url="${req.contextPath}/${entityName}/list" toolbar="#${entityName}tb"
       iconCls="icon-reload" singleSelect="true"
       sortName="id" sortOrder="asc"
       rownumbers="true" pagination="true" pageSize="20">
    <thead>
    <tr>
    <#--<th field="id" width="80">编号</th>-->
        <th field="username" width="50" sortable="true" align="center">用户名</th>
        <th field="password" width="50" align="left" sortable="true">密码</th>
        <th field="passsalt" width="50" align="left">盐</th>
        <th field="nickName" width="50" align="left">昵称</th>
        <th field="userEmail" width="100">工作邮箱</th>
        <th field="lastLoginTime" width="100">最后登录时间</th>
        <th field="createTime" width="100">创建时间</th>
        <th field="lastLoginIp" width="100">最后登录ip</th>
        <th field="userStatus" width="80">账号状态</th>
        <th field="loginTimes" width="80">总登录次数</th>
    </tr>
    </thead>
</table>

<div style="display: none;">
    <div id="${entityName}dlg" class="easyui-dialog" style="width:80%;height:90%;padding:10px 20px;"
         closed="true" buttons="#${entityName}dlg-buttons">
    <#--<div class="ftitle"><h1>${title}</h1></div>-->
        <form id="${entityName}Fm" method="post" novalidate>

            <table cellpadding="5">
                <tr style="display: none;">
                    <td>  <input name="id" id="entityId" class="easyui-textbox" /></td>
                </tr>
                <tr>
                    <td><label>用户名:</label></td>
                    <td>
                        <input name="username" class="easyui-textbox" required="true" style="width: 400px;" />
                    </td>
                </tr>
                <tr>
                    <td><label>密码:</label></td>
                    <td><input name="password" class="easyui-textbox" required="true" style="width: 400px;"></td>
                </tr>
                <tr>
                    <td><label>昵称:</label></td>
                    <td><input name="nickName" class="easyui-textbox" style="width: 400px;" required="true"></td>
                </tr>

                <tr>
                    <td><label>工作邮箱:</label></td>
                    <td>
                        <input name="userEmail" class="easyui-textbox"  style="width: 400px;"
                               required="true">
                    </td>
                </tr>

                <tr>
                    <td><label>账号状态:</label></td>
                    <td><input name="userStatus" class="easyui-textbox"  required="true"></td>
                </tr>
            </table>
        </form>
    </div>





    <div id="${entityName}dlg-buttons" style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton c6 saveEntity" iconCls="icon-ok" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
           onclick="javascript:$('#'+'${entityName}dlg').dialog('close')" style="width:90px">取消</a>
    </div>
</div>
<#include "*/common/script.ftl">