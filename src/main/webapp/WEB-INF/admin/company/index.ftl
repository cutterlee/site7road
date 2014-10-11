<#import "/spring.ftl" as spring>
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
        <a href="#" class="easyui-linkbutton addEntity" iconCls="icon-add">增加</a>
        <a href="#" class="easyui-linkbutton editEntity" iconCls="icon-edit">编辑</a>
        <a href="#" class="easyui-linkbutton removeEntity" iconCls="icon-remove">删除</a>
        <#--Date From: <input class="easyui-datebox" style="width:80px">-->
        <#--To: <input class="easyui-datebox" style="width:80px">-->
        公司名称:<input class="easyui-textbox" style="width:120px" id="companyNameSearch">
        <#--<select class="easyui-combobox" panelHeight="auto" style="width:100px">-->
            <#--<option value="java">Java</option>-->
            <#--<option value="c">C</option>-->
            <#--<option value="basic">Basic</option>-->
            <#--<option value="perl">Perl</option>-->
            <#--<option value="python">Python</option>-->
        <#--</select>-->
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
        <th field="companyName" width="200" sortable="true" align="center">公司名称</th>
            <th field="companyLinkway" width="200" align="left" sortable="true">联系方式</th>
            <th field="companyAddress" width="200" align="left">公司地址</th>
        <th field="companyCulture" width="200" align="left">企业文化</th>
        <th field="companySummary" width="200">公司简介</th>
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
                    <td><label>公司名称:</label></td>
                    <td>
                        <input name="companyName" class="easyui-textbox" required="true" style="width: 400px;" />
                    </td>
                </tr>
                <tr>
                    <td><label>公司地址:</label></td>
                    <td><input name="companyAddress" class="easyui-textbox" required="true" style="width: 400px;"></td>
                </tr>
                <tr>
                    <td><label>联系方式:</label></td>
                    <td><input name="companyLinkway" class="easyui-textbox" style="width: 400px;" required="true"></td>
                </tr>

                <tr>
                    <td><label>企业文化:</label></td>
                    <td>
                        <input name="companyCulture" class="easyui-textbox"  style="width: 400px;"
                               required="true">
                    </td>
                </tr>

                <tr>
                    <td><label>公司简介:</label></td>
                    <td><input name="companySummary" class="easyui-textbox" data-options="multiline:true"
                               style="height: 300px;width: 400px;" required="true"></td>
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