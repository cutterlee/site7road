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

            background: url(http://qzs.qq.com/qzone/v6/v6_config/upload/cf943b00b6e55a43d5b7297282f198ba.jpg) no-repeat center top;
        }

    </style>
</head>
<body>
<div style="position:absolute; left: 50%; top: 200px; margin-left: -150px; width:400px">
<div class="easyui-panel" title="${systemName}-用户登录" style=";padding:10px;">
    <form id="ff" action="${req.contextPath}/home" method="post" >
        <table>
            <tr>
                <td>用户名:</td>
                <td><input name="username" class="f1 easyui-textbox" data-options="required:true,iconCls:'icon-man',iconAlign:'left'"></input></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input name="password" class="f1 easyui-textbox" type="password" data-options="required:true,iconCls:'icon-lock',iconAlign:'left'"></input></td>
            </tr>
            <tr>
                <td>验证码:</td>
                <td><input name="code" class="f1 easyui-textbox" style="width: 60px" maxlength="4" data-options="required:true">
                    <img src="${req.contextPath}/captchaImage" width="120px" height="40px" class="captchaImage" title="点击换图片"/>
                </input></td>
            </tr>
            <tr>
                <td></td>
                <td><button class="easyui-linkbutton"  data-options="iconCls:'icon-ok'"  style="width: 200px;height: 32px;">登陆</button></td>
            </tr>
            <tr>
                <td colspan="2">${errorMsg}</td>
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