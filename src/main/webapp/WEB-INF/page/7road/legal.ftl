<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<#include "*/common/head.ftl">
<title>法律声明-第七大道官方网站</title>
</head>
<body>
	<!-- 菜单 -->
    <#include "*/common/menu.ftl">

    <!-- 横条 -->
    <div class="pic-box">
		<div class="pic screenCenter">
			<h2>关于我们<span>About us</span></h2>
			<h3>法律声明</h3>
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
					<a class="active" href="${serverHost}/legal.html">法律声明</a>
				</li>
			</ul>
		</div>

		<!-- 右边 -->
		<div class="rightMod f_r">
			<h3>
				<strong>${data.titleName}</strong>
				<em>Legal</em>
			</h3>
			<div class="article">${data.infoContent}</div>
		</div>

	</div>

<!-- 底部 -->
<#include "*/common/footer.ftl">

</body>
</html>
