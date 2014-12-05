
<!DOCTYPE html>
<html>
<head>
    
<#include "head.ftl">

</head>

<body>
    
    <!-- 菜单 -->
    <#include "menu.ftl">

    <div class="bg-box">
        <div class="center">
            <div class="border-box">
                <h3 class="title-model">
                    <i></i>
                    <span>用户注册</span>
                </h3>
                <div class="register-nav">
                    <ul>
                        <li>
                            <i>!</i>
                            <span>应聘说明</span>
                        </li>
                        <li class="curr">
                            <i>1</i>
                            <span>注册帐户</span>
                        </li>
                        <li>
                            <i>2</i>
                            <span>填写简历</span>
                        </li>
                        <li>
                            <i>3</i>
                            <span>注册成功</span>
                        </li>
                    </ul>
                </div>
                <div class="reg">
                    
                    <table cellpadding="0" cellspacing="0" class="table-box">
                        <tbody>
                            <tr>
                                <td class="w1" valign="top"><span class="red">*</span>手机号码：</td>
                                <td>
                                    <input class="input1 checkRegPhoneNum" type="text" maxlength="11" id="phoneNum" />
                                    <span class="error" id="phoneNumMsg"></span>
                                    <p class="remark">注册成功后将不能修改。</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="w1" valign="top"><span class="red">*</span>图片验证码：</td>
                                <td>
                                    <input class="input1" type="text" maxlength="4" style="width:60px;" id="validCode" />
                                    <img class="img-valid-code" id="imgValidCode" src="${serverHost}/website7road/captcha.do?ver=${version}" height="35" />
                                    <i class="img-valid-code">看不清，换一张</i>
                                    <span class="error" id="validCodeMsg"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="w1" valign="top"></td>
                                <td>
                                    <button type="submit" class="get-phone-verification-code" id="getPhoneVerificationCode" sendCodeType="register">获取短信验证码</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="w1" valign="top"><span class="red">*</span>短信验证码：</td>
                                <td>
                                    <input class="input1" type="text" maxlength="4" id="phoneCode" />
                                    <span class="error" id="phoneCodeMsg"></span>
                                    <p class="remark">手机短信验证码</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="w1" valign="top"><span class="red">*</span>注册密码：</td>
                                <td>
                                    <input class="input1" type="password" maxlength="20" id="password" />
                                    <span class="error" id="passwordMsg"></span>
                                    <p class="remark">6-20个字符组成，区分大小写</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="w1" valign="top"><span class="red">*</span>确认密码：</td>
                                <td>
                                    <input class="input1" type="password" maxlength="20" id="confirmPassword" />
                                    <span class="error" id="confirmPasswordMsg"></span>
                                    <p class="remark">6-20个字符组成，区分大小写</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="w1"></td>
                                <td>
                                    <span class="btn-box" id="regBtn">确 定</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                        
                </div>
                
            </div>
        </div>
    </div>

    <!-- 底部 -->
    <#include "footer.ftl">

</body>
</html>
