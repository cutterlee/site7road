<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<#include "*/common/head.ftl">
<title>视频专区-第七大道官方网站</title>
</head>
<body>
    <!-- 菜单 -->
    <#include "*/common/menu.ftl">

    <!-- 横条 -->
    <#include "*/common/bar.ftl">
    
    <div class="modMain screenCenter">
        <!-- 左边导航 -->
        <div class="leftSideBar f_l">
            <h2 class="t6">
                <#include "*/common/leftTitle.ftl">
            </h2>
            <ul>
                <#if at7roadLeftBar??>
                    <#list at7roadLeftBar as at7road>
                        <li>
                            <a <#if at7road.menuUrl?index_of("video")!=-1> class="active" </#if> href="${at7road.menuUrl}">${at7road.menuName}</a>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 右边-->
        <div class="rightMod f_r">
            <h3>
                <strong>视频专区</strong>
                <em>Video</em>
            </h3>
            <div class="article">
                <div class="video">
                    <!--推荐视频-->
                    <div class="firstVideo">
                        <#if indexVideo??>
                        <object type="application/x-shockwave-flash" data="${imageHost}/videoFlash/vcastr.swf" width="640" height="360" id="vcastr3" wmode="opaque" >
                            <param name="movie" value="${imageHost}/videoFlash/vcastr.swf" />
                            <param name="allowFullScreen" value="true" />
                            <param name="wmode" value="opaque" />
                            <param name="FlashVars" value="xml=
                                <vcastr>
                                    <channel>
                                        <item>
                                        <source>${indexVideo.vedioUrl}</source><!--视频地址-->
                                        <duration></duration>
                                        </item>
                                    </channel>
                                    <config>
                                        <controlPanelBgColor>0x000000</controlPanelBgColor>
                                        <buffertime>4</buffertime>
                                        <contralpanelalpha>0.75</contralpanelalpha>
                                        <controlpanelbgcolor>0xff6600</controlpanelbgcolor>
                                        <controlpanelbtncolor>0xffffff</controlpanelbtncolor>
                                        <contralpanelbtnglowcolro>0xffff00</contralpanelbtnglowcolro>
                                        <controlpanelmode>float</controlpanelmode>
                                        <defautVolume>0.7</defautVolume>
                                        <isAutoPlay>true</isAutoPlay>
                                        <isLoadBegin>false</isLoadBegin>
                                        <isshowabout>false</isshowabout>
                                        <scaleMode>exactFit</scaleMode>
                                        <isRepeat>false</isRepeat>
                                    </config>
                                    
                                    <plugIns>
                                        <beginEndImagePlugIn>
                                            <url>${imageHost}/videoFlash/beginEndImagePlugIn.swf</url>
                                            <source>${indexVideo.imgUrl}</source><!--视频图片-->
                                            <type>begin</type>
                                            <scaleType>exactFit</scaleType>
                                        </beginEndImagePlugIn>
                                    </plugIns>
                                </vcastr> " />
                        </object>
                        </#if>
                    </div>
                    <ul>
                        <#if videoList??>
                            <#list videoList as data>
                                <li <#if data_index == 0>class="first"</#if> >
                                    <h2>
                                        <i class="titleDot"></i>
                                        <#if data.at7road.title?length gt 36>
                                            ${data.at7road.title?substring(0,36)}...
                                        <#else>
                                            ${data.at7road.title}
                                        </#if>
                                    </h2>
                                    <div class="videoIntro">
                                        ${data.at7road.content} 
                                    </div>
                                    <div class="videoPic">
                                        <#if data.vedioItemList??>
                                            <#list data.vedioItemList as video>
                                                <a href="javascript:;" videoUrl="${video.vedioUrl}" videoImg="${video.imgUrl}">
                                                    <img src="${video.imgUrl}" alt="${video.desc}" />
                                                    <span class="videoDot pngie6"></span>
                                                </a>
                                            </#list>
                                        </#if>
                                    </div>
                                </li>
                            </#list>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>

    </div> 

    <!-- 底部 -->
    <#include "*/common/footer.ftl">

    <script type="text/javascript">
        //视频
        $(".videoPic a").live("click",function(){
            $("html,body").animate({scrollTop:"250px"},500);
            var videoUrl = $(this).attr("videoUrl");
            var videoImg = $(this).attr("videoImg");
            var videoHtml = 
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
            $(".firstVideo").empty().append(videoHtml);
        });
    </script>
</body>
</html>
