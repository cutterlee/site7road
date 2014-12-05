
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
            <a class="curr" onclick="change('${HrServerHost}/hr/recruitmentList_all_1.html?v=${version}',this)">全部</a>
            <#if jobTypeList??>
                <#list jobTypeList as data>
                    <a onclick="change('<#if (data.hasPosition == "false")>false<#else>${HrServerHost}/hr/recruitmentList_${data.jobType.key}_1.html?v=${version}</#if>',this)" type="${data.jobType.key}">${data.jobType.text}</a>
                </#list>
            </#if>
        </div>
        <div class="recruitment-tit">
            <span>职位名称</span>
            <em class="industry">职位类别</em>
            <em class="address">人数</em>
            <em class="date">发布时间</em>
        </div>
        <div class="recruitment-box" id="recruitment">
            <#include "recruitListBox.ftl">
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
        //职位搜索
        $(".recruitment-search span").bind("click",function(){
            var val =  $.trim($(".recruitment-search input").val());
            if(val == "" || val.split(" ").length > 1){
                var a = $(".recruitment-nav a");
                for(var i=0;i<a.length;i++){
                    if(a.eq(i).hasClass("curr")){
                        a.eq(i).click();
                    }
                }
                
            }else{
                $.ajax({
                    type:"post",
                    url:"${HrServerHost}/website7road/onlineRecruit/queryByKeyWord.action",
                    data:{'keyWord':$(".recruitment-search input").val()},
                    async:true,
                    success:function(msg){
                        var recruitmentSort;
                        var data = msg.data;
                        var a = $(".recruitment-nav a");
                        for(var i=0;i<a.length;i++){
                            if(a.eq(i).hasClass("curr")){
                                recruitmentSort = a.eq(i).text();
                            }
                        }
                        if(data){
                            $('.recruitment-box').empty();
                            $(".recruitment-box").append("<ul></ul>")
                            var flag = false;
                            $(data).each(function(index,text){
                                var recruitmentHtml = 
                                        '<li>'+
                                            '<a class="post-name" target="_blank" href="${HrServerHost}/hr/page/'+ text.recruit.id +'.html">'+ text.recruit.positionName +'</a>'+
                                            '<span class="industry">'+ text.propertyName +'</span>'+
                                            '<span class="address">'+ text.recruit.positionNeedNum +'</span>'+
                                            '<span class="date">'+ text.publishTimeStr +'</span>'+
                                        '</li>';
                                if(text.propertyName == recruitmentSort || recruitmentSort == "全部"){
                                    $(".recruitment-box ul").append(recruitmentHtml);
                                    flag = true;
                                }
                            });
                            if(flag == false){
                                $(".recruitment-box").empty().append("<div class='nothing'>在“"+recruitmentSort+"”类别下没有找到相关职位，请查找其他类别</div>");
                            }
                        }else{
                            $(".recruitment-box").empty().append("<div class='nothing'>没有找到相关职位</div>");
                        }
                    }
                });
            }
        });

        //职位切换
        function change(url, obj){
            changePage(url);
            show(obj);
        }

        function changePage(url){
            if(url == "false"){
                $(".recruitment-box").empty().append("<div class='nothing'>本类别暂无职位空缺，如有兴趣，也可将简历投递到<a class='red' href='mailto:hr@7road.com'>hr@7road.com</a>邮箱，您的简历将作为7道的重要储备，如有职位空缺我们会第一时间与您联系。</div>")
            }else{
                $.get(url, function(data){
                    document.getElementById("recruitment").innerHTML = data;               
                });
            }
        }
        function show(obj){ 
            $(".recruitment-nav a").removeClass("curr"); 
            $(obj).addClass("curr");
        }

        var href = decodeURI(window.location.href);
        var jobType = href.split("jobType=")[1];
        var keywords = href.split("keywords=")[1];
        if(jobType){
            $(".recruitment-nav a").each(function(){
                if($(this).attr("type") == jobType){
                    $(this).click();
                }
            });
        }else if(keywords){
            $(".recruitment-search input").val(keywords);
            $(".recruitment-search span").click();
        }
    </script>
</body>
</html>
