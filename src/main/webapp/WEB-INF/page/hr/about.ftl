
<!DOCTYPE html>
<html>
<head>
    
<#include "head.ftl">

</head>

<body id="top0">
    
    <!-- 菜单 -->
    <#include "menu.ftl">

    <div class="about-nav">
        <div class="center about-center">
            <a class="nav01" href="javascript:;">
                <div class="front"><img src="${imageHost}/hr/about/i01.jpg"></div>
                <div class="back"><img src="${imageHost}/hr/about/i01.jpg"></div>
            </a>
            <a class="nav02" href="javascript:;">
                <div class="front"><img src="${imageHost}/hr/about/i02.jpg"></div>
                <div class="back"><img src="${imageHost}/hr/about/i02.jpg"></div>
            </a>
            <a class="nav03" href="javascript:;">
                <div class="front"><img src="${imageHost}/hr/about/i03.jpg"></div>
                <div class="back"><img src="${imageHost}/hr/about/i03.jpg"></div>
            </a>
            <a class="nav04" href="javascript:;">
                <div class="front"><img src="${imageHost}/hr/about/i04.jpg"></div>
                <div class="back"><img src="${imageHost}/hr/about/i04.jpg"></div>
            </a>
            <a class="nav05" href="javascript:;">
                <div class="front"><img src="${imageHost}/hr/about/i05.jpg"></div>
                <div class="back"><img src="${imageHost}/hr/about/i05.jpg"></div>
            </a>
            <a class="nav06" href="javascript:;">
                <div class="front"><img src="${imageHost}/hr/about/i06.jpg"></div>
                <div class="back"><img src="${imageHost}/hr/about/i09.jpg"></div>
            </a>
            <a class="nav07" href="javascript:;">
                <div class="front"><img src="${imageHost}/hr/about/i07.jpg"></div>
                <div class="back"><img src="${imageHost}/hr/about/i10.jpg"></div>
            </a>
            <a class="nav08" href="javascript:;">
                <div class="front"><img src="${imageHost}/hr/about/i08.jpg"></div>
                <div class="back"><img src="${imageHost}/hr/about/i08.jpg"></div>
            </a>
            <a class="nav09" href="javascript:;">
                <div class="front"><img src="${imageHost}/hr/about/i09.jpg"></div>
                <div class="back"><img src="${imageHost}/hr/about/i06.jpg"></div>
            </a>
            <a class="nav10" href="javascript:;">
                <div class="front"><img src="${imageHost}/hr/about/i10.jpg"></div>
                <div class="back"><img src="${imageHost}/hr/about/i07.jpg"></div>
            </a>
        </div>
    </div>

    <div class="introduction" id="top1">
        <div class="center">
            <div class="introduction-title title-case">
                <h2>公司简介</h2>
                <h3>COMPANY INTRODUCTION</h3>
            </div>
            <div class="introduction-detail">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;深圳第七大道科技有限公司是一家立足于深圳发展起来的高成长、高科技、高附加值的游戏公司。公司由将近1000个年轻人构成，其中本科（含）以上学历占75%，平均年龄不到26岁，是一个充满激情活力和爆发力的团队。<br>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在六年发展中，第七大道始终以用户体验为依据，致力于多款高品质、精细化的数字娱乐产品的开发和运营。三款页游产品《弹弹堂》、《神曲》、《海神》见证了中国页游的萌芽到兴起，缔造了国内页游史上难以逾越的成绩。现三款产品已在内地，港澳台运营。其中，《弹弹堂》、《神曲》曾先后成为国内收入最高的网页游戏，并在全球市场获得令人瞩目的成绩，出口覆盖马来西亚、越南、泰国、美国、英国、巴西、土耳其、韩国、日本等全球140多个国家和地区。作为中国文化企业出口全球的典范，中共中央政治局常委李长春在参观考察中亦给予了高度评价。
            </div>
        </div>
        <div class="event" id="top2">
            <div class="center">
                <div class="time-title">
                    <h2>七道游戏六年</h2>
                    <h3>SEVEN GAMES FOR SIX YEARS</h3>
                    <h4 class="pngie6"></h4>
                    <h5>years</h5>
                </div>
                <div class="prev-btn pngie6"></div>
                <div class="next-btn pngie6"></div>
                <div class="event-list">
                    <ul>
                        <#if eventList??>
                            <#list eventList as data>
                                <li class="<#if data_index = 0>curr</#if>" >
                                    <h2>${data.publishTime?string("yyyy")}</h2>
                                    <h3>${data.publishTime?string("MM")}月</h3>
                                    <p title="${data.title}">
                                        <#if data.title?length gt 18>
                                            ${data.title?substring(0,16)}...
                                        <#else>
                                            ${data.title}
                                        </#if>
                                    </p>
                                </li>
                            </#list>
                        </#if>
                    </ul>
                </div>
                <div class="event-pic">
                    <#if eventList??>
                        <#list eventList as data>
                            <#if data.eventImgInHrPage??>
                                <p class="<#if data_index = 0>curr</#if>"><img class="pngie6" src="${data.eventImgInHrPage}" /></p>
                            </#if>
                        </#list>
                    </#if>
                </div>
            </div>
        </div>
    </div>

    <!-- 全球布局 -->
    <div class="global-layout" id="top3">
        <div class="center">
            <div class="global-layout-title title-case">
                <h2>全球布局</h2>
                <h3>GLOBAL LAYOUT</h3>
            </div>
        </div>
    </div>

    <!-- 企业文化 -->
    <div class="culture" id="top4">
        <div class="center">
            <div class="culture-title title-case">
                <h2>企业文化</h2>
                <h3>CORPORATE CULTURE</h3>
            </div>
            <div class="culture-list">
                <ul>
                    <li>
                        <img class="pngie6" src="${imageHost}/hr/about/c01.png" width="147" height="147" alt="企业文化" />
                        <h5>愿景</h5>
                        <p>成为最受尊敬的游戏行业领跑者</p>
                    </li>
                    <li>
                        <img class="pngie6" src="${imageHost}/hr/about/c02.png" width="147" height="147" alt="企业文化" />
                        <h5>宗旨</h5>
                        <p>独一无二，精益求精</p>
                    </li>
                    <li>
                        <img class="pngie6" src="${imageHost}/hr/about/c03.png" width="147" height="147" alt="企业文化" />
                        <h5>使命</h5>
                        <p>打造全球精品游戏</p>
                    </li>
                    <li>
                        <img class="pngie6" src="${imageHost}/hr/about/c04.png" width="147" height="147" alt="企业文化" />
                        <h5>价值</h5>
                        <p>真诚 学习 创新 成果</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- 底部 -->
    <#include "footer.ftl">

    <!--右侧浮动导航-->
    <div class="about-float-nav pngie6">
        <a><span class="nav0 pngie6"></span></a>
        <a><span class="nav1 pngie6"></span></a>
        <a><span class="nav2 pngie6"></span></a>
        <a><span class="nav3 pngie6"></span></a>
        <a><span class="nav4 pngie6"></span></a>
    </div>

    <script type="text/javascript">
    $(function(){
        var page = 1;
        var i = 4; //显示个数
        //向后按钮
        $(".event .next-btn").click(function(){
            scrollBox("next-btn");
        });
        //往前按钮
        $(".event .prev-btn").click(function(){
            scrollBox("prev-btn");
        });
        var scrollBox = function(className){
            var pic = $(".event-list");
            var ul = $(".event-list ul");
            var w = pic.width();
            var len = ul.find("li").length;
            var count = Math.ceil(len / i) ;
            if(className == "next-btn"){
                if( page == count ){
                    ul.animate({ left : '0px'}, "slow"); 
                    page = 1;
                }else{
                    ul.animate({ left : '-='+w }, "slow");
                    page++;
                }
            }else if(className == "prev-btn"){
                if( page == 1 ){
                    ul.animate({ left : '-='+w*(count-1) }, "slow");
                    page = count;
                }else{
                    ul.animate({ left : '+='+w }, "slow");
                    page--;
                }
            }
            $(".event-list ul li").eq((page-1)*4).click();
        }

        $(".event-list ul li").live("click",function(){
            var index = $(this).index();
            $(this).addClass("curr").siblings().removeClass("curr");
            $(".event-pic p").eq(index).addClass("curr").siblings().removeClass("curr");
        });

        //右侧浮动导航
        $(".about-float-nav a").live("click",function(){
            var index = $(this).index();
            $("html,body").animate({scrollTop : $("#top" + index).offset().top},300);            
        });
        $(window,document).scroll(function(){
            var scrollTop = $(document).scrollTop();
            var top2 = $("#top2").offset().top - 220;
            var top3 = $("#top3").offset().top - 220;
            var top4 = $("#top4").offset().top - 280;
            if( scrollTop > 200 ){
                $(".about-float-nav").show();
                if( scrollTop > 200 && scrollTop < top2 ){
                    addRemoveClass(1);
                }else if( scrollTop >= top2 && scrollTop < top3 ){
                    addRemoveClass(2);
                }else if( scrollTop >= top3 && scrollTop < top4 ){
                    addRemoveClass(3);
                }else if( scrollTop >= top4 ){
                    addRemoveClass(4);
                }
            }else{
                $(".about-float-nav").hide();
            }
        });
        var addRemoveClass = function(index){
            $(".about-float-nav a").eq(index).addClass("curr").siblings().removeClass("curr");
        }

        //IE6
        if( $.browser.version == 6.0 ){
            
        }

    });
    </script>

</body>
</html>
