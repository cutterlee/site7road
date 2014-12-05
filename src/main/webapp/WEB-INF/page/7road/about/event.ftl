<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>公司大事件-第七大道官方网站</title>
</head>
<body>
    <!-- 菜单 -->
    <#include "*/common/menu.ftl">

    <!-- 横条 -->
    <#include "*/common/bar.ftl">
    
    <div class="modMain screenCenter">
        <!-- 左边导航 -->
        <div class="leftSideBar f_l">
            <h2 class="t1">
                <#include "*/common/leftTitle.ftl">
            </h2>
            <ul>
                <#if aboutUsLeftMenu??>
                    <#list aboutUsLeftMenu as menu>
                        <li>
                            <a <#if menu.menuUrl?index_of("event")!=-1> class="active" </#if> href="${menu.menuUrl}">${menu.menuName}</a>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 右边 -->
        <div class="rightMod f_r">
            <h3>
                <strong>公司大事件</strong>
                <em>Event</em>
            </h3>
            <div class="article eventWrap">
                <div class="eventNav">
                    <span></span>
                    <a class="on" href="javascript:;">全部大事件</a>
                    <#if yearSet??>
                        <#list yearSet as data>
                            <a href="javascript:;">${data?c}年</a>
                        </#list>
                    </#if>
                </div>
                <div class="eventList">
                    <#include "eventBox.ftl">
                </div>
            </div>
        </div>
        
    </div> 
    <div class="blank"></div>

    <!-- 底部 -->
    <#include "*/common/footer.ftl">


    <script type="text/javascript">

    var eventIndex = getUrlParam("eventIndex");
    $(".eventList ul li").removeClass("curr").eq(eventIndex).addClass("curr");

    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }

    </script>

</body>
</html>
