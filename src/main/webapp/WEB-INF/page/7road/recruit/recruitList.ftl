<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>社会招聘-第七大道官方网站</title>
</head>
<body>
    <!-- 菜单 -->
    <#include "*/common/menu.ftl">

    <!-- 横条 -->
    <#include "*/common/bar.ftl">
    
    <div class="modMain screenCenter">
        <!-- 左边导航 -->
        <div class="leftSideBar f_l">
            <h2 class="t3">
                <#include "*/common/leftTitle.ftl">
            </h2>
            <ul>
                <#if recruitLeftBar??>
                    <#list recruitLeftBar as menu >
                        <li>
                            <a <#if menu.menuUrl?index_of("recruitmentList")!=-1> class="active" </#if> href="${menu.menuUrl}">${menu.menuName}</a>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>
        
        <!-- 右边 -->
        <div class="rightMod f_r">
            <h3>
                <strong>招贤纳士</strong>
                <em>Join us</em>
            </h3>
            <div class="article">
                <div class="recruitmentSearch">
                    <p><input type="text" /></p>
                    <a href="javascript:;">搜索职位</a>
                </div>
                <div class="recruitmentNav">
                    <span>职位:</span>
                    <a class="on" onclick="change('${serverHost}/recruit/recruitmentList_all_1.html?v=${version}',this)">全部</a>
                    <#if jobTypeList??>
                        <#list jobTypeList as data>
                            <a onclick="change('<#if (data.hasPosition == "false")>false<#else>${serverHost}/recruit/recruitmentList_${data.jobType.key}_1.html?v=${version}</#if>',this)">${data.jobType.text}</a>
                        </#list>
                    </#if>
                </div>
                <div class="recruitmentTit">
                    <span>职位名称</span>
                    <em class="industry">职位性质</em>
                    <em class="address">地点</em>
                    <em class="date">发布时间</em>
                </div>
                <div class="recruitment" id="recruitment">
                    <#include "recruitListBox.ftl">
                </div>
                
            </div>
        </div>

    </div> 

    <!-- 底部 -->
    <#include "*/common/footer.ftl">

    <script type="text/javascript">
        //职位搜索
        $(".recruitmentSearch a").bind("click",function(){
            var val = $(".recruitmentSearch input").val()
            if(val == "" || val.split(" ").length > 1){
                var url = "${serverHost}/recruit/recruitmentList_all_1.html?v=${version}";
                $.get(url, function(data){
                    document.getElementById("recruitment").innerHTML = data;               
                });
            }else{
                $.ajax({
                    type:"post",
                    url:"${serverHost}/website7road/onlineRecruit/queryByKeyWord.action",
                    data:{'keyWord':$(".recruitmentSearch input").val()},
                    async:true,
                    success:function(msg){
                        var data = msg.data;
                        var a = $(".recruitmentNav a");
                        for(var i=0;i<a.length;i++){
                            if(a.eq(i).hasClass("on")){
                                recruitmentSort = a.eq(i).text();
                            }
                        }
                        if(data){
                            $('.recruitment').empty();
                            $(".recruitment").append("<ul></ul>")
                            var flag = false;
                            $(data).each(function(index,text){
                                var recruitmentHtml = 
                                        '<li>'+
                                            '<a class="postName" href="${serverHost}/recruit/page/'+ text.recruit.id +'.html">'+ text.recruit.positionName +'</a>'+
                                            '<span class="industry">'+ text.propertyName +'</span>'+
                                            '<span class="address">'+ text.recruit.positionPlace +'</span>'+
                                            '<span class="date">'+ text.publishTimeStr +'</span>'+
                                        '</li>';
                                if(text.propertyName == recruitmentSort || recruitmentSort == "全部"){
                                    $(".recruitment ul").append(recruitmentHtml);
                                    flag = true;
                                }
                            });
                            if(flag == false){
                                $(".recruitment").empty().append("<div class='nothing'>在“"+recruitmentSort+"”类别下没有找到相关职位，请查找其他类别</div>");
                            }
                        }else{
                            $(".recruitment").empty().append("<div class='nothing'>没有找到相关职位</div>");
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
                $(".recruitment").empty().append("<div class='nothing'>本类别暂无职位空缺，如有兴趣，也可将简历投递到<a class='red' href='mailto:hr@7road.com'>hr@7road.com</a>邮箱，您的简历将作为7道的重要储备，如有职位空缺我们会第一时间与您联系。</div>")
            }else{
                $.get(url, function(data){
                    document.getElementById("recruitment").innerHTML = data;               
                });
            }
        }
        function show(obj){ 
            $(".recruitmentNav a").removeClass("on"); 
            $(obj).addClass("on");
        }
    </script>
</body>
</html>