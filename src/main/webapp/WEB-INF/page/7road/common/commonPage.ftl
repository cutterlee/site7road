<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<#include "*/common/head.ftl">
<title>${data.titleName}-第七大道官方网站</title>
</head>
<body>
	<!-- 菜单 -->
    <#include "*/common/menu.ftl">

    <!-- 横条 -->
    <#include "*/common/bar.ftl">

	<div class="modMain">
		<!-- 左边导航 -->
		<div class="leftSideBar f_l">
			<h2 class="t1">
                <#include "*/common/leftTitle.ftl">
            </h2>
			<ul>
				<#if leftBarData??>
					<#list leftBarData as leftBar>
						<li>
							<a <#if leftBar.menuUrl?index_of(data.secondHtmlName)!=-1> class="active" </#if> href="${leftBar.menuUrl}">${leftBar.menuName}</a>
						</li>
					</#list>
				</#if>
			</ul>
		</div>

		<!-- 右边 -->
		<div class="rightMod f_r">
			<h3>
				<strong>${data.titleName}</strong>
				<em>${module.englishName}</em>
			</h3>
			<div class="article">${data.infoContent}</div>
		</div>

	</div>

<!-- 底部 -->
<#include "*/common/footer.ftl">

</body>
</html>
