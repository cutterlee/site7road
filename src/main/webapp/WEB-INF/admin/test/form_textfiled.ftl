<!DOCTYPE html>
<html>
<head>
    <title>easy-ui的form控件熟悉</title>
<#include "../common/resource.ftl">
</head>
<body>
<div class="easyui-panel" title="登陆表单" style="width: 600px;text-align: ">

    <h1>textbox</h1>
    <div style="margin-bottom:20px">
        用户名:
        <input class="easyui-textbox" style="width: 300px;height:32px;" data-options="prompt:'请输入用户名',iconCls:'icon-man',iconAlign:'left',iconWidth:40,buttonText:'检测用户名',buttonIcon:'icon-search'">
    </div>
    <div style="margin-bottom:20px">
        密  码:
        <input class="easyui-textbox" style="width: 300px;height:32px;" data-options="prompt:'请输入密码',iconCls:'icon-lock',iconWidth:40">
    </div>
    <div style="margin-bottom:20px">
        <input type="checkbox" checked="checked">
        <span>记住我</span>
    </div>

    <div style="margin-bottom: 20px">
        日收入:
        <input class="easyui-numberbox" data-options="precision:2,groupSeparator:',',decimalSeparator:'.',prefix:'$', min:100 ,max:1000 ">
    </div>

    <div style="margin-bottom:20px">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="height: 40px;width: 300px;"><span>登陆</span></a>
    </div>
<br>
</div>

<div style="margin-bottom:20px">
    自我介绍:
    <input class="easyui-textbox" data-options="multiline:true" style="width: 300px;height: 100px;" value="hello">
</div>

</body>
</html>
