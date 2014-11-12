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
       iconCls="icon-reload" singleSelect="true" rownumbers="true"
       sortName="id" sortOrder="asc" border="false" fitColumns="true"
       pagination="true" pageSize="20">
    <thead>
    <tr>
        <th field="roleName" width="100" sortable="true" align="center">角色名称</th>
        <th field="roleSummary" width="100" align="left" sortable="true">角色概述</th>
        <th field="lastModifyTime" width="100" align="left" data-options="formatter:function(value,row,index){
          var unixTimestamp = new Date(value); return unixTimestamp.format('yyyy-MM-dd hh:mm:ss');
        }">修改时间</th>
        <th field="id" width="200" align="center" formatter="initButton">操作</th>
    </tr>
    </thead>
</table>

<div style="display: none;">
    <div id="${entityName}dlg" class="easyui-dialog" style="width:40%;height:30%;padding:10px 20px;"
         closed="true" buttons="#${entityName}dlg-buttons">

        <form id="${entityName}Fm" method="post" novalidate>
            <table cellpadding="5">
                <tr style="display: none;">
                    <td><input name="id" id="entityId" class="easyui-textbox"/></td>
                </tr>
                <tr>
                    <td><label>角色名称:</label></td>
                    <td>
                        <input name="roleName" class="easyui-textbox" required="true" style="width: 400px;"/>
                    </td>
                </tr>
                <tr>
                    <td><label>角色描述:</label></td>
                    <td><input name="roleSummary" class="easyui-textbox" required="true" style="width: 400px;"></td>
                </tr>
                <tr>
                    <td><label>所属站点:</label></td>
                    <td><input name="site.id" class="easyui-textbox" style="width: 400px;" required="true"></td>
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
<script type="text/javascript" src="${req.contextPath}/static/js/sys/common.js"></script>
<script type="text/javascript">
    function initButton(value, row, index) {
        return "<a class='dialog-button giveRight' iconCls='icon_edit'  href='javascript:void(0)' onclick='giveRight("+row.id+")' style='color: red;' >分配权限</a>";
    }
    function giveRight(roleId)
    {
      //打开一个tab,到赋权限的页面
        openTab("分配权限","${req.contextPath}/role/auth?roleId="+roleId);
    }
</script>
<#include "*/common/script.ftl">
