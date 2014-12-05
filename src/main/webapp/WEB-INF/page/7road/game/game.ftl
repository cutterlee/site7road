<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>${game.gameTitle}-第七大道官方网站</title>
<style type="text/css">
.leftSideBar ul li a{font-size:12px;background-position:23px -106px;}
.leftSideBar ul li a.active,.leftSideBar ul li a:hover{background-position:23px -162px;}
</style>
</head>
<body>
    <!-- 菜单 -->
    <#include "*/common/menu.ftl">

    <!-- 横条 -->
    <#include "*/common/bar.ftl">
    
    <div class="modMain screenCenter">
        <!-- 左边导航 -->
        <div class="leftSideBar f_l">
            <h2 class="t2">
                <#include "*/common/leftTitle.ftl">
            </h2>
            <ul>
                <#if game_list_type??>
                    <#list game_list_type as data>
                        <li>
                            <span>${data.gameTypeName}</span>
                            <#if data.childrenGameList??>
                                <#list data.childrenGameList as product>
                                    <a <#if product.gameHtmlName==game.gameHtmlName>class="active"</#if> href="${serverHost}/gameProduct/${product.gameHtmlName}.html">${product.gameName}</a>
                                </#list>
                            </#if>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 右边 -->
        <div class="rightMod f_r">
            <h3>
                <strong>${game.gameName}</strong>
                <em>${module.englishName}</em>
            </h3>
            <div class="article">
                <div class="allGame gameDetail">
                    <ul>
                        <li>
                            <h2><em></em>${game.gameTitle}</h2>
                            <div class="gamePic">
                                <a href="${game.gamePlayUrl}" target="_blank">
                                    <img src="${game.gameImgShowInProduct}" alt="${game.gameName}" />
                                </a>
                            </div>
                            <div class="introduction">
                                <div class="introductionSmall">${game.gameShortDesc}</div>
                                <div class="linkBtn">
                                    <a class="detailBtn" href="${game.gameWebsiteUrl}" target="_blank">了解详情</a>
                                    <a class="startGameBtn" href="${game.gamePlayUrl}" target="_blank">开始游戏</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <h2><em></em>${game.gameName}</h2>
                            <div class="gameIntroduce">${game.gameDetailDesc}</div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div> 
    <div class="blank"></div>

    <!-- 底部 -->
    <#include "*/common/footer.ftl">
    <script type="text/javascript">
    $(function(){
        $(".active").siblings("span").addClass("current").parent().siblings().children("a").hide();
        $(".leftSideBar ul li span").live("click",function(){
            if($(this).next().attr("href")){
                document.location.href = $(this).next().attr("href");
            } 
        });
    });
    </script>

</body>
</html>
