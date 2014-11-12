<#import "/spring.ftl" as spring>
<div id="${entityName}tb" style="padding:2px;height:auto;">
    <div style="margin-bottom:2px">
        <a href="#" class="easyui-linkbutton addEntity" iconCls="icon-add">增加</a>
        <a href="#" class="easyui-linkbutton editEntity" iconCls="icon-edit">编辑</a>
        <a href="#" class="easyui-linkbutton removeEntity" iconCls="icon-remove">删除</a>
        资源名称:<input class="easyui-textbox" style="width:120px" id="companyNameSearch" name="resourceName">
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
    <th field="id" width="100" sortable="true" align="center">编号</th>
    <th field="pid" width="100" sortable="true" align="center">父权限</th>
    <th field="resourceName" width="100" align="left" sortable="true">资源名称</th>
    <th field="resourceIcon" width="100" align="center"  formatter="setIcon">资源图标</th>
    <th field="orderNum" width="100">排序号</th>
    <th field="resourceSummary" width="200" align="left">资源简介</th>
    <th field="resourceUrl" width="200">资源url</th>

</tr>
</thead>

</table>

<div style="display: none;">
    <div id="${entityName}dlg" class="easyui-dialog" style="width:70%;height:70%;padding:10px 20px;"
         closed="true" buttons="#${entityName}dlg-buttons">

<form id="${entityName}Fm" method="post" novalidate>
    <table cellpadding="5">
        <tr style="display: none;">
            <td><input name="id" id="entityId" class="easyui-textbox"/></td>
        </tr>
        <tr>
            <td><label>父权限:</label></td>
            <td>
                <input name="pid" class="easyui-textbox" required="true" style="width: 400px;"/>
            </td>
        </tr>
        <tr>
            <td><label>资源名称:</label></td>
            <td><input name="resourceName" class="easyui-textbox" required="true" style="width: 400px;"></td>
        </tr>
        <tr>
            <td><label>资源图标:</label></td>
            <td>
                <#--<input name="resourceIcon" class="easyui-comobo" required="true" style="width: 400px;">-->
                <select id="cc" name="resourceIcon"  style="width:150px"></select>
                <div id="sp">
                    <div style="color:#99BBE8;background:#fafafa;padding:5px;">请选择图标</div>
                    <div style="padding:10px">
                        <input type="radio" name="lang" value="icon-man"><span class="icon-man">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-add"><span class="icon-add">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-remove"><span class="icon-remove">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-edit"><span class="icon-edit">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-search"><span class="icon-search">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-cancel"><span class="icon-cancel">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-cut"><span class="icon-cut">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-clear"><span class="icon-clear">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-filter"><span class="icon-filter">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-help"><span class="icon-help">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-lock"><span class="icon-lock">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-no"><span class="icon-no">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-ok"><span class="icon-ok">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-print"><span class="icon-print">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-redo"><span class="icon-redo">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-reload"><span class="icon-reload">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-sum"><span class="icon-sum">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-tip"><span class="icon-tip">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-undo"><span class="icon-undo">&nbsp;&nbsp;&nbsp;</span><br/>
                        <input type="radio" name="lang" value="icon-save"><span class="icon-save">&nbsp;&nbsp;&nbsp;</span>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td><label>资源简介:</label></td>
            <td><input name="resourceSummary" class="easyui-textbox" style="width: 400px;" required="true"></td>
        </tr>

        <tr>
            <td><label>资源url:</label></td>
            <td><input name="resourceUrl" class="easyui-textbox" style="width: 400px;" required="true"></td>
        </tr>

        <tr>
            <td><label>排序号:</label></td>
            <td><input name="orderNum" class="easyui-textbox" style="width: 400px;" required="true"></td>
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
<script type="text/javascript">
    $(function(){
        $('#cc').combo({
            required:true,
            editable:false
        });
        $('#sp').appendTo($('#cc').combo('panel'));
        $('#sp input').click(function(){
            var v = $(this).val();
            $('#cc').combo('setValue', v).combo('setText', v).combo('hidePanel');
        });
    });
    function setIcon(value, row, index) {
        return "<span class='"+value+"'>&nbsp;&nbsp;&nbsp;</span>";
    }
</script>
<#include "*/common/script.ftl">


