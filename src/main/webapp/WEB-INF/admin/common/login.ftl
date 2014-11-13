<!DOCTYPE html>
<#import "/spring.ftl" as spring>
<link rel="stylesheet" id="themeCss" type="text/css" href="${req.contextPath}/static/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${req.contextPath}/static/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${req.contextPath}/static/js/easyui/themes/color.css">
<link rel="stylesheet" id="themeCss" type="text/css" href="${req.contextPath}/static/css/common.css?v=<#if version??>${version}</#if>">
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${req.contextPath}/static/js/jquery.cookie.js"></script>

<head>
    <title>${systemName}---登陆页</title>
    <style>
        body {

            background: url(${req.contextPath}/static/img/bg.jpg) no-repeat center top;
            background-size:1920px 780px;
            font:bold 1em "宋体";
        }

    </style>
</head>
<body>
<div style="position:absolute; left: 50%; top: 200px; margin-left: -150px; width:400px">
<div class="easyui-panel" title="${systemName}-用户登录" style=";padding:10px;">
    <form id="ff" action="${req.contextPath}/home" method="post" >
        <table>
            <tr>
                <td width="100px" height="45px" >用户名:</td>
                <td><input name="username" class="f1 easyui-textbox" style="width:100%;height:40px;" data-options="required:true,iconCls:'icon-man',iconAlign:'right',prompt:'请输入您的用户名'"></input></td>
            </tr>
            <tr>
                <td height="45px" >密码:</td>
                <td><input name="password" class="f1 easyui-textbox" type="password"  style="width:100%;height:40px;" data-options="required:true,iconCls:'icon-lock',iconAlign:'right',prompt:'请输入您的密码'"></input></td>
            </tr>
            <tr>
                <td height="45px" >验证码:</td>
                <td><input name="code" class="f1 easyui-textbox" style="width:50%;height:40px;vertical-align:middle;"   height="40px;" maxlength="4" data-options="iconCls:'icon-edit',iconAlign:'right',prompt:'请输入验证码'"></input>

                    <img src="${req.contextPath}/captchaImage"  style="vertical-align:middle;" width="120px"  height="40px" class="captchaImage" title="点击换图片"/>
                </td>
            </tr>
            <tr>
                <td height="45px"></td>
                <td><input type="checkbox" checked="checked"><span>记住用户名</span></td>
            </tr>
            <tr>
                <td></td>
                <td><button class="easyui-linkbutton"  data-options="iconCls:'icon-ok'"  style="width: 100%;height: 40px;">登陆</button></td>
            </tr>
            <tr>
                <td width="100px;"></td>
                <td style="color: red;">${errorMsg}</td>
            </tr>
        </table>
    </form>
</div>
</div>
<style scoped>
    .f1{
        width:200px;
    }
</style>
<script type="text/javascript">
    $(function(){
        $(".captchaImage").bind("click",function(){
            $(this).attr("src","${req.contextPath}/captchaImage");
        });
    });
</script>
</body>