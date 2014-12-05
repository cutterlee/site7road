<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>合作伙伴-第七大道官方网站</title>
</head>
<body>
    <!-- 菜单 -->
    <#include "*/common/menu.ftl">

    <!-- 横条 -->
    <#include "*/common/bar.ftl">
    
    <div class="modMain screenCenter">
        <!-- 左边导航 -->
        <div class="leftSideBar f_l">
            <h2 class="t4">
                <#include "*/common/leftTitle.ftl">
            </h2>
            <ul>
                <#if cooperationLeftBar??>
                    <#list cooperationLeftBar as menu>
                        <li>
                            <a <#if menu.menuUrl?index_of("partners")!=-1> class="active" </#if> href="${menu.menuUrl}">${menu.menuName}</a>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 右边 -->
        <div class="rightMod f_r">
            <h3>
                <strong>合作伙伴</strong>
                <em>Partners</em>
            </h3>
            <div class="article">
                <#if regionList??>
                    <#list regionList as data>
                        <#if data.children??>
                            <#if data.children?? && data.children?size gt 0 >
                                <div class="partners">
                                    <h3><i></i>${data.regionName}</h3>
                                    <ul>
                                        <#if data.children??>
                                            <#list data.children as agent>
                                                <li>
                                                    <a title="${agent.agentName}" target="_blank"><img src="${agent.agentImg}"/></a>
                                                </li>
                                            </#list>
                                        </#if>
                                    </ul>
                                </div>
                            </#if>
                        </#if>
                    </#list>
                </#if>
            </div>
        </div>
    </div>

    <!-- 底部 -->
    <#include "*/common/footer.ftl">
    
</body>
</html>
