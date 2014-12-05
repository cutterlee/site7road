<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<#include "*/common/head.ftl">
<title>工程体系简介-第七大道官方网站</title>
</head>
<body>
	<!-- 菜单 -->
    <#include "*/common/menu.ftl">

    <!-- 横条 -->
    <div class="pic-box">
		<div class="pic screenCenter">
			<h2>关于我们<span>About us</span></h2>
			<h3>工程体系简介</h3>
			<p class="sub">
				<img class="pngie6" src="${imageHost}/b01be0f8-40c8-4596-aab0-82aa31643f98.png" />
			</p>
		</div>
	</div>

	<div class="modMain">
		<!-- 左边导航 -->
		<div class="leftSideBar f_l">
			<h2 class="t1">
                <span>关于我们</span>
                <em>About us</em>
            </h2>
			<ul>
				<li>
					<a class="active" href="${serverHost}/parents.html">工程体系简介</a>
					<a class="health" href="${serverHost}/health.html">未成年人健康参与网络游戏提示</a>
				</li>
			</ul>
			<div class="parentsHelp">
				<p>
					<span>家长专线</span>
					<em>0755-86199303</em>
				</p>
				<p>
					<a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=800073277&amp;f=1&amp;ty=1&amp;aty=0&amp;a=&amp;from=6" target="_blank">在线客服</a>
					<a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=800073277&amp;f=1&amp;ty=1&amp;aty=0&amp;a=&amp;from=6" target="_blank">24小时QQ在线客服</a>
				</p>
				<p>
					<span>服务邮箱</span>
					<a href="mailto:kefu@7road.com">kf@7road.com</a>
				</p>
			</div>
		</div>

		<!-- 右边 -->
		<div class="rightMod f_r">
			<h3>
				<strong>${data.titleName}</strong>
				<em>Parents</em>
			</h3>
			<div class="article">${data.infoContent}</div>
		</div>

	</div>

<!-- 底部 -->
<#include "*/common/footer.ftl">

</body>
</html>
