<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>${lifeTitbit.title}-第七大道官方网站</title>
</head>
<body>
    <!-- 菜单 -->
    <#include "*/common/menu.ftl">

    <!-- 横条 -->
    <#include "*/common/bar.ftl">
    
    <div class="modMain screenCenter">
        <!-- 左边导航 -->
        <div class="leftSideBar f_l">
            <h2 class="t6">
                <#include "*/common/leftTitle.ftl">
            </h2>
            <ul>
                <#if at7roadLeftBar??>
                    <#list at7roadLeftBar as at7road>
                        <li>
                            <a <#if at7road.menuUrl?index_of("titbit")!=-1> class="active" </#if> href="${at7road.menuUrl}">${at7road.menuName}</a>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 右边 -->
        <div class="rightMod f_r">
            <h3>
                <strong>生活花絮</strong>
                <em>Life titbit</em>
            </h3>
            <div class="article" id="article">
                <div class="train">
                    <div class="trainMain">
                        <h3 title="${lifeTitbit.title}">
                            <i class="titleDot"></i>
                            <#if lifeTitbit.title?length gt 36>
                                ${lifeTitbit.title?substring(0,36)}...
                            <#else>
                                ${lifeTitbit.title}
                            </#if>
                        </h3>

                        
                        <div class="titbitBigImg">
                            <#if (lifeTitbit.bigImage!='null')>
                                <img src="${lifeTitbit.bigImage}" />
                            <#elseif (lifeTitbit.smallImage!='null')>
                                <img src="${lifeTitbit.smallImage}" />
                            </#if>
                        </div>

                        <div>
                            ${lifeTitbit.content}
                        </div>
                        <div class="backTitbit">
                            <a href="${serverHost}/at7road/titbit.html">[返回列表]</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div> 

    <!-- 底部 -->
    <#include "*/common/footer.ftl">


</body>
</html>
