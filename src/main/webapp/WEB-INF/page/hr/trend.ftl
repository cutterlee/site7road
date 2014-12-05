
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
                        <li><a href="${HrServerHost}/hr/page/${hotJob.id}.html" title="${hotJob.positionName}" target="_blank">${hotJob.positionName}</a></li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 招聘动态 -->
        <div class="recruitment-news-box">
            <h3 class="nav-box">
                <em></em>
                <span>招聘动态</span>
                <i>Recruitment news</i>
            </h3>
            <h2 class="recruitment-news-title">${trend.title}</h2>
            <div class="recruitment-news-detail">
                ${trend.content}
            </div>
        </div>

    </div>

    <!-- 底部 -->
    <#include "footer.ftl">
    
    <script type="text/javascript">
        //右边图片最大宽度
        var imgLoad = function(imgObj){
            var img = new Image();
            img.onload = function(){
                if(img.width > 680){
                    imgObj.width = 680;
                }
            };
            img.src = imgObj.src;
        }
        
        var imgTag = $(".recruitment-news-box").find("img");
        var i = 0;
        for(; i<imgTag.length; i++){
            imgLoad(imgTag[i]);
        }
    </script>
</body>
</html>
