
<!DOCTYPE html>
<html>
<head>
    
<#include "head.ftl">

</head>

<body>
    
    <!-- 菜单 -->
    <#include "menu.ftl">

    <div class="recruitment-slogan" style="background:url(${job_content_page_img.text}) center top no-repeat;">

    </div>

    <div class="center">
        <div class="hot-job">
            <h3 class="nav-box">
                <em></em>
                <span>热招职位</span>
            </h3>
            <ul>
                <#if hotJobList??>
                    <#list hotJobList as hotJob>
                        <li><a href="${HrServerHost}/hr/page/${hotJob.id}.html" target="_blank" title="${hotJob.positionName}">${hotJob.positionName}</a></li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 招聘新闻 -->
        <div class="recruitment-news-box">
            <h3 class="nav-box">
                <em></em>
                <span>招聘动态</span>
                <i>Recruitment news</i>
            </h3>
            <div class="recruitment-news-list" id="recruitment-news-list">
                <#include "trendListBox.ftl">
            </div>
        </div>

    </div>

    <!-- 底部 -->
    <#include "footer.ftl">

    <script type="text/javascript">
        function changePage(url){
            $.get(url, function(data){
                document.getElementById("recruitment-news-list").innerHTML = data;               
            });
        }
    </script>
    
</body>
</html>
