
<!DOCTYPE html>
<html>
<head>
    
<#include "head.ftl">

</head>

<body>
    
    <!-- 菜单 -->
    <#include "menu.ftl">

    <div class="bg-box">
        <div class="user-center">
            <div class="user-left">
                <h3 class="title-model">
                    <i></i>
                    <span>用户中心</span>
                </h3>
                <ul class="user-left-nav">
                    <li><a href="${HrServerHost}/center/resume.html">我的简历</a></li>
                    <li><a href="${HrServerHost}/center/applyRecord.html">职位申请记录</a></li>
                    <li><a href="javascript:;" class="curr">修改密码</a></li>
                    <li><a href="${HrServerHost}/center/collectRecord.html">已收藏职位</a></li>
                </ul>
            </div>
            <div class="user-right">
                <h3 class="title-model">
                    <i></i>
                    <span>修改密码</span>
                </h3>
                
                <div class="modify-password">
                    <table cellpadding="0" cellspacing="0" class="table-box">
                        <tbody>
                            <tr>
                                <td class="w2"><span class="red">*</span>手机号码：</td>
                                <td>
                                    <input class="input3 gray-bg" type="text" maxlength="11" id="resetPhoneNum" disabled="disabled">
                                    <span class="error" id="resetPhoneNumMsg"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="w2"><span class="red">*</span>当前密码：</td>
                                <td>
                                    <input class="input3" type="password" maxlength="20" id="resetPassword">
                                    <span class="error" id="resetPasswordMsg"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="w2" style="padding:13px 0 0;" valign="top"><span class="red">*</span>新密码：</td>
                                <td>
                                    <input class="input3" type="password" maxlength="20" id="resetNewPassword">
                                    <span class="error" id="resetNewPasswordMsg"></span>
                                    <p class="remark" style="font-size:12px;">6-20个字符组成，区分大小写</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="w2"><span class="red">*</span>确认新密码：</td>
                                <td>
                                    <input class="input3" type="password" maxlength="20" id="resetConfirmNewPassword">
                                    <span class="error" id="resetConfirmNewPasswordMsg"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="w2"></td>
                                <td>
                                    <span class="btn-box" id="resetPasswordBtn">保 存</span>
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
