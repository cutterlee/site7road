<#include "resource.ftl">
<#import "/spring.ftl" as spring>
<head>
    <title><@spring.message "system.name"/>---站点选择</title>
</head>
<body>
<#if siteList??>

<div class="blank10"></div>
<div class="top-step top-step-first"></div>
<div class="blank15"></div>
<ul class="game-big-select zoom">
    <#list siteList as site>
            <#if (site_index+1)%3==0>
                <li style="border-right: 0;">
                <#else>
                <li>
            </#if>
        <a href="${req.contextPath}/${site.id}/home.html">
            <img src="${req.contextPath}/static/img/${site.siteIcon}" title="${site.siteName}"/></a>

        <div class="zoom">
            <#--<p><strong>${site.gameName}</strong><br/>类型：${site.gameTypeTxt}</p>-->
            <a href="${req.contextPath}/${site.id}/home.html" class="common-a">进入后台</a>
        </div>
        </li>
    </#list>
</ul>
<div class="blank20"></div>


<#--<div id="pdv_10809" class="pdv_class" title="" style="width:365px;height:180px;top:158px;left:610px; z-index:12">-->
    <#--<div id="spdv_10809" class="pdv_content" style="overflow:hidden;width:100%;height:100%">-->
        <#--<div class="pdv_border"-->
             <#--style="border: 0px; height: 180px; padding: 0px; margin: 0px; background: url(${req.contextPath}/static/dm/images/border/777/images/title.jpg) 0px 0px no-repeat;">-->
            <#--<div style="height:44px;border:0px;padding:0;margin:0;background:url(${req.contextPath}/static/dm/images/border/777/images/title.jpg) 0 0 no-repeat">-->
                <#--<div style="float:right;width:39px;height:36px;background:url(${req.contextPath}/static/dm/images/border/777/images/title.jpg) -953px 0px no-repeat;">-->
                    <#--<a href="/dm/dami/index.php?s=/lists/22.html" style="display:inline;font:12px/48px Simsun;"><img-->
                            <#--src="${req.contextPath}/static/dm/images/border/777/images/more.jpg"-->
                            <#--style="border:0px;padding-top:10px;"></a></div>-->
            <#--</div>-->
            <#--<div style="margin:0px;padding:0px">-->

                <#--<link href="${req.contextPath}/static/dm/images/product/templates/css/productlist_diy.css" rel="stylesheet"-->
                      <#--type="text/css">-->
                <#--<script src="${req.contextPath}/static/dm/images/product/js/stepcarousel.js"-->
                        <#--type="text/javascript"></script>-->
                <#--<script type="text/javascript">-->
                    <#--stepcarousel.setup({-->
                        <#--galleryid: 'mygallery', //id of carousel DIV-->
                        <#--beltclass: 'belt', //class of inner "belt" DIV containing all the panel DIVs-->
                        <#--panelclass: 'panel', //class of panel DIVs each holding content-->
                        <#--panelbehavior: {speed: 300, wraparound: false, persist: true},-->
                        <#--autostep: {enable: true, moveby: 3, pause: 10000},-->
                        <#--defaultbuttons: {enable: true, moveby: 3, leftnav: ['${req.contextPath}/static/dm/images/butt-left.gif', 0, 64], rightnav: ['${req.contextPath}/static/dm/images/butt-right.gif', -11, 64]},-->
                        <#--statusvars: ['statusA', 'statusB', 'statusC'], //register 3 variables that contain current panel (start), current panel (last), and total panels-->
                        <#--contenttype: ['inline'], //content setting ['inline'] or ['external', 'path_to_external_file']-->
                        <#--oninit: function () {-->
                            <#--isloaded = true-->
                            <#--document.getElementById('displaycssbelt').style.visibility = "visible";-->
                            <#--document.getElementById('stocklevels').style.visibility = "visible";-->
                        <#--}-->
                    <#--})-->
                <#--</script>-->
                <#--<style type="text/css">-->
                    <#--#mygallery {-->
                        <#--overflow: hidden;-->
                    <#--}-->
                <#--</style>-->
                <#--<!--大米万能标签&ndash;&gt;-->
                <#--<div id="mygallery" class="stepcarousel">-->
                    <#--<div class="belt" id="displaycssbelt" style="width: 720px; visibility: visible; left: 0px;">-->
                        <#--<#list siteList as site>-->
                        <#--<div class="panel productlist_diy" style="float: none; position: absolute; left: 0px;">-->
                            <#--<div class="fang" style="width:100px;height:100px">-->
                                <#--<div class="picFit" style="width:100px;height:100px">-->
                                    <#--<a href="${req.contextPath}/${site.id}/home.html" target="_blank"><img src="${req.contextPath}/${site.siteIcon}" style="width:100px;height:100px" border="0"></a>-->
                                <#--</div>-->
                            <#--</div>-->
                            <#--<div class="title">-->
                                <#--<a href="${req.contextPath}/${site.id}/home.html" class="title">${site.siteName}</a>-->
                            <#--</div>-->
                        <#--</div>-->
                        <#--</#list>-->
                        <#--&lt;#&ndash;<div class="panel productlist_diy" style="float: none; position: absolute; left: 120px;">&ndash;&gt;-->
                            <#--&lt;#&ndash;<div class="fang" style="width:100px;height:100px">&ndash;&gt;-->
                                <#--&lt;#&ndash;<div class="picFit" style="width:100px;height:100px">&ndash;&gt;-->
                                    <#--&lt;#&ndash;<a href="/dm/dami/index.php?s=/articles/131.html" target="_blank"><img&ndash;&gt;-->
                                            <#--&lt;#&ndash;src="/dm/dami/Public/Uploads/thumb/thumb_1416824955.jpg"&ndash;&gt;-->
                                            <#--&lt;#&ndash;style="width:100px;height:100px" border="0"></a>&ndash;&gt;-->
                                <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--&lt;#&ndash;<div class="title">&ndash;&gt;-->
                                <#--&lt;#&ndash;<a href="/dm/dami/index.php?s=/articles/131.html" class="title">CMS幻灯</a>&ndash;&gt;-->
                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                        <#--&lt;#&ndash;</div>&ndash;&gt;-->
                        <#--&lt;#&ndash;<div class="panel productlist_diy" style="float: none; position: absolute; left: 240px;">&ndash;&gt;-->
                            <#--&lt;#&ndash;<div class="fang" style="width:100px;height:100px">&ndash;&gt;-->
                                <#--&lt;#&ndash;<div class="picFit" style="width:100px;height:100px">&ndash;&gt;-->
                                    <#--&lt;#&ndash;<a href="/dm/dami/index.php?s=/articles/130.html" target="_blank"><img&ndash;&gt;-->
                                            <#--&lt;#&ndash;src="/dm/dami/Public/Uploads/thumb/thumb_1416824886.jpg"&ndash;&gt;-->
                                            <#--&lt;#&ndash;style="width:100px;height:100px" border="0"></a>&ndash;&gt;-->
                                <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--&lt;#&ndash;<div class="title">&ndash;&gt;-->
                                <#--&lt;#&ndash;<a href="/dm/dami/index.php?s=/articles/130.html" class="title">CMS</a>&ndash;&gt;-->
                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                        <#--&lt;#&ndash;</div>&ndash;&gt;-->
                        <#--&lt;#&ndash;<div class="panel productlist_diy" style="float: none; position: absolute; left: 360px;">&ndash;&gt;-->
                            <#--&lt;#&ndash;<div class="fang" style="width:100px;height:100px">&ndash;&gt;-->
                                <#--&lt;#&ndash;<div class="picFit" style="width:100px;height:100px">&ndash;&gt;-->
                                    <#--&lt;#&ndash;<a href="/dm/dami/index.php?s=/articles/127.html" target="_blank"><img&ndash;&gt;-->
                                            <#--&lt;#&ndash;src="/dm/dami/Public/Uploads/thumb/thumb_1393218295.jpg"&ndash;&gt;-->
                                            <#--&lt;#&ndash;style="width:100px;height:100px" border="0"></a>&ndash;&gt;-->
                                <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--&lt;#&ndash;<div class="title">&ndash;&gt;-->
                                <#--&lt;#&ndash;<a href="/dm/dami/index.php?s=/articles/127.html" class="title">大米测试产品</a>&ndash;&gt;-->
                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                        <#--&lt;#&ndash;</div>&ndash;&gt;-->
                        <#--&lt;#&ndash;<div class="panel productlist_diy" style="float: none; position: absolute; left: 480px;">&ndash;&gt;-->
                            <#--&lt;#&ndash;<div class="fang" style="width:100px;height:100px">&ndash;&gt;-->
                                <#--&lt;#&ndash;<div class="picFit" style="width:100px;height:100px">&ndash;&gt;-->
                                    <#--&lt;#&ndash;<a href="/dm/dami/index.php?s=/articles/70.html" target="_blank"><img&ndash;&gt;-->
                                            <#--&lt;#&ndash;src="/dm/dami/Public/Uploads/thumb/thumb_1393218295.jpg"&ndash;&gt;-->
                                            <#--&lt;#&ndash;style="width:100px;height:100px" border="0"></a>&ndash;&gt;-->
                                <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--&lt;#&ndash;<div class="title">&ndash;&gt;-->
                                <#--&lt;#&ndash;<a href="/dm/dami/index.php?s=/articles/70.html" class="title">大米手机CMS</a>&ndash;&gt;-->
                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                        <#--&lt;#&ndash;</div>&ndash;&gt;-->
                        <#--&lt;#&ndash;<div class="panel productlist_diy" style="float: none; position: absolute; left: 600px;">&ndash;&gt;-->
                            <#--&lt;#&ndash;<div class="fang" style="width:100px;height:100px">&ndash;&gt;-->
                                <#--&lt;#&ndash;<div class="picFit" style="width:100px;height:100px">&ndash;&gt;-->
                                    <#--&lt;#&ndash;<a href="/dm/dami/index.php?s=/articles/66.html" target="_blank"><img&ndash;&gt;-->
                                            <#--&lt;#&ndash;src="/dm/dami/Public/Uploads/thumb/thumb_1393207060.jpg"&ndash;&gt;-->
                                            <#--&lt;#&ndash;style="width:100px;height:100px" border="0"></a>&ndash;&gt;-->
                                <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                            <#--&lt;#&ndash;<div class="title">&ndash;&gt;-->
                                <#--&lt;#&ndash;<a href="/dm/dami/index.php?s=/articles/66.html" class="title">测试产品</a>&ndash;&gt;-->
                            <#--&lt;#&ndash;</div>&ndash;&gt;-->
                        <#--&lt;#&ndash;</div>&ndash;&gt;-->
                    <#--</div>-->
                <#--</div>-->


            <#--</div>-->
        <#--</div>-->

    <#--</div>-->
<#--</div>-->


</#if>
</body>