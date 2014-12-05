<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>培训发展-第七大道官方网站</title>
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
                            <a <#if at7road.menuUrl?index_of("trainDevelopment")!=-1> class="active" </#if> href="${at7road.menuUrl}">${at7road.menuName}</a>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 右边 -->
        <div class="rightMod f_r">
            <h3>
                <strong>培训发展</strong>
                <em>Train and development</em>
            </h3>
            <div class="article">
                <#if trainDevelopmentList??>
                    <#list trainDevelopmentList as data>
                        <div class="train trainTop">
                            <h3>
                                <#if data_index gt 0>
                                    <i class="titleDot"></i>
                                </#if> 

                                <#if data.title?length gt 36>
                                    ${data.title?substring(0,36)}...
                                <#else>
                                    ${data.title}
                                </#if>
                            </h3>
                            <div class="trainMain">
                                ${data.content} 
                            </div>
                        </div>
                    </#list>
                </#if>
            </div>
        </div>

    </div> 

    <!-- 底部 -->
    <#include "*/common/footer.ftl">

</body>
</html>
