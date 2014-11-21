<#import "/spring.ftl" as spring>
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
       <#include "*/common/grid_button.ftl"/>
        <@spring.message "site.name"/>:<input class="easyui-textbox" style="width:120px" id="siteName" propertyName="siteName" where="like">
        <a href="#" class="easyui-linkbutton searchEntity" iconCls="icon-search">搜索</a>
    </div>
</div>


<table id="${entityName}grid" class="easyui-datagrid" style="width:100%;height:88%"
       url="${req.contextPath}/${entityName}/list" toolbar="#${entityName}tb"
       iconCls="icon-reload" singleSelect="true"
       sortName="id" sortOrder="asc"
       rownumbers="true" pagination="true" pageSize="20">
<thead>
<tr>

    <th field="siteAlias" width="100" align="left" sortable="true">站点简称</th>
    <th field="siteName" width="100" sortable="true" align="center">站点名称</th>
    <th field="siteIcon" width="100">站点图标</th>
    <th field="siteUrl" width="100" align="left">站点域名</th>
    <th field="siteDir" width="100">站点文件目录</th>
    <th field="staticUrl" width="100">静态资源域</th>
    <th field="staticDir" width="100">静态文件目录</th>
    <th field="templateDir" width="100">模板文件目录</th>

    <th field="siteOwner" width="100">站点所有者</th>
    <th field="address" width="100">联系地址</th>
    <th field="phoneNum" width="100">联系电话</th>
    <th field="zipCode" width="100">邮政编码</th>
    <th field="backUpNum" width="100">备案编号</th>

    <th field="closeMsg" width="100">站点关闭信息</th>
    <th field="maxFileSize" width="100">上传文件最大限制</th>
    <th field="fileTypes" width="100">上传文件的扩展名</th>
    <th field="imageSavePath" width="100">上传的图片保存路径</th>
    <th field="cssSavePath" width="100">上传的样式保存路径</th>
    <th field="jsSavePath" width="100">上传的脚本保存路径</th>
    <th field="otherSavePath" width="100">其它文件保存路径</th>
    <th field="cookieDomain" width="100">cookie的域</th>

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
