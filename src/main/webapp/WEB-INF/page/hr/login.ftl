
<!DOCTYPE html>
<html>
<head>
    
<#include "head.ftl">

</head>

<body>
    
    <!-- 菜单 -->
    <#include "menu.ftl">

    <!--登录-->
    <div class="bg-box">
        <div class="login">
            <h3 class="title-model">
                <i></i>
                <span>用户登录</span>
            </h3>
            <table cellpadding="0" cellspacing="0" class="table-box" style="margin-top: 15px;">
                <tbody>
                    <tr>
                        <td class="w" valign="top"><span class="red">*</span>手机号码：</td>
                        <td>
                            <input class="input3" type="text" maxlength="11" id="loginPhoneNum" />
                            <a href="${HrServerHost}/center/reg.html">注册新用户</a>
                            <p class="login-error" id="loginPhoneNumMsg">请输入11位手机号码</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="w" valign="top"><span class="red">*</span>登录密码：</td>
                        <td>
                            <input class="input3" type="password" maxlength="20" id="loginPassword" />
                            <a href="${HrServerHost}/center/findPassword.html">忘记密码</a>
                            <p class="login-error" id="loginPasswordMsg">请输入密码</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="w"></td>
                        <td>
                            <span class="btn-box" id="loginBtn">登 录</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    

    <!-- 底部 -->
    <#include "footer.ftl">
 
</body>
</html>
