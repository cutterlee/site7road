
<!DOCTYPE html>
<html>
<head>
    
<#include "head.ftl">

</head>

<body>
    
    <!-- 菜单 -->
    <#include "menu.ftl">

    <div class="banner-wrap">
        <div class="banner">
            <div class="bannerImg">
                <ul>
                    <#if indexImgList??>
                        <#list indexImgList as img>
                            <li url="${img.text}">
                                <a href="${img.imgUrl}" target="_blank"></a>
                            </li>
                        </#list>
                    </#if>
                    
                </ul>     
            </div>
            <div class="bannerNav"><ul></ul></div>
        </div>
        <div class="leftBtn"></div>
        <div class="rightBtn"></div>
    </div>

    <div class="main">
        <!-- 热门职位 -->
        <div class="latest-job">
            <h3 class="nav-box">
                <a href="${HrServerHost}/hr/recruitmentList.html" title="更多">更多</a>
                <em></em>
                <span>热门职位</span>
            </h3>
            <ul>
                <#if hotJobList??>
                    <#list hotJobList as hotJob>
                        <#if hotJob_index == 5><#break></#if>
                        <li>
                            <span>${hotJob.createTime?string("yyyy-MM-dd")}</span>
                            <a href="${HrServerHost}/hr/page/${hotJob.id}.html" title="${hotJob.positionName}" target="_blank">${hotJob.positionName}</a>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 职位搜索/职位分类 -->
        <div class="search-sort">
            <h3 class="nav-box">
                <em></em>
                <span>职位搜索</span>
                <i>Job Search</i>
            </h3>
            <div class="job-search">
                <input type="text">
                <span>搜索</span>
            </div>
            <h3 class="nav-box">
                <em></em>
                <span>职位分类</span>
            </h3>
            <div class="job-sort">
                <a href="${HrServerHost}/hr/recruitmentList.html">全部</a>
                <#if jobTypeList??>
                    <#list jobTypeList as jobType>
                        <a href="${HrServerHost}/hr/recruitmentList.html?jobType=${jobType.key}" target="_blank">${jobType.text}</a>
                    </#list>
                </#if>
            </div>
        </div>

        <!-- 最新动态 -->
        <div class="latest-news">
            <h3 class="nav-box">
                <a href="${HrServerHost}/trend/trendList.html" target="_blank" title="更多">更多</a>
                <em></em>
                <span>招聘动态</span>
            </h3>
            <ul>
                <#if jobTrendList??>
                    <#list jobTrendList as trend>
                        <#if trend_index == 2><#break></#if>
                        <li>
                            <a href="${HrServerHost}/trend/${trend.id}.html" target="_blank" title="${trend.title}">${trend.title}</a>
                        </li>
                    </#list>
                </#if>
            </ul>
            <div class="weixin">
                <img src="${imageHost}/hr/weixin-s.jpg" width="66" height="67" alt="微信" />
                <p>扫一扫关注我</p>
                <h2>第七大道招聘</h2>
            </div>
        </div>
        
    </div>

    <!-- 底部 -->
    <#include "footer.ftl">

    <!--微信弹窗-->
    <div class="lock-mask"></div>
    <div class="weixin-pop">
        <span class="close-weixin-pop pngie6"></span>
        <img src="${imageHost}/hr/weixin-b.jpg" width="500" height="499" alt="微信" />
    </div>


    <script type="text/javascript" src="http://static.my.7road.com/js/player.js?ver=${version}"></script>
    <script type="text/javascript">
    $(".job-search input").on("keyup",function(e){
        if( e.keyCode == 13 ){
            $(".job-search span").click();
        }
    });
    $(".job-search span").on("click",function(){
        var val = $.trim($(this).siblings().val());
        if(val){
            window.open("http://hr.7road.com/hr/recruitmentList.html?keywords=" + val);
        }else{
            alert("请输入搜索关键字");
        }
    });
    $(".weixin").on("click",function(){
        $(".weixin-pop").fadeIn();
        $(".lock-mask").show().height($(document).height());//document.body.offsetHeight
    });
    $(".close-weixin-pop").on("click",function(){
        $(".weixin-pop").fadeOut();
        $(".lock-mask").hide();
    });
    </script>

</body>
</html>
