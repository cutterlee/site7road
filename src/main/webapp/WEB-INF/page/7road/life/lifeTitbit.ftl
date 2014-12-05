<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>生活花絮-第七大道官方网站</title>
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
                    <#if lifeTitbitList??>
                        <#list lifeTitbitList as data>
                            <div class="titbit">
                                <h3>
                                    <i class="titleDot"></i>
                                    <a href="${serverHost}/at7road/titbit/${data.id}.html" title="${data.title}">
                                        <#if data.title?length gt 36>
                                            ${data.title?substring(0,36)}...
                                        <#else>
                                            ${data.title}
                                        </#if>
                                    </a>
                                </h3>
                                
                                <div class="titbitBigImg">
                                    <#if (data.bigImage!='null')>
                                        <img src="${data.bigImage}" />
                                    <#elseif (data.smallImage!='null')>
                                        <img src="${data.smallImage}" />
                                    </#if>
                                </div>
                                
                                <div>
                                    <#if data.contentSummary??>
                                        <#if data.contentSummary?length gt 160>
                                            ${data.contentSummary?substring(0,160)}...
                                        <#else>
                                            ${data.contentSummary}
                                        </#if>
                                    </#if>
                                    
                                </div>
                                <div class="lifeTitbitDetail">
                                    <a class="f_r" href="${serverHost}/at7road/titbit/${data.id}.html">[阅读全文]</a>
                                </div>
                            </div>
                        </#list>
                    </#if>
                </div>
            </div>
        </div>

    </div> 

    <!-- 底部 -->
    <#include "*/common/footer.ftl">


</body>
</html>
