
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
                        <li>
                            <i>1</i>
                            <span>注册帐户</span>
                        </li>
                        <li>
                            <i>2</i>
                            <span>填写简历</span>
                        </li>
                        <li class="curr">
                            <i>3</i>
                            <span>注册成功</span>
                        </li>
                    </ul>
                </div>
                <div class="reg">
                    <p class="success-reg"><span>您已注册成功，感谢您对第七大道的关注！</span></p>
                    <p class="back-user-center"><a class="btn-box" href="${HrServerHost}/center/resume.html">返回用户中心</a></p>
                </div>
                
            </div>
        </div>
    </div>

    <!-- 底部 -->
    <#include "footer.ftl">
  
</body>
</html>
