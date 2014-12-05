
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
        <div class="center">
        <div class="border-box">
            <h3 class="title-model">
                <i></i>
                <span>找回密码</span>
            </h3>
            <table cellpadding="0" cellspacing="0" class="table-box" style="margin-top: 35px;">
                <tbody>
                    <tr>
                        <td class="w1" valign="top"><span class="red">*</span>手机号码：</td>
                        <td>
                            <input class="input3 checkFindPasswordPhoneNum" type="text" maxlength="11" id="phoneNum" />
                            <span class="error" id="phoneNumMsg">请输入手机号码</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="w1" valign="top"><span class="red">*</span>图片验证码：</td>
                        <td>
                            <input class="input3" type="text" maxlength="4" style="width:83px;" id="validCode" />
                            <img class="img-valid-code" id="imgValidCode" src="${serverHost}/website7road/captcha.do?ver=${version}" height="35">
                            <i class="img-valid-code">看不清，换一张</i>
                            <span class="error" id="validCodeMsg"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="w1"></td>
                        <td>
                            <button type="submit" class="get-phone-verification-code" id="getPhoneVerificationCode" sendCodeType="findPass">获取短信验证码</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="w1" valign="top"><span class="red">*</span>短信验证码：</td>
                        <td>
                            <input class="input3" type="text" maxlength="4" style="width:83px;" id="phoneCode" />
                            <span class="error" id="phoneCodeMsg">请输入短信验证码</span>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="w"></td>
                        <td>
                            <span class="btn-box" id="getPasswordBtn">提 交</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        </div>
    </div>

    <!-- 底部 -->
    <#include "footer.ftl">
 
</body>
</html>
