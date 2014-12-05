<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>工作环境-第七大道官方网站</title>
<link rel="stylesheet" href="${staticHost}/css/pic.css" type="text/css" />
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
                            <a <#if at7road.menuUrl?index_of("environment")!=-1>class="active"</#if> href="${at7road.menuUrl}">${at7road.menuName}</a>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 右边 -->
        <div class="rightMod f_r">
            <h3>
                <strong>工作环境</strong>
                <em>Environment</em>
            </h3>
            <div class="article">
                <div class="move-pic">
                    <div class="pic-next-s pngie6"></div>
                    <div class="pic-prev-s pngie6"></div>
                    <div class="pic-wrap"><div class="pic-main"></div></div>
                    <div class="pic-controls"></div>
                    <div class="pic-nav">
                        <div class="pic-thumbs">
                            <ul class="pic-thumb-list">
                                <#if environmentList??>
                                    <#list environmentList as data>
                                        <li>
                                            <a href="${data.bigImage!data.smallImage}">
                                                <img src="${data.bigImage!data.smallImage}" title="${data.title!''}" alt="${data.content!''}" />
                                            </a>
                                        </li>
                                    </#list>
                                </#if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 底部 -->
    <#include "*/common/footer.ftl">

    <script type="text/javascript" src="${staticHost}/js/pic.js"></script>
    <script type="text/javascript">
        $(function(){
            $('.move-pic').movePic();
        });
    </script>
    
</body>
</html>
