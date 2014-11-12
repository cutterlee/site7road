<#import "/spring.ftl" as spring>
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
        <a href="#" class="easyui-linkbutton addEntity" iconCls="icon-add">增加</a>
        <a href="#" class="easyui-linkbutton editEntity" iconCls="icon-edit">编辑</a>
        <a href="#" class="easyui-linkbutton removeEntity" iconCls="icon-remove">删除</a>
        职位名称:<input class="easyui-textbox" style="width:120px" id="companyNameSearch" name="agentName">

        <a href="#" class="easyui-linkbutton searchEntity" iconCls="icon-search">搜索</a>
    </div>
</div>


<table id="${entityName}grid" class="easyui-datagrid" style="width:100%;height:100%"
       url="${req.contextPath}/${entityName}/list" toolbar="#${entityName}tb"
       iconCls="icon-reload" singleSelect="true" fitColumns="true"
       sortName="id" sortOrder="asc"
       rownumbers="true" pagination="true" pageSize="20">
    <thead>
    <tr>
        <th field="orderNum" >排序号</th>
        <th field="region_tag"  sortable="true" align="center">区域代号</th>
        <th field="agentName"  align="left" sortable="true">代理商名称</th>
        <th field="agentImg"  align="left">代理商图片</th>
        <th field="agentUrl"  align="left">代理商的主页</th>
        <th  data-options="field:'updateTime',formatter:
                    function(value,row,index){
                    var unixTimestamp = new Date(value);
                    return unixTimestamp.format('yyyy-MM-dd hh:mm:ss');
                    }">创建时间</th>
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
                    <td><label>排序号:</label></td>
                    <td>
                        <input name="orderNum" class="easyui-textbox" required="true" style="width: 400px;" />
                    </td>
                </tr>
                <tr>
                    <td><label>所属区域:</label></td>
                    <td><input name="regionTag" class="easyui-textbox" required="true" style="width: 400px;"></td>
                </tr>
                <tr>
                    <td><label>代理商名:</label></td>
                    <td><input name="agentName" class="easyui-textbox" style="width: 400px;" required="true" maxlength="10"></td>
                </tr>

                <tr>
                    <td><label>代理商图片:</label></td>
                    <td>
                        <input name="agentImg" class="easyui-textbox"  style="width: 400px;"   required="true">
                    </td>
                </tr>

                <tr>
                    <td><label>代理商url:</label></td>
                    <td><input name="agentUrl" class="easyui-textbox"   required="true"></td>
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