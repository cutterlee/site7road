<!DOCTYPE html>
<#import "/spring.ftl" as spring>
<#include "resource.ftl">
<head>
    <title><@spring.message "system.name"/>---<@spring.message "login.title"/></title>
    <style>
        body {
            background: url(${req.contextPath}/static/img/bg.jpg) no-repeat center top;
            background-size: 1920px 780px;
            font: bold 1em "宋体";
        }
    </style>
</head>
<body class="loginBody">
    <div class="loginTop">
        <div class="easyui-panel" title="<@spring.message 'system.name'/>-<@spring.message 'login.title'/>" style=";padding:10px;">
            <form id="ff" class="easyui-form" method="post" action="${req.contextPath}/login">
                <table>
                    <tr>
                        <td width="100px" height="45px"><@spring.message "login.username"/>:</td>
                        <td width="250px">
                            <input name="username" class="f1 easyui-textbox" style="width:100%;height:40px;"
                                   validType="length[8,20]" value="<#if username??>${username}</#if>"
                                   data-options='required:true,prompt:"<@spring.message 'username.prompt'/>"'></input>
                        </td>
                    </tr>
                    <tr>
                        <td height="45px"><@spring.message "login.password"/>:</td>
                        <td>
                            <input name="password" class="f1 easyui-textbox" type="password" validType="length[8,20]"
                                   style="width:100%;height:40px;" value="abcabcabc"
                                   data-options='required:true,prompt:"<@spring.message 'password.prompt'/>"'></input>
                        </td>
                    </tr>
                    <tr>
                        <td height="45px"><@spring.message "login.verifyCode"/>:</td>
                        <td>

                            <input name="verifyCode" class="easyui-textbox easyui-tooltip" id="verifyCodeText"
                                   style="width:40%;height:40px;vertical-align:middle;" required="true" height="40px;"
                                   validType="mixLength[4]"
                                   data-options="prompt:'<@spring.message "verifyCode.prompt"/>',position:'top'"></input>
                        </td>
                    </tr>
                    <tr>
                        <td height="45px"></td>
                        <td>
                            <img src="${req.contextPath}/captchaImage" style="vertical-align:middle;" width="120px" height="40px" class="captchaImage" title="<@spring.message 'image.title'/>"/>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td height="45px"></td>
                        <td >
                            <input type="checkbox" checked="checked" name="rememberMe"><span><@spring.message "login.remember.me"/></span>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a class="easyui-linkbutton loginButton" data-options="iconCls:'icon-ok'"
                               style="width: 100%;height: 40px; display:block"><@spring.message "login.name"/></a>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px;"></td>
                        <td style="color: red;" id="errorMsg"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

<script type="text/javascript">
    $(function () {
        $(".captchaImage").bind("click", function () {
            $(this).attr("src", "${req.contextPath}/captchaImage");
        });
        $(".loginButton").bind("click", login);
        $("#verifyCodeText").textbox('textbox').bind('keydown', function(e){
            if (e.keyCode == 13){	// when press ENTER key, accept the inputed value.
                $("#verifyCodeText").textbox('setValue', $(this).val());
                login();
            }
        });
    });
    function login() {
        $(".loginButton").unbind("click", login);
        var validate = $("#ff").form('validate');
        if (validate) {
            $("#ff").form("submit", {
                success: function (data) {
                    var result = $.parseJSON(data);
                    if (result.success) {
                        window.location.href = '${req.contextPath}/home.html';
                    } else {
                        $("#errorMsg").empty().html(result.errorMsg);
                    }
                }
            });
        }
        $(".loginButton").bind("click", login);
    }

</script>
</body>