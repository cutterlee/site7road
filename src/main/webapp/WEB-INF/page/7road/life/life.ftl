<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>七道生活-第七大道官方网站</title>
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
                            <a <#if at7road.menuUrl?index_of("life")!=-1> class="active" </#if> href="${at7road.menuUrl}">${at7road.menuName}</a>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 右边 -->
        <div class="rightMod f_r">
            <h3>
                <strong>七道生活</strong>
                <em>Life</em>
            </h3>
            <div class="article">
                <div class="life">
                    <ul>
                        <#if life??>
                            <#list life as data>
                                <li>
                                    <h2>
                                        <i><#if data_index lt 9>0</#if>${data_index+1}.</i>
                                        <#if data.title?length gt 36>
                                            ${data.title?substring(0,36)}...
                                        <#else>
                                            ${data.title}
                                        </#if>
                                    </h2>
                                    <div class="lifePic">
                                        <#if (data.bigImage!='null')>
                                            <img src="${data.bigImage}" />
                                        <#elseif (data.smallImage!='null')>
                                            <img src="${data.smallImage}" />
                                        </#if>
                                    </div>
                                    <div class="lifeIntroduce">
                                        ${data.content}
                                    </div>
                                </li>
                            </#list>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 底部 -->
    <#include "*/common/footer.ftl">

</body>
</html>
