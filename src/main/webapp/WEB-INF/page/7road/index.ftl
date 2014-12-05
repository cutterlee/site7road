<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>第七大道官方网站</title>

</head>

<body>
    <div class="topBarWrap">
        <div class="topBar">
            <a class="goWan" href="http://www.wan.com/" target="_blank"></a>
            <a class="hideTopBar" href="javascript:;"></a>
        </div>
    </div>
    <!-- 头部 -->
    <#include "*/common/menu.ftl">

    <div class="bannerWrap">
        <div class="banner">
            <div class="bannerImg">
                <ul>
                    <#if carouselList??>
                        <#list carouselList as data>
                            <li url="${data.indexImgUrl}">
                                <a href="${data.indexImgLink}" target="_blank"></a>
                                <div class="bannerBtn">
                                    <a class="detailBtn" href="${data.gameWebsiteUrl}" target="_blank">了解更多</a>
                                    <a class="startGameBtn" href="${data.gamePlayUrl}" target="_blank">开始游戏</a>
                                </div>
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

    <div class="mainWrap">
        <div class="main screenCenter">
            <!-- 大事件 -->
            <div class="news f_l">
                <h3>
                    <a href="${serverHost}/aboutUs/event.html" title="更多"></a>
                    <span>公司大事件</span>
                    <em>Event</em>
                </h3>
                <ul>
                    <#if events??>                    
                        <#list events as data>
                            <#if data_index == 5><#break></#if>
                            <li>
                                <span>[${data.publishTime?string("yyyy-MM-dd")}]</span>
                                <i></i>
                                <a href="${serverHost}/aboutUs/event.html?eventIndex=${data_index}" title="${data.title}">${data.title}</a>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>

            <!-- 人在七道 -->
            <div class="news in7road f_l">
                <h3>
                    <a href="${serverHost}/at7road/titbit.html" title="更多"></a>
                    <span>人在七道</span>
                    <em>In 7road</em>
                </h3>
                <ul>     
                    <#if at7roadList??>    
                        <#list at7roadList as data>  
                            <#if data_index == 5><#break></#if>
                            <li>
                                <i></i>
                                <a href="${serverHost}/at7road/titbit/${data.id}.html" title="${data.title}">${data.title}</a>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>

            <div class="indexVideo f_r">
                <#if indexVideo??>
                <a href="javascript:;" videoUrl="<#if indexVideo.vedioUrl??>${indexVideo.vedioUrl}</#if>" videoImg="<#if indexVideo.imgUrl??>${indexVideo.imgUrl}</#if>">
                    <img src="<#if indexVideo.imgUrl??>${indexVideo.imgUrl}</#if>" alt="<#if indexVideo.desc??>${indexVideo.desc}</#if>" />
                    <span class="indexVideoDot pngie6"></span>
                </a>
                </#if>
            </div>
        </div>
    </div>

    <!-- 底部start -->
    <#include "*/common/footer.ftl">

    <script type="text/javascript" src="${staticHost}/js/player.js?ver=${version}"></script>

    <div class="popWan">
        <a class="closePopWan pngie6" href="javascript:;"></a>
        <a class="wanLink1" href="http://www.wan.com/" target="_blank"></a>
        <a class="wanLink2" href="http://www.wan.com/" target="_blank"></a>
    </div>

    <div class="lockScreen"></div>
    <div class="popVideoWrap">
        <div class="popVideo">
            
        </div>
    </div>

    <script type="text/javascript">
        //视频
        $(".indexVideo a").live("click",function(){
            $(".lockScreen").height($(document).height()).show();
            $(".popVideoWrap").show();
            var videoUrl = $(this).attr("videoUrl");
            var videoImg = $(this).attr("videoImg");
            var videoHtml = 
                '<a class="closeVideo" href="javascript:;"></a>'+
                '<object type="application/x-shockwave-flash" data="${imageHost}/videoFlash/vcastr.swf" '+
                'width="640" height="360" id="vcastr3" wmode="opaque" >'+
                    '<param name="movie" value="${imageHost}/videoFlash/vcastr.swf" />'+
                    '<param name="allowFullScreen" value="true" />'+
                    '<param name="wmode" value="opaque" />'+
                    '<param name="FlashVars" value="xml='+
                        '<vcastr>'+
                            '<channel>'+
                                '<item>'+
                                '<source>'+videoUrl+'</source>'+//视频地址
                                '<duration></duration>'+
                                '</item>'+
                            '</channel>'+
                            '<config>'+
                                '<controlPanelBgColor>0x000000</controlPanelBgColor>'+
                                '<buffertime>4</buffertime>'+
                                '<contralpanelalpha>0.75</contralpanelalpha>'+
                                '<controlpanelbgcolor>0xff6600</controlpanelbgcolor>'+
                                '<controlpanelbtncolor>0xffffff</controlpanelbtncolor>'+
                                '<contralpanelbtnglowcolro>0xffff00</contralpanelbtnglowcolro>'+
                                '<controlpanelmode>float</controlpanelmode>'+
                                '<defautVolume>0.7</defautVolume>'+
                                '<isAutoPlay>true</isAutoPlay>'+
                                '<isLoadBegin>true</isLoadBegin>'+
                                '<isshowabout>false</isshowabout>'+
                                '<scaleMode>exactFit</scaleMode>'+
                                '<isRepeat>false</isRepeat>'+
                            '</config>'+
                            
                            '<plugIns>'+
                                '<beginEndImagePlugIn>'+
                                    '<url>${imageHost}/videoFlash/beginEndImagePlugIn.swf</url>'+
                                    '<source>'+videoImg+'</source>'+//视频图片
                                    '<type>begin</type>'+
                                    '<scaleType>exactFit</scaleType>'+
                                '</beginEndImagePlugIn>'+
                            '</plugIns>'+
                        '</vcastr> " />'+
                '</object>';
            $(".popVideo").append(videoHtml);
        });
        
        //关闭视频
        $(".closeVideo").live("click",function(){
            $(".popVideoWrap,.lockScreen").hide();
            $(".popVideo object,.popVideo a").remove();
        });

        //顶部横条关闭展开
        $(".hideTopBar").live("click",function(){
            $(".topBarWrap").slideUp();
            $(".showTopBar").show();
        });
        $(".showTopBar").live("click",function(){
            $(".topBarWrap").slideDown();
            $(".showTopBar").hide();
        });

        /*
        //弹窗
        $(".closePopWan").live("click",function(){
            $(".popWan,.lockScreen").hide();
            addCookie("hidePopWan","hide",600);//单位秒
        });
        var showPopWan = function(){
            $(".popWan").show();
            $(".lockScreen").height($(document).height()).show();
        }
        
        //cookie设置
        var addCookie = function(name,value,expiresHours){
            var cookieString=name+"="+escape(value);
            //判断是否设置过期时间
            if(expiresHours>0)    {
                var date=new Date();
                date.setTime(date.getTime()+expiresHours*60*24);
                cookieString=cookieString+"; expires="+date.toGMTString();
            }
            document.cookie=cookieString;
        }
        var getCookie = function(name){
            var strCookie=document.cookie;
            var arrCookie=strCookie.split("; ");
            for(var i=0;i<arrCookie.length;i++)
            {
                var arr=arrCookie[i].split("=");
                if(arr[0]==name)
                {
                    return arr[1];
                }
            }
            return "";
        }
        if(getCookie("hidePopWan")){
            
        }else{
            setTimeout("showPopWan()",1000);
        }
        */
    </script>
</body>
</html>
