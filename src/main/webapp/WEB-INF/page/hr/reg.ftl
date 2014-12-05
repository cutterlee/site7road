
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
                        <li class="curr">
                            <i>!</i>
                            <span>应聘说明</span>
                        </li>
                        <li>
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
                <div class="register-notes">
                    <h3>应聘说明</h3>
                    <p>手机号码是您登录本站的凭证，也是您忘记密码时、取回密码的唯一途径；</p>
                    <p>简历信息可在您注册成功后再进行补充。</p>
                </div>
                <div class="agree-btn">
                    <a class="btn-box" href="${HrServerHost}/center/reg1.html">确定，并开始注册</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 底部 -->
    <#include "footer.ftl">
 
</body>
</html>
