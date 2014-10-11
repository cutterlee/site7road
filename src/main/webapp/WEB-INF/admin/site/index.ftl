<#import "/spring.ftl" as spring>
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
        <a href="#" class="easyui-linkbutton addEntity" iconCls="icon-add">增加</a>
        <a href="#" class="easyui-linkbutton editEntity" iconCls="icon-edit">编辑</a>
        <a href="#" class="easyui-linkbutton removeEntity" iconCls="icon-remove">删除</a>
        站点名称:<input class="easyui-textbox" style="width:120px" id="companyNameSearch" name="siteName">
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
    <th field="siteName" width="100" sortable="true" align="center">站点名称</th>
    <th field="siteAlias" width="100" align="left" sortable="true">站点简称</th>
    <th field="siteUrl" width="100" align="left">站点域</th>
    <th field="staticUrl" width="100">静态资源域</th>
    <th field="siteIcon" width="100">站点图标</th>
    <th field="siteDir" width="100">站点文件目录</th>
    <th field="staticDir" width="100">静态文件目录</th>
    <th field="templateDir" width="100">模板文件目录</th>
    <th field="companyEntity.comanyName" width="100">所属公司</th>
</tr>
</thead>

</table>

<div style="display: none;">
    <div id="${entityName}dlg" class="easyui-dialog" style="width:80%;height:90%;padding:10px 20px;"
         closed="true" buttons="#${entityName}dlg-buttons">

<form id="${entityName}Fm" method="post" novalidate>
    <table cellpadding="5">
        <tr style="display: none;">
            <td><input name="id" id="entityId" class="easyui-textbox"/></td>
        </tr>
        <tr>
            <td><label>站点名称:</label></td>
            <td>
                <input name="siteName" class="easyui-textbox" required="true" style="width: 400px;"/>
            </td>
        </tr>
        <tr>
            <td><label>站点简称:</label></td>
            <td><input name="siteAlias" class="easyui-textbox" required="true" style="width: 400px;"></td>
        </tr>
        <tr>
            <td><label>站点域名:</label></td>
            <td><input name="siteUrl" class="easyui-textbox" style="width: 400px;" required="true"></td>
        </tr>

        <tr>
            <td><label>静态资源域:</label></td>
            <td><input name="staticUrl" class="easyui-textbox" style="width: 400px;" required="true"></td>
        </tr>

        <tr>
            <td><label>站点图标:</label></td>
            <td><input name="siteIcon" class="easyui-textbox" style="width: 400px;" required="true"></td>
        </tr>

        <tr>
            <td><label>站点文件目录:</label></td>
            <td><input name="siteDir" class="easyui-textbox" style="width: 400px;" required="true"></td>
        </tr>

        <tr>
            <td><label>静态文件目录:</label></td>
            <td><input name="staticDir" class="easyui-textbox" style="width: 400px;" required="true"></td>
        </tr>

        <tr>
            <td><label>模板文件目录:</label></td>
            <td><input name="templateDir" class="easyui-textbox" style="width: 400px;" required="true"></td>
        </tr>

        <tr>
            <td><label>所属公司:</label></td>
            <td><input name="companyEntity.id" class="easyui-textbox" style="width: 400px;" required="true"></td>
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
