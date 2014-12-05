
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
        <h3 class="recruitment-title">
            <strong>职位搜索</strong>
            <em>Job search</em>
        </h3>
        <div class="recruitment-search">
            <input type="text" />
            <span>搜索</span>
        </div>
        <div class="recruitment-nav">
            <a class="curr" href="${HrServerHost}/hr/recruitmentList.html?v=${version}">全部</a>
            <#if jobTypeList??>
                <#list jobTypeList as data>
                    <a href="${HrServerHost}/hr/recruitmentList.html?jobType=${data.jobType.key}">${data.jobType.text}</a>
                </#list>
            </#if>
        </div>
        

        <div class="recruitment-detail">
            <h2>${recruit.positionPlace} - ${recruit.positionName}</h2>
            <div class="recruitment-information">
                <span>工作地点：</span>
                <span class="recruitment-address">${recruit.positionPlace}</span>
                <span>招聘人数：</span>
                <span class="recruitment-num">${recruit.positionNeedNum}</span>
                <span>职位性质：</span>
                <span class="recruitment-industry">${recruit.positionProperty}</span>
            </div>
            <#if recruit.positionDuty?? && recruit.positionDuty?length gt 0>
                <h3>工作职责：</h3>
                <div class="recruitment-information">${recruit.positionDuty}</div>
            </#if>
            <#if recruit.positionRequirement?? && recruit.positionRequirement?length gt 0>
                <h3>职位要求：</h3>
                <div class="recruitment-information">${recruit.positionRequirement}</div>
            </#if>
            <div class="recruitment-information">
                <p class="apply-collect">
                    <span class="apply" id="${recruit.id}" type="apply">申请岗位</span>
                    <span class="collect" id="${recruit.id}" type="collect">收藏岗位</span>
                </p>
            </div>
        </div>

    </div>

    <!-- 底部 -->
    <#include "footer.ftl">

    <script type="text/javascript">
    $(".recruitment-search input").on("keyup",function(e){
        if( e.keyCode == 13 ){
            $(".recruitment-search span").click();
        }
    });
    $(".recruitment-search span").on("click",function(){
        var val = $.trim($(this).siblings().val());
        if(val){
            window.open("http://hr.7road.com/hr/recruitmentList.html?keywords=" + val);
        }else{
            alert("请输入搜索关键字");
        }
    });
    </script>
   
</body>
</html>
