<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>${recruit.positionName}-第七大道官方网站</title>
</head>
<body>
    <!-- 菜单 -->
    <#include "*/common/menu.ftl">

    <!-- 横条 -->
    <#include "*/common/bar.ftl">
    
    <div class="modMain screenCenter">
        <!-- 左边导航 -->
        <div class="leftSideBar f_l">
            <h2 class="t3">
                <#include "*/common/leftTitle.ftl">
            </h2>
            <ul>
                <#if recruitLeftBar??>
                    <#list recruitLeftBar as menu >
                        <li>
                            <a href="${menu.menuUrl}">${menu.menuName}</a>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 右边 -->
        <div class="rightMod f_r">
            <h3>
                <strong>招贤纳士</strong>
                <em>Join us</em>
            </h3>
            <div class="article">
                <div class="recruitmentDetail">
                    <h2>${recruit.positionPlace} - ${recruit.positionName}</h2>
                    <div class="recruitmentBox">
                        <span>工作地点：</span>
                        <span class="recruitmentAddress">${recruit.positionPlace}</span>
                        <span>招聘人数：</span>
                        <span class="recruitmentNum">${recruit.positionNeedNum}</span>
                        <span>职位性质：</span>
                        <span class="recruitmentindustry">${recruit.positionProperty}</span>
                    </div>
                    <#if recruit.positionDuty?? && recruit.positionDuty?length gt 0>
                        <h3>工作职责：</h3>
                        <div class="recruitmentBox">${recruit.positionDuty}</div>
                    </#if>
                    <#if recruit.positionRequirement?? && recruit.positionRequirement?length gt 0>
                        <h3>职位要求：</h3>
                        <div class="recruitmentBox">${recruit.positionRequirement}</div>
                    </#if>
                    <div class="recruitmentBox">
                        <p class="red">招聘邮箱：<a class="red" href="mailto:hr@7road.com">hr@7road.com</a></p>
                        <p class="recruitmentEmail">
                            <a href="mailto:hr@7road.com">发送简历</a>
                        </p>
                    </div>
                </div>
                
            </div>
        </div>

    </div> 

    <!-- 底部 -->
    <#include "*/common/footer.ftl">

    <script type="text/javascript">
        if(document.location.pathname.indexOf("/recruit/page/") > -1 ){
            var li = $(".leftSideBar ul li");
            for(var i=0;i<li.length;i++){
                if(li.eq(i).find("a").text() == "招贤纳士"){
                    li.eq(i).find("a").addClass("active");
                }
            }
        }
    </script>

</body>
</html>
