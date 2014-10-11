<#import "/spring.ftl" as spring>
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
        <a href="#" class="easyui-linkbutton addEntity" iconCls="icon-add">增加</a>
        <a href="#" class="easyui-linkbutton editEntity" iconCls="icon-edit">编辑</a>
        <a href="#" class="easyui-linkbutton removeEntity" iconCls="icon-remove">删除</a>
        职位名称:<input class="easyui-textbox" style="width:120px" id="companyNameSearch" name="positionName">

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
        <th field="positionName"  sortable="true" align="center">职位名称</th>
            <th field="positionPlace"  align="left" sortable="true">所在城市</th>
            <th field="positionNeedNum"  align="left">所需人数</th>
        <th field="positionProperty"  align="left">职位性质</th>
        <th field="positionDuty" >工作职责</th>
        <th field="positionRequirement">职位要求</th>
        <th field="hotStatus" >是否热招</th>
        <th field="createTime">创建时间</th>
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
                    <td><label>职位名称:</label></td>
                    <td><input name="positionName" class="easyui-textbox" required="true" style="width: 400px;"></td>
                </tr>
                <tr>
                    <td><label>所在城市:</label></td>
                    <td><input name="positionPlace" class="easyui-textbox" style="width: 400px;" required="true" maxlength="10"></td>
                </tr>

                <tr>
                    <td><label>所需人数:</label></td>
                    <td>
                        <input name="positionNeedNum" class="easyui-textbox"  style="width: 400px;"   required="true">
                    </td>
                </tr>

                <tr>
                    <td><label>职位性质:</label></td>
                    <td><input name="positionProperty" class="easyui-textbox"   required="true"></td>
                </tr>
                <#--<tr>-->
                    <#--<td><label>是否热招职位:</label></td>-->
                    <#--<td><input name="hotStatus"  type="radio" value="1" checked="true">热招 <input name="hotStatus"  type="radio" value="0">普通</td>-->
                <#--</tr>-->
                <tr>
                    <td><label>工作职责:</label></td>
                    <td><input name="positionDuty" class="easyui-textbox" data-options="multiline:true"
                               style="height: 200px;width:600px;" required="true"></td>
                </tr>
                <tr>
                    <td><label>岗位要求:</label></td>
                    <td><input name="positionRequirement" class="easyui-textbox" data-options="multiline:true"
                               style="height: 200px;width: 600px;" required="true"></td>
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