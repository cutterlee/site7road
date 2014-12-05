<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="Description" content="网页游戏领先门户站，深圳第七大道科技有限公司是以研发、合作、推广最新互联网技术为主的高科技企业。" />
    <meta name="Keywords" content="第七大道,弹弹堂,神曲,网页游戏,网页游戏,页游,网络游戏,游戏平台,网页游戏平台,webgame,白领游戏,flash游戏,小游戏,策略游戏,战争游戏,最新网页游戏,免费网页游戏,休闲游戏,棋牌游戏,游戏论坛,RPG网页游戏" />
    <title>打击私服外挂_第七大道网页游戏平台_打造绿色快乐的网页游戏</title>

    <link rel="stylesheet" type="text/css" media="screen" href="${staticHost}/css/beatSF/style.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${staticHost}/css/beatSF/cb_style.css">

    <link rel="shortcut icon" href="http://image.my.7road.com/img/favicon.ico">

</head>
<body>

<div class="header"></div>

<div class="main">
    <!-- 新闻资讯 -->
        <div class="news" id="news">
            <#if newsList??>
                <#list newsList  as news>                            
					<a href="${serverHost}/law/${news.id}.html" target="_blank" title="${news.title}">
                        &gt;【新闻】
                        <#if (news.title?length>22)>
                            ${news.title[0..22]}...
                        <#else>
                            ${news.title}
                        </#if> 
                    </a>
                </#list> 
            </#if>
        </div>

        <!-- 业界案例 -->
        <div class="case" id="case">
            <#if caseList??>
                <#list caseList as case>
                    <a href="${serverHost}/law/${case.id}.html" target="_blank" title="${case.title}">
                        &gt;【案例】
                        <#if (case.title?length>22)>
                            ${case.title[0..22]}...
                        <#else>
                            ${case.title}
                        </#if> 
                    </a>
                </#list>
            </#if>
        </div>

        <!-- 现场图报 -->
        <div class="pic">
            <ul>
                <#if sceneImgList??>
                    <#list sceneImgList as item>
						<li>
							<a href="${item.imgUrl}" rel="clearbox[gallery=现场图报]">
								<img src="${item.imgUrl}" />
                            </a>
						</li>
                    </#list>
                </#if>
            </ul>
        </div>

        <!-- 法律法规 -->          
        <div class="law" id="law">
            <#if lawList??>
                <#list lawList as law>
                    <a href="${serverHost}/law/${law.id}.html" target="_blank" title="${law.title}">
                        &gt;【法规】
                        <#if (law.title?length>22)>
                            ${law.title[0..22]}...
                        <#else>
                            ${law.title}
                        </#if> 
                    </a>
                </#list> 
            </#if>
        </div>

        <!-- 举报途径 -->
        <div class="report">
            <a href="javascript:;" class="report-btn" id="inform-btn"></a>
            <p>电话举报：0755-61886777</p>
            <p>邮件举报：<a class="mailLink" href="mailto:kefu@7road.com">kefu@7road.com</a></p>
        </div>

        <!-- 相关链接 -->
        <div class="related-links">
            <a target="_blank" href="http://www.cogcpa.org/">
                <img src="${imageHost}/beatSF/link/link1.jpg" />
            </a>
            <a target="_blank" href="http://www.cyberpolice.cn/wfjb/html/index.shtml">
                <img src="${imageHost}/beatSF/link/link2.jpg" />
            </a>
            <a target="_blank" href="http://net.china.com.cn/">
                <img src="${imageHost}/beatSF/link/link3.jpg" />
            </a>
            <a target="_blank" href="http://www.12318.gov.cn/">
                <img src="${imageHost}/beatSF/link/link4.jpg" />
            </a>
        </div>

        <!-- 公司声明 -->
        <div class="statement"> 
						<p>
                <a href="http://www.7road.com/aboutUs/gssm.html" target="_blank">
                    打击“私服”、“外挂”违法行为，我们雷厉风行，绝不手软，只要有人胆敢以身试法，第七大道绝不姑息................
                </a>
            </p>
        </div>
    </div>
</div>


<!--弹出框 -->
<div class="pop animated" id="inform-box">
    <a href="javascript:;" class="pop-close"></a>
    <span class="fn-left add ml10" id="inform-add">继续添加</span>
    <div class="pop-header"></div>
    <form method="post" action="">
        <div class="pop-content">
            <P class="fn-clear first add-item">
                <label class="fn-left">举报网址:</label>
                <span class="fn-left"><input name="reportUrl" class="text" type="text" maxlength="50" alt="www.xxxxxxxxxx.com"/></span>
            </P>
            <P class="fn-clear add-item" >
                <label class="fn-left"></label>
                <span class="fn-left"><input name="reportUrl" class="text" maxlength="50" type="text"/></span>
        		</P>
        		<P class="fn-clear">
                <label class="fn-left">验证码:</label>
        			<span class="fn-left">
                        <input name="captcha" class="text captcha" type="text" maxlength="4" /> 
                        <img id="captcha" height="25" title="Change verify image" src="${serverHost}/website7road/captcha.do?t=20140605" />
                    </span>
            </P>		
        </div>
        <div class="pop-footer">
            <P class="fn-clear">
                <label class="fn-left">举报对象:</label>
                <span class="fn-left"><input name="reportObject" class="text" maxlength="50" alt="(侵权人跟人信息)" /></span>
            </P>    
            <P class="fn-clear">
                <label class="fn-left">举报理由:</label>
                <span class="fn-left">
                    <textarea name="reportReason" class="textarea" maxlength="200" alt="(填写您举报的原因，以便我们快速处理，大于四个字)"></textarea>
                </span>
            </P>
            <P class="fn-clear last">
                <label class="fn-left">举报人邮箱：</label>
                <span class="fn-left"><input name="reportEmail" class="text" maxlength="50" type="text" alt="(您的邮箱地址)"/></span>
            </P>
            <P class="fn-clear">
                <span class="fn-right"><input type="button" id="inform-sub" value="提交投诉"></input></span>
            </P>
          </div>
    </form>
</div>
<!--遮罩背景 -->
<div id="background"></div>


<script type="text/javascript" src="${staticHost}/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="${staticHost}/js/beatSF/clearbox.js"></script>
<script type="text/javascript" src="${staticHost}/js/beatSF/scrollNews.js"></script>
<script type="text/javascript" src="${staticHost}/js/beatSF/main.js"></script>

<script type="text/javascript">
    $(function(){
        $("#captcha").on("click",function(){
            $(this).attr("src","${serverHost}/website7road/captcha.do?t=" + new Date().getTime());
        });

        new Marquee("news","bottom",3,320,132,100,2000,1000,22);
        new Marquee("case","bottom",3,320,132,100,2000,1000,22);
        new Marquee("law","bottom",3,320,110,100,2000,1000,22);
    });


    
</script>

<!--[if IE 6]>
	 <script type="text/javascript" src="${staticHost}/js/DD_belatedPNG.js"></script>
	 <script type="text/javascript">
    		//IE6半透明
    		DD_belatedPNG.fix("#inform-btn");
    		//DD_belatedPNG.fix(".pop-header");
    		//DD_belatedPNG.fix(".pop-content");
    		//DD_belatedPNG.fix(".pop-footer");
	  </script>
<![endif]-->

</body>
</html>
