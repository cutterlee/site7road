<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>游戏产品-第七大道官方网站</title>
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
                        <li <#if data_index gt 0>class="hide"</#if> >
                            <span <#if data_index == 0>class="current"</#if> >${data.gameTypeName}</span>
                            <#if data.childrenGameList??>
                                <#list data.childrenGameList as game>
                                    <a href="${serverHost}/gameProduct/${game.gameHtmlName}.html">${game.gameName}</a>
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
                <strong>${module.text}</strong>
                <em>${module.englishName}</em>
            </h3>
            <div class="article">
                <div class="allGame">
                    <ul>
                        <#if gameList??>
                            <#list gameList as data>
                                <li <#if !data_has_next>class="noborder"</#if>>
                                    <h2><i><#if data_index lt 9>0</#if>${data_index+1}.</i>${data.gameName}</h2>
                                    <div class="gamePic">
                                        <a href="${serverHost}/gameProduct/${data.gameHtmlName}.html">
                                            <img src="${data.gameImgShowInProduct}" alt="${data.gameName}" />
                                        </a>
                                    </div>
                                    <div class="introduction">
                                        <div class="introductionSmall">
                                            ${data.gameShortDesc}
                                        </div>
                                        <div class="linkBtn">
                                            <a class="detailBtn" href="${serverHost}/gameProduct/${data.gameHtmlName}.html">了解详情</a>
                                            <!--${data.gameWebsiteUrl}-->
                                            <a class="startGameBtn" href="${data.gamePlayUrl}" target="_blank">开始游戏</a>
                                        </div>
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
<script>
	$(document).ready(function(){
		$.each($(".introductionSmall"),function(i,n){
			if($(n).find("span").text().length>137){
				var _st = $(n).find("span").text().substring(0,136)+"......";
				$(n).find("span").text(_st);
			}else if($(n).find("p").text().length>137){
                var _st = $(n).find("p").text().substring(0,136)+"......";
                $(n).find("p").text(_st);
            }
		});

        $(".leftSideBar ul li span").live("click",function(){
            if($(this).siblings().is(":hidden")){
                $(this).addClass("current").parent().siblings().find("span").removeClass("current");
                $(this).siblings().show().parent().siblings().find("a").hide();
            }else{
                $(this).removeClass("current").parent().siblings().find("span").addClass("current");
                $(this).siblings().hide().parent().siblings().find("a").show();
            }
        });
	});
</script>
</html>
