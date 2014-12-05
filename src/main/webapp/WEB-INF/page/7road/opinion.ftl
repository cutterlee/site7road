<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<#include "*/common/head.ftl">
<title>意见反馈-第七大道官方网站</title>
</head>
<body>
	<!-- 菜单 -->
    <#include "*/common/menu.ftl">

    <!-- 横条 -->
    <div class="pic-box">
		<div class="pic screenCenter">
			<h2>关于我们<span>About us</span></h2>
			<h3>意见反馈</h3>
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
					<a class="active" href="${serverHost}/opinion.html">意见反馈</a>
				</li>
			</ul>
		</div>

		<!-- 右边 -->
		<div class="rightMod f_r">
			<h3>
				<strong>${data.titleName}</strong>
				<em>Opinion</em>
			</h3>
			<div class="article">
				<div class="opinionTips">*&nbsp;请输入您的手机号码或者邮箱</div>
				<div class="phoneEmail">
					<div class="phone f_l">
						<i>&#8226;&nbsp;</i>
						<span>您的手机号：</span>
						<input type="text" maxlength="11" />
					</div>
					<div class="email f_l">
						<i>&#8226;&nbsp;</i>
						<span>您的邮箱：</span>
						<input type="text" maxlength="40" />
					</div>
				</div>
				<div class="phoneEmail">
					<div class="phone f_l">
						<i>&#8226;&nbsp;</i>
						<span>您的反馈信息：</span>
					</div>
				</div>
				<textarea class="opinionInfo" value="在此输入信息..."></textarea>
				<div class="opinionSubmit">
					<span>提交</span>
					<img src="${serverHost}/website7road/captcha.do?t=20140224" height="24" />
					<input type="text" maxlength="4" />
					<em>请输入验证码：</em>
				</div>
			</div>
		</div>

	</div>

	<!-- 底部 -->
	<#include "*/common/footer.ftl">

	<script type="text/javascript">
	
	$(".opinionSubmit span").live("click",function(){
		$.ajax({
	        type:"post",
	        url:"${serverHost}/website7road/linkInfo/sendInfo.action",
	        data:{"linkMsg.phoneNum":$(".phone input").val(),"linkMsg.emailAddress":$(".email input").val(),"linkMsg.message":$(".opinionInfo").val(),"code":$(".opinionSubmit input").val()},
	        async:true,
	        success:function(msg){
	            if(msg.messageObj.code == 200){
	            	alert("你反馈的信息已经提交给我们，感谢您的参与！");
	                $(".phone input,.email input,.opinionInfo,.opinionSubmit input").val("");
	            }else{
	            	alert(msg.messageObj.message);
	            }
	            $(".opinionSubmit img").click();
	        }
	    });
	});
	

	$(".opinionSubmit img").live("click",function(){
		$(this).attr("src","${serverHost}/website7road/captcha.do?t=" + new Date().getTime());
	});
	</script>

</body>
</html>
