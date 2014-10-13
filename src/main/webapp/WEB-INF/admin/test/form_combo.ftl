<!DOCTYPE html>
<html>
<head>
    <title>easy-ui的form控件熟悉</title>
<#include "../common/resource.ftl">
</head>
<body>
静态的combobox:
<select class="easyui-combobox">
    <option value="man">男</option>
    <option value="woman">女</option>
</select>

<hr>
combobox:
<input class="easyui-combobox" data-options="url:'${req.contextPath}/combo/gender',valueField:'id',textField:'name',panelHeight:'auto'">

<hr>
comboGrid:
<input class="easyui-combogrid" style="width: 60%"
       data-options="url:'${req.contextPath}/auth/list',valueField:'id',textField:'resourceName',fitColumns: true,
columns: [[
                {field:'id',title:'id',width:80},
                {field:'resourceName',title:'resourceName',width:120},
                {field:'resourceIcon',title:'resourceIcon',width:80,align:'right'},
                {field:'resourceUrl',title:'resourceUrl',width:80,align:'right'},
                {field:'resourceSummary',title:'resourceSummary',width:200}
            ]],
">

<hr>
comboTree:
<input class="easyui-combotree" data-options="url:'${req.contextPath}/role/authTree',method:'get',required:true" style="width:200px;">



</body>
<script type="text/javascript">



</script>
</html>
