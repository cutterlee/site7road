<!DOCTYPE html>
<html>
<head>
    <title>easy-ui的form控件熟悉</title>
<#include "../common/resource.ftl">
</head>
<body>
        <a href="#" class="easyui-linkbutton c1">提交</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">提交</a>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-ok'">提交</a>

<hr>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-large-chart',size:'large',iconAlign:'bottom'">提交</a>
        <a href="#" class="easyui-linkbutton c2">提交</a>
        <a href="#" class="easyui-linkbutton c3">提交</a>
        <a href="#" class="easyui-linkbutton c4">提交</a>
        <a href="#" class="easyui-linkbutton c5">提交</a>
        <a href="#" class="easyui-linkbutton c6">提交</a>
        <a href="#" class="easyui-linkbutton c7">提交</a>
        <a href="#" class="easyui-linkbutton c8">提交</a>

<hr>


<div>

    <a href="#" class="easyui-menubutton" data-options="menu:'#mm1',iconCls:'icon-add'">编辑</a>

</div>

<div id="mm1">
    <div data-options="iconCls:'icon-add'">增加</div>
    <div data-options="iconCls:'icon-edit'">修改</div>
    <div data-options="iconCls:'icon-search'">查询</div>
    <div data-options="iconCls:'icon-remove'">删除</div>
    <div>
        <span>Toolbar</span>
        <div>
            <div>Address</div>
            <div>Link</div>
            <div>Navigation Toolbar</div>
            <div>Bookmark Toolbar</div>
            <div class="menu-sep"></div>
            <div>New Toolbar...</div>
        </div>
    </div>
</div>


</body>
</html>
