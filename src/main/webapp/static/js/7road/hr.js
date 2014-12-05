$(function(){
	var Fun = {
		init : function(){
			var regFlag = false, findFlag = false;
			
			//手机号码验证(注册时)
		    $(".checkRegPhoneNum").on("blur",function(){
		    	var phoneNum = $.trim($(this).val());
		    	if( isNaN(phoneNum) || phoneNum.length < 11 ){
		    		Fun.msgFun("#phoneNumMsg","请输入11位手机号码");
		    	}else{
		    		$.ajax({
		    			url : "http://www.7road.com/website7road/user/checkPhoneNum.action",
		    			type : "GET",
		    			dataType : "jsonp",
		    			data : {"phoneNum":phoneNum},
		    			success : function(data){
			    			if(data.msg.code == 200){
			    				$("#phoneNumMsg").html("");
			    				regFlag = true;
			    			}else{
				            	Fun.msgFun("#phoneNumMsg",data.msg.message);
				            	regFlag = false;
				            }
			        	}
			        });
		    	}
		    });

		    //手机号码验证(找回密码时)
		    $(".checkFindPasswordPhoneNum").on("blur",function(){
		    	var phoneNum = $.trim($(this).val());
		    	if( isNaN(phoneNum) || phoneNum.length < 11 ){
		    		Fun.msgFun("#phoneNumMsg","请输入11位手机号码");
		    	}else{
		    		$.ajax({
		    			url : "http://www.7road.com/website7road/user/checkPhoneNum.action",
		    			type : "GET",
		    			dataType : "jsonp",
		    			data : {"phoneNum":phoneNum},
		    			success : function(data){
			    			if(data.msg.code == 200){
			    				Fun.msgFun("#phoneNumMsg","该手机号码还未注册");
			    				findFlag = false;
			    			}else{
				            	$("#phoneNumMsg").html("");
				            	findFlag = true;
				            }
			        	}
			        });
		    	}
		    });

		    //图片验证码验证
		    $("#validCode").on("blur",function(){
		    	var validCode = $.trim($("#validCode").val());
		    	if( validCode.length < 4 ){
		    		Fun.msgFun("#validCodeMsg","请输入4位图片验证码");
		    	}else{
		    		$("#validCodeMsg").html("");
		    	}
		    });

		    //图片验证码更新
		    $(".img-valid-code").on("click",function(){
			    $("#imgValidCode").attr("src","http://www.7road.com/website7road/captcha.do?t=" + new Date().getTime());
			});

		    //获取短信验证码
		    $("#getPhoneVerificationCode").live("click",function(){
		    	var phoneNum = $.trim($("#phoneNum").val()), validCode = $.trim($("#validCode").val()), sendCodeType = $(this).attr("sendCodeType");
		    	if( isNaN(phoneNum) || phoneNum.length < 11 ){
		    		Fun.msgFun("#phoneNumMsg","请输入11位手机号码");
		    	}else if( sendCodeType == "register" && regFlag == false ){
		    		Fun.msgFun("#phoneNumMsg","手机号码已经被注册过或输入不正确");
		    	}else if( sendCodeType == "findPass" && findFlag == false ){
		    		Fun.msgFun("#phoneNumMsg","手机号码还未被注册");
		    	}else if( validCode.length < 4 ){
		    		Fun.msgFun("#validCodeMsg","请输入4位图片验证码");
		    	}else{
		    		$(this).html("正在发送短信验证码");
				    $.ajax({
				    	url : "http://www.7road.com/website7road/user/sendPhoneCode.action",
				    	type : "GET",
		    			dataType : "jsonp",
		    			data : {"phoneNum":phoneNum,"validCode":validCode,"sendCodeType":sendCodeType},
		    			success : function(data){
		    				if(data.msg.code == 200){
								$("#validCodeMsg").html("");
								Fun.againGetPhoneVerificationCode(120);
							}else{
				            	Fun.msgFun("#validCodeMsg",data.msg.message);
				            	$("#getPhoneVerificationCode").html("获取短信验证码");
				            	$(".img-valid-code").click();
				            }

		    			}
				    });
			    }
			});

			//短信验证码验证
		    $("#phoneCode").on("blur",function(){
		    	var phoneCode = $.trim($("#phoneCode").val());
		    	if( isNaN(phoneCode) || phoneCode.length < 4 ){
		    		Fun.msgFun("#phoneCodeMsg","请输入4位数字短信验证码");
		    	}else{
		    		$("#phoneCodeMsg").html("");
		    	}
		    });

			//注册密码验证
		    $("#password").on("blur",function(){
		    	var password = $.trim($("#password").val());
		    	if( password.length < 6 ){
		    		Fun.msgFun("#passwordMsg","密码不能少于6个字符");
		    	}else{
		    		$("#passwordMsg").html("");
		    	}
		    });

		    //注册确认密码验证
		    $("#confirmPassword").on("blur",function(){
		    	var password = $.trim($("#password").val()), confirmPassword = $.trim($("#confirmPassword").val());
		    	if( confirmPassword != password ){
		    		Fun.msgFun("#confirmPasswordMsg","两次输入密码不一致");
		    	}else{
		    		$("#confirmPasswordMsg").html("");
		    	}
		    });

		    //注册确认密码绑定回车
		    $("#confirmPassword").on("keyup",function(e){
		    	if( e.keyCode == 13 ){
					$("#regBtn").click();
				}
		    });

		    //注册
		    $("#regBtn").on("click",function(){
		    	var phoneNum = $.trim($("#phoneNum").val()), phoneCode = $.trim($("#phoneCode").val()), 
		    		password = $.trim($("#password").val()), confirmPassword = $.trim($("#confirmPassword").val());
		    	if( isNaN(phoneNum) || phoneNum.length < 11 ){
		    		Fun.msgFun("#phoneNumMsg","请输入11位手机号码");
		    	}else if( isNaN(phoneCode) || phoneCode.length < 4 ){
		    		Fun.msgFun("#phoneCodeMsg","请输入4位数字短信验证码");
		    	}else if( password.length < 6 ){
		    		Fun.msgFun("#passwordMsg","密码不能少于6个字符");
		    	}else if( confirmPassword != password ){
		    		Fun.msgFun("#confirmPasswordMsg","两次输入密码不一致");
		    	}else{
		    		if( regFlag ){
					    $.ajax({
					        url : "http://www.7road.com/website7road/user/register.action",
					        type : "GET",
			    			dataType : "jsonp",
			    			data : { "phoneNum" : phoneNum, "phoneCode" : phoneCode, "password" : password },
			    			success : function(data){
			    				if(data.msg.code == 200){
						        	window.location.href = "http://hr.7road.com/center/reg2.html";
						        }else{
						        	Fun.msgFun("#phoneCodeMsg",data.msg.message);
						        }
			    			}
					        
					    });
				    }
			    }
			});

			//注销
			$(".logout").on("click",function(){
				Fun.logout();
			});

			//登录手机号码验证
			$("#loginPhoneNum").on("blur",function(){
				var loginPhoneNum = $.trim($("#loginPhoneNum").val());
				if( isNaN(loginPhoneNum) || loginPhoneNum.length < 11 ){
		    		Fun.msgFun("#loginPhoneNumMsg","请输入11位手机号码");
		    	}else{
		    		$("#loginPhoneNumMsg").html("");
		    	}
			});

			//登录Tab切换键
			$("#loginPhoneNum").on("keyup",function(event){
				if( event.keyCode == 9 ){
					$("#loginPassword").focus();
				}
			});

			//登录密码框绑定回车登录
			$("#loginPassword").on("keyup",function(e){
				if( e.keyCode == 13 ){
					$("#loginBtn").click();
				}
			});

			//登录密码验证
			$("#loginPassword").on("blur",function(){
				var loginPassword = $.trim($("#loginPassword").val());
				if( loginPassword.length < 6 ){
		    		Fun.msgFun("#loginPasswordMsg","密码不能少于6个字符");
		    	}else{
		    		$("#loginPasswordMsg").html("");
		    	}
			});

			//登录
			$("#loginBtn").on("click",function(){
				var loginPhoneNum = $.trim($("#loginPhoneNum").val()), loginPassword = $.trim($("#loginPassword").val());
				if( isNaN(loginPhoneNum) || loginPhoneNum.length < 11 ){
		    		Fun.msgFun("#loginPhoneNumMsg","请输入11位手机号码");
		    	}else if( loginPassword.length < 6 ){
		    		Fun.msgFun("#loginPasswordMsg","密码不能少于6个字符");
		    	}else{
					Fun.login();
				}
			});

		    //发送新密码到手机上
			$("#getPasswordBtn").on("click",function(){
				var phoneNum = $.trim($("#phoneNum").val()), phoneCode = $.trim($("#phoneCode").val());
				if( isNaN(phoneNum) || phoneNum.length < 11 ){
		    		Fun.msgFun("#phoneNumMsg","请输入11位手机号码");
		    	}else if( isNaN(phoneCode) || phoneCode.length < 4 ){
		    		Fun.msgFun("#phoneCodeMsg","请输入4位数字短信验证码");
		    	}else if( findFlag ){
			    	Fun.getPassWord( phoneNum, phoneCode );
			    }
			});

			//手机号码验证(重置密码)
			$("#resetPhoneNum").on("blur",function(){
				var resetPhoneNum = $.trim($("#resetPhoneNum").val());
				if( isNaN(resetPhoneNum) || resetPhoneNum.length < 11 ){
		    		Fun.msgFun("#resetPhoneNumMsg","请输入11位手机号码");
		    	}else{
		    		$("#resetPhoneNumMsg").html("");
		    	}
			});

			//当前密码验证(重置密码)
			$("#resetPassword").on("blur",function(){
				var resetPassword = $.trim($("#resetPassword").val());
				if( resetPassword.length < 6 ){
		    		Fun.msgFun("#resetPasswordMsg","当前密码不能少于6个字符");
		    	}else{
		    		$("#resetPasswordMsg").html("");
		    	}
			});

			//新密码验证(重置密码)
			$("#resetNewPassword").on("blur",function(){
				var resetNewPassword = $.trim($("#resetNewPassword").val());
				if( resetNewPassword.length < 6 ){
		    		Fun.msgFun("#resetNewPasswordMsg","新密码不能少于6个字符");
		    	}else{
		    		$("#resetNewPasswordMsg").html("");
		    	}
			});

			//新密码确认验证(重置密码)
			$("#resetConfirmNewPassword").on("blur",function(){
				var resetNewPassword = $.trim($("#resetNewPassword").val()), resetConfirmNewPassword = $.trim($("#resetConfirmNewPassword").val());
				if( resetNewPassword != resetConfirmNewPassword ){
		    		Fun.msgFun("#resetConfirmNewPasswordMsg","两次输入密码不一致");
		    	}else{
		    		$("#resetConfirmNewPasswordMsg").html("");
		    	}
			});

			//重置密码
			$("#resetPasswordBtn").on("click",function(){
				var resetPhoneNum = $.trim($("#resetPhoneNum").val()), resetPassword = $.trim($("#resetPassword").val()),
					resetNewPassword = $.trim($("#resetNewPassword").val()), resetConfirmNewPassword = $.trim($("#resetConfirmNewPassword").val());
				if( isNaN(resetPhoneNum) || resetPhoneNum.length < 11 ){
		    		Fun.msgFun("#resetPhoneNumMsg","请输入11位手机号码");
		    	}else if( resetPassword.length < 6 ){
		    		Fun.msgFun("#resetPasswordMsg","当前密码不能少于6个字符");
		    	}else if( resetNewPassword.length < 6 ){
		    		Fun.msgFun("#resetNewPasswordMsg","新密码不能少于6个字符");
		    	}else if(resetNewPassword != resetConfirmNewPassword){
		    		Fun.msgFun("#resetConfirmNewPasswordMsg","两次输入密码不一致");
		    	}else{
			    	Fun.resetPassWord( resetPhoneNum, resetPassword, resetNewPassword );
			    }
			});

			//重置密码框绑定回车
			$("#resetConfirmNewPassword").on("keyup",function(e){
				if(e.keyCode == 13){
					$("#resetPasswordBtn").click();
				}
			});

			//保存基本信息
			$(".basic-info-save-btn").on("click",function(){
				var realNameTest = /^[\u4e00-\u9fa5]+$/i;
				var emailTest = /\w+[@]{1}\w+[.]\w+/;
				var realName = $.trim($("#modifyRealName").val()), gender = $("input[name='modifySex']:checked").val(), phoneNum = $("#modifyUsername").val(),
					educationDegree = $("#modifyEducation").val(), schoolName = $.trim($("#modifySchool").val()), emailAddr = $.trim($("#modifyEmail").val()), 
					marryStatu = $("#modifyMarry").val(), englishDegree = $("#modifyEnglishDegree").val(), workYear = $("#modifyWorkYear").val(), 
					majorName = $.trim($("#modifyProfessional").val()), briefIntroduction = $("#modifyProfile").val();
				var len = encodeURI(realName+gender+phoneNum+educationDegree+schoolName+emailAddr+marryStatu+englishDegree+workYear+majorName+briefIntroduction).length + 310;
				/*encodeURI("http://www.7road.com/website7road/user/saveResume.action?callback=info&resume.realName=&resume.gender=&resume.phoneNum=
				&resume.educationDegree=&resume.schoolName=&resume.emailAddr=&resume.marryStatu=&resume.englishDegree=&resume.workYear=&resume.majorName=
				&resume.briefIntroduction=&type=info&_=1414743008071").length = 308*/
				if( !realName || !realNameTest.test(realName) || realName.length < 2 ){
					alert("姓名为2-8个汉字");
				}else if( !educationDegree || educationDegree == "select" ){
					alert("请选择学历");
				}else if( !schoolName ){
					alert("请填写毕业院校");
				}else if( !emailAddr ){
					alert("请填写Email");
				}else if( !emailTest.test(emailAddr) ){
					alert("Email输入不正确");
				}else if( !marryStatu || marryStatu == "select" ){
					alert("请选择婚姻状况");
				}else if( !englishDegree || englishDegree == "select" ){
					alert("请选择英语等级");
				}else if( !workYear || workYear == "select" ){
					alert("请选择工作年限");
				}else if( !majorName ){
					alert("请填写专业");
				}else if( !$.trim(briefIntroduction) ){
					alert("请填写个人简介");
				}else{
					Fun.submitInfo( realName, gender, phoneNum, educationDegree, schoolName, emailAddr, marryStatu, englishDegree, workYear, majorName, briefIntroduction );
				}
			});

			//修改基本信息
	        $(".basic-info-modify-btn").on("click",function(){
	            $(".basic-info-show").hide();
	            $(".basic-info-modify").show();
	        });
	        

	        //取消添加工作经验
	        $("#cancelAddWork").live("click",function(){
	        	$(this).parent().parent().parent().remove();
	        	$(".add-work").parent().show();
	        });
	        //取消添加项目经验
	        $("#cancelAddProject").live("click",function(){
	        	$(this).parent().parent().parent().remove();
	        	$(".add-project").parent().show();
	        });

	        //添加工作经验
	        $(".add-work").on("click",function(){
	        	$(this).parent().hide();
	        	appendBox('.work-list', $(".work-box").html());
	        });

	        //添加项目经验
	        $(".add-project").on("click",function(){
	        	$(this).parent().hide();
	        	appendBox('.project-list', $(".project-box").html());
	        });

	        var appendBox = function(container, tags){ 
	            $(container).append(tags);
	        }
	        
			//删除工作经验、项目经验
			$(".remove").live("click",function(){
                Fun.remove($(this).attr("id"),$(this).attr("type"));
            });
            //显示修改项目经验
            $(".project-modify-btn").live("click",function(){
            	$(this).parents(".project-show-box").hide();
            	var id = $(this).attr("id");
            	var startDate = $(this).parents(".project-show-box").find(".startDate").html();
            	var endDate = $(this).parents(".project-show-box").find(".endDate").html();
            	var startDateYear = startDate.split("-")[0];
            	var startDateMonth = startDate.split("-")[1];
            	var endDateYear = endDate.split("-")[0];
            	var endDateMonth = endDate.split("-")[1];
            	var projectName = $(this).parents(".project-show-box").find(".showProjectName").html();
            	var projectPosition = $(this).parents(".project-show-box").find(".showProjectPosition").html();
            	var expContent = $(this).parents(".project-show-box").find(".showExpContent").attr("content");
            	$(this).parents(".project-show-box").next(".project-modify-box").append(
                    "<form id='project_" + id + "'>" +
                    	"<div class='remove-btn'><span class='remove' id='" + id + "' type='project'>删除</span></div>" +
                        "<table class='table-box' cellpadding='0' cellspacing='0'>" +
                            "<tr>" +
                                "<td class='w4'><span class='red'>*</span>时间：</td>" +
                                "<td>" +
                                	"<select class='fromYear'>" +
                                        "<option value=''>年</option>" +
                                    "</select>" +
                                    "<select class='fromMonth'>" +
                                        "<option value=''>月</option>" +
                                    "</select>" +
                                    "到" +
                                    "<select class='toYear'>" +
                                        "<option value=''>年</option>" +
                                    "</select>" +
                                    "<select class='toMonth'>" +
                                        "<option value=''>月</option>" +
                                    "</select>" +
                                "</td>" +
                                "<td align='right'><span class='btn-box project-save-btn' id='" + id + "'>保存</span></td>" +
                            "</tr>" +
                        "</table>" +
                        "<table class='table-box' cellpadding='0' cellspacing='0'>" +
                            "<tr>" +
                                "<td class='w4'><span class='red'>*</span>项目名称：</td>" +
                                "<td class='w5'>" +
                                    "<input class='input4 projectName' type='text' maxlength='30' value='" + projectName + "'>" +
                                "</td>" +
                                "<td class='w4'><span class='red'>*</span>项目职责：</td>" +
                                "<td>" +
                                    "<input class='input4 projectPosition' type='text' maxlength='30' value='" + projectPosition + "'>" +
                                "</td>" +
                            "</tr>" +
                        "</table>" +
	                    "<table class='table-box' cellpadding='0' cellspacing='0'>" +
                            "<tr>" +
                                "<td class='w4'><span class='red'>*</span>项目描述：</td>" +
                                "<td>" +
                                    "<textarea class='user-textarea expContent' maxlength='800'>" + expContent + "</textarea>" +
                                "</td>" +
                            "</tr>" +
                        "</table>" +
                        "<div class='line'></div>" +
                    "</form>"
            	);
				Fun.yearMonth(id,"project");
				$("#project_" + id).find(".fromYear").val(startDateYear);
				$("#project_" + id).find(".fromMonth").val(startDateMonth);
				$("#project_" + id).find(".toYear").val(endDateYear);
				$("#project_" + id).find(".toMonth").val(endDateMonth);
            });
            //显示修改工作经验
            $(".work-modify-btn").live("click",function(){
            	$(this).parents(".work-show-box").hide();
            	var id = $(this).attr("id");
            	var startDate = $(this).parents(".work-show-box").find(".startDate").html();
            	var endDate = $(this).parents(".work-show-box").find(".endDate").html();
            	var startDateYear = startDate.split("-")[0];
            	var startDateMonth = startDate.split("-")[1];
            	var endDateYear = endDate.split("-")[0];
            	var endDateMonth = endDate.split("-")[1];
            	var companyName = $(this).parents(".work-show-box").find(".showCompanyName").html();
            	var workPosition = $(this).parents(".work-show-box").find(".showWorkPosition").html();
            	var expContent = $(this).parents(".work-show-box").find(".showExpContent").attr("content");
            	$(this).parents(".work-show-box").next(".work-modify-box").append(
                	"<form id='work_" + id + "'>" +
	                	"<div class='remove-btn'><span class='remove' id='" + id + "' type='work'>删除</span></div>" +
	                    "<table class='table-box' cellpadding='0' cellspacing='0'>" +
	                        "<tr>" +
	                            "<td class='w4'><span class='red'>*</span>时间：</td>" +
	                            "<td>" +
	                            	"<select class='fromYear'>" +
	                                    "<option value=''>年</option>" +
	                                "</select>" +
	                                "<select class='fromMonth'>" +
	                                    "<option value=''>月</option>" +
	                                "</select>" +
	                                "到" +
	                                "<select class='toYear'>" +
	                                    "<option value=''>年</option>" +
	                                "</select>" +
	                                "<select class='toMonth'>" +
	                                    "<option value=''>月</option>" +
	                                "</select>" +
	                            "</td>" +
	                            "<td align='right'><span class='btn-box work-save-btn' id='" + id + "'>保存</span></td>" +
	                        "</tr>" +
	                    "</table>" +
	                    "<table class='table-box' cellpadding='0' cellspacing='0'>" +
	                        "<tr>" +
	                            "<td class='w4'><span class='red'>*</span>公司名称：</td>" +
	                            "<td class='w5'>" +
	                                "<input class='input4 companyName' type='text' maxlength='30' value='" + companyName + "'>" +
	                            "</td>" +
	                            "<td class='w4'><span class='red'>*</span>职位：</td>" +
	                            "<td>" +
	                                "<input class='input4 workPosition' type='text' maxlength='30' value='" + workPosition + "'>" +
	                            "</td>" +
	                        "</tr>" +
	                    "</table>" +
	                    "<table class='table-box' cellpadding='0' cellspacing='0'>" +
	                        "<tr>" +
	                            "<td class='w4'><span class='red'>*</span>工作描述：</td>" +
	                            "<td>" +
	                                "<textarea class='user-textarea workContent' maxlength='800'>" + expContent + "</textarea>" +
	                            "</td>" +
	                        "</tr>" +
	                    "</table>" +
	                    "<div class='line'></div>" +
                    "</form>"
            	);
				Fun.yearMonth(id,"work");
				$("#work_" + id).find(".fromYear").val(startDateYear);
				$("#work_" + id).find(".fromMonth").val(startDateMonth);
				$("#work_" + id).find(".toYear").val(endDateYear);
				$("#work_" + id).find(".toMonth").val(endDateMonth);
            });

            //保存工作经验
			$(".work-save-btn").live("click",function(){
				var id = $(this).attr("id"),
					companyName = $.trim($("#work_" + id +" .companyName").val()), 
					workContent = $("#work_" + id +" .workContent").val(),
			    	workPosition = $.trim($("#work_" + id +" .workPosition").val()),
			    	startDateYear = $("#work_" + id +" .fromYear").val(),
			        startDateMonth = $("#work_" + id +" .fromMonth").val(),
			        endDateYear = $("#work_" + id +" .toYear").val();
			        endDateMonth = $("#work_" + id +" .toMonth").val(),

			        startDate = startDateYear + "-" + startDateMonth + "-1",
					endDate = endDateYear + "-" + endDateMonth + "-1";

				var len = encodeURI(id+startDate+endDate+companyName+workPosition+workContent).length + 181;
				/*encodeURI("http://www.7road.com/website7road/exp/save.action?callback=work&exp.expType=work&exp.id=
					&exp.expName=&exp.expContent=&exp.workPosition=&exp.startDate=&exp.endDate=&_=1414747409886").length = 179*/

			    if(!startDateYear){
			    	alert("请填写开始年份");
			    }else if(!startDateMonth){
			    	alert("请填写开始月份");
			    }else if(!endDateYear){
			    	alert("请填写结束年份");
			    }else if(!endDateMonth){
			    	alert("请填写结束月份");
			    }else if(!companyName){
			    	alert("请填写公司名称");
			    }else if(!workPosition){
			    	alert("请填写职位");
			    }else if( !$.trim(workContent) ){
			    	alert("请填写工作描述");
			    }else{
			    	Fun.saveWork(id, startDate, endDate, companyName, workPosition, workContent);
			    }
			});

			//保存项目经验
			$(".project-save-btn").live("click",function(){
				var id = $(this).attr("id"),
					projectName = $.trim($("#project_" + id +" .projectName").val()),
					projectPosition = $.trim($("#project_" + id +" .projectPosition").val()),
			        expContent = $("#project_" + id +" .expContent").val(),
			        startDateYear = $("#project_" + id + " .fromYear").val(),
			        startDateMonth = $("#project_" + id + " .fromMonth").val(),
			        endDateYear = $("#project_" + id + " .toYear").val(),
			        endDateMonth = $("#project_" + id + " .toMonth").val(),

			        startDate = startDateYear + "-" + startDateMonth + "-1",
					endDate = endDateYear + "-" + endDateMonth + "-1";

				var len = encodeURI(id+startDate+endDate+projectName+projectPosition+expContent).length + 187;
				/*encodeURI("http://www.7road.com/website7road/exp/save.action?callback=project&exp.expType=project&exp.id=
					&exp.expName=&exp.workPosition=&exp.expContent=&exp.startDate=&exp.endDate=&_=1414748304103").length = 185*/

			    if(!startDateYear){
			    	alert("请填写开始年份");
			    }else if(!startDateMonth){
			    	alert("请填写开始月份");
			    }else if(!endDateYear){
			    	alert("请填写结束年份");
			    }else if(!endDateMonth){
			    	alert("请填写结束月份");
			    }else if(!projectName){
			    	alert("请填写项目名称");
			    }else if(!projectPosition){
			    	alert("请填写项目职责");
			    }else if(!$.trim(expContent)){
			    	alert("请填写项目描述");
			    }else{
			    	Fun.saveProject(id, startDate, endDate, projectName, projectPosition, expContent);
			    }
			});

			//撤消申请、收藏职位
			$(".canceled").live("click",function(){
				Fun.removeApplyCollect($(this).attr("id"), $(this).attr("type"));
			});

			//申请职位
			$(".apply").live("click",function(){
				Fun.applyJobs($(this).attr("id"));
			});

			//收藏职位
			$(".collect").live("click",function(){
				Fun.collectJobs($(this).attr("id"));
			});

			//人在七道向下按钮
			$(".down").on("click",function(){
				var h = $(".work-environment-title h2").offset().top;
				$("html,body").animate({scrollTop: h}, 500);
			});

			//工作经验、项目经验描述字数限制
			$(".workContent,.expContent").live("keyup",function(){
				if( $(this).html().length > 800 ){
					$(this).html($(this).html().substring(0,799));
				}
			});

			//个人简介字数限制
			$("#modifyProfile").live("keyup",function(){
				if( $(this).html().length > 400 ){
					$(this).html($(this).html().substring(0,399));
				}
			});

		},
		//登录验证
		checkLogin : function(){
	        $.ajax({
	        	url : "http://www.7road.com/website7road/user/checkLogin.action",
	        	type : "GET",
    			dataType : "jsonp",
    			success : function(data){
    				var pathname = window.location.pathname;
		            if(data.msg.success){
		                if(window.location.href.indexOf("url") > -1){
		                	window.location.href = window.location.href.split("url=")[1];
		                }else if(pathname == "/center/login.html" || pathname == "/center/reg.html" || pathname == "/center/reg1.html"){
		                	window.location.href = "http://hr.7road.com/center/resume.html";
		                }
		                //获取简历基本信息
		                if( pathname == "/center/resume.html" || pathname == "/center/reg2.html" ){
		                	Fun.getResume();//基本信息
		                	Fun.initTableList("work");//工作经验
							Fun.initTableList("project");//项目经验
		                }else if( pathname == "/center/applyRecord.html" ){
							Fun.getApplyCollect("apply");//申请职位记录
						}else if( pathname == "/center/collectRecord.html" ){
							Fun.getApplyCollect("collect");//收藏职位记录
						}else if( pathname == "/center/resetPassword.html" ){
							$("#resetPhoneNum").val(data.msg.obj);
						}
		                
		            	$(".logout-status").hide();
		                $(".login-status").show().find(".username").html(data.msg.obj);
		            }else{
		            	if(pathname == "/center/resume.html" || pathname == "/center/applyRecord.html" || pathname == "/center/resetPassword.html" || pathname == "/center/collectRecord.html"){
		                	window.location.href = "http://hr.7road.com/center/login.html";
		                }
		                $(".login-status").hide().find(".username").html("");
		                $(".logout-status").show();
		            }
    			}
	        });
		},
		//注销
		logout : function(){
			$.ajax({
				url : "http://www.7road.com/website7road/user/logout.action",
				type : "GET",
    			dataType : "jsonp",
    			success : function(data){
    				if(data.msg.code == 200){
						$(".login-status").hide().find(".username").html("");
		                $(".logout-status").show();
		                window.location.href = "http://hr.7road.com/center/login.html";
					}
    			}
	        });
		},
		//登录
		login : function(){
		    $.ajax({
		    	url : "http://www.7road.com/website7road/user/login.action",
		    	type : "GET",
    			dataType : "jsonp",
    			data : {"phoneNum":$('#loginPhoneNum').val(),"password":$("#loginPassword").val()},
    			success : function(data){
    				if(data.msg.code == 200){
			    		Fun.checkLogin();
			    	}else{
			    		Fun.msgFun("#loginPasswordMsg",data.msg.message);
			    	}
    			}
		    });
		},
		//错误提示
		msgFun : function(id,msgText){
			$(id).html("<span>" + msgText + "</span>");
		},
		//找回密码
		getPassWord : function(phoneNum, phoneCode){
			$.ajax({
				url : "http://www.7road.com/website7road/user/sendPass.action",
				type : "GET",
    			dataType : "jsonp",
    			data : { "phoneNum" : phoneNum, "phoneCode" : phoneCode },
    			success : function(data){
    				if(data.msg.code == 200){
				    	$("#phoneCodeMsg").html("");
				    	alert(data.msg.message);
				    	window.location.href = "http://hr.7road.com/center/login.html";
				    }else{
				    	Fun.msgFun("#phoneCodeMsg",data.msg.message);
				    }
    			}
			});
		},
		//重置密码
		resetPassWord : function( resetPhoneNum, resetPassword, resetNewPassword ){
			$.ajax({
				url : "http://www.7road.com/website7road/user/resetPassword.action",
				type : "GET",
    			dataType : "jsonp",
    			data : { "phoneNum" : resetPhoneNum, "password" : resetPassword, "newPassword" : resetNewPassword },
    			success : function(data){
    				if(data.msg.code == 200){
				    	alert(data.msg.message);
				    	Fun.logout();
				    }else{
				    	if(data.msg.message == "原密码错误"){
				    		Fun.msgFun("#resetPasswordMsg",data.msg.message)
				    	}else{
				    		Fun.msgFun("#resetConfirmNewPasswordMsg",data.msg.message);
				    	}
				    }
    			}
			});
		},
		//获取基本信息
		getResume : function(){
			$.ajax({
				url : "http://www.7road.com/website7road/user/createResume.action",
				type : "GET",
    			dataType : "jsonp",
    			success : function(data){
			        if(data.message.success){
			        	//简历展示
			            $("#showUsername").html(data.message.obj.phoneNum);//用户名（手机号码）
			            $("#showRealName").html(data.message.obj.realName);//姓名
			            $("#showEmail").html(data.message.obj.emailAddr);//Email
			            $("#showSex").html(data.message.obj.genderName);//性别
			            if( data.message.obj.marryStatuName != "请选择" ){
			            	$("#showMarry").html(data.message.obj.marryStatuName);//婚姻状况
			            }
			            $("#showProfessional").html(data.message.obj.majorName);//专业
			            if( data.message.obj.educationDegreeName != "请选择" ){
			            	$("#showEducation").html(data.message.obj.educationDegreeName);//学历
			            }
			            $("#showSchool").html(data.message.obj.schoolName);//毕业院校
			            if( data.message.obj.workYearName != "请选择" ){
			            	$("#showWorkYear").html(data.message.obj.workYearName);//工作年限
			            }
			            if( data.message.obj.englishDegreeName != "请选择" ){
			            	$("#showEnglishDegree").html(data.message.obj.englishDegreeName);//英语等级
			            }
			            if(data.message.obj.briefIntroduction){
			            	$("#showProfile").html(data.message.obj.briefIntroduction.replace(/\n/g,"<br>").replace(/\s/g,"&nbsp;"));//个人简介
			            }

			            //简历修改
			            $("#modifyUsername").val(data.message.obj.phoneNum);//用户名（手机号码）
			            $("#modifyRealName").val(data.message.obj.realName);//姓名
			            $("#modifyEmail").val(data.message.obj.emailAddr);//Email
			            $("input[name='modifySex']").each(function(){//性别
			                if($(this).val() == data.message.obj.gender) {
			                    $(this).attr("checked", "checked");
			                }
			            });
			            $("#modifyMarry option").each(function(){//婚姻状况
			                if($(this).val() == data.message.obj.marryStatu){
			                    $(this).attr("selected", "selected");
			                }
			            });
			            $("#modifyProfessional").val(data.message.obj.majorName);//专业
			            $("#modifyEducation option").each(function(){//学历
			                if($(this).val() == data.message.obj.educationDegree){
			                    $(this).attr("selected", "selected");
			                }
			            });
			            $("#modifySchool").val(data.message.obj.schoolName);//毕业院校
			            $("#modifyWorkYear option").each(function(){//工作年限
			                if($(this).val() == data.message.obj.workYear){
			                    $(this).attr("selected", "selected");
			                }
			            });
			            $("#modifyEnglishDegree option").each(function(){//英语等级
			                if($(this).val() == data.message.obj.englishDegree){
			                    $(this).attr("selected", "selected");
			                }
			            });
			            $("#modifyProfile").html(data.message.obj.briefIntroduction);//个人简介
			        }else{
			            window.location.href = "http://hr.7road.com/center/login.html";
			        }
		        }
		    });
		},
		//删除工作经验、项目经验
		remove : function(id, type){
		    $.ajax({
		    	url : "http://www.7road.com/website7road/exp/remove.action",
		    	type : "GET",
		    	dataType : "jsonp",
		    	data : {"exp.id": id},
		    	success : function(data){
		    		alert(data.message.message);
		    		if (data.message.success){
			            Fun.initTableList(type);
			        }
		    	}
		    });
		},
		//保存基本信息
		submitInfo : function( realName, gender, phoneNum, educationDegree, schoolName, emailAddr, marryStatu, englishDegree, workYear, majorName, briefIntroduction ){
			$.ajax({
				url : "http://hr.7road.com/website7road/user/saveResume.action",
				type : "POST",
				data : {
						'resume.realName':realName,'resume.gender':gender,'resume.phoneNum':phoneNum,
						'resume.educationDegree':educationDegree,'resume.schoolName':schoolName,'resume.emailAddr':emailAddr,
						'resume.marryStatu':marryStatu,'resume.englishDegree':englishDegree,'resume.workYear':workYear,
						'resume.majorName':majorName,'resume.briefIntroduction':briefIntroduction,'type':'info'
				},
				success : function(data){
					if(data.message.code == 200){
						$(".basic-info-modify").hide();
            			$(".basic-info-show").show();
						$("#showUsername").html(data.message.obj.phoneNum);//用户名（手机号码）
			            $("#showRealName").html(data.message.obj.realName);//姓名
			            $("#showEmail").html(data.message.obj.emailAddr);//Email
			            $("#showSex").html(data.message.obj.genderName);//性别
			            $("#showMarry").html(data.message.obj.marryStatuName);//婚姻状况
			            $("#showProfessional").html(data.message.obj.majorName);//专业
			            $("#showEducation").html(data.message.obj.educationDegreeName);//学历
			            $("#showSchool").html(data.message.obj.schoolName);//毕业院校
			            $("#showWorkYear").html(data.message.obj.workYearName);//工作年限
			            $("#showEnglishDegree").html(data.message.obj.englishDegreeName);//英语等级
			            $("#showProfile").html(data.message.obj.briefIntroduction.replace(/\n/g,"<br>").replace(/\s/g,"&nbsp;"));//个人简介
					}
				}
			});
		},
		//获取工作经验、项目经验
		initTableList : function(type){
		    $.ajax({
		    	url : "http://www.7road.com/website7road/exp/list.action",
		    	type : "GET",
		    	dataType : "jsonp",
		    	data : {"exp.expType": type},
		    	success : function(data){
			        if(data.message.obj == null || data.message.obj.length < 1) {
			        	if(type == 'work'){
			        		$(".work-list").empty().append("<div class='nothing-box'>还没填写工作经验</div>");
			        		$(".add-work").text("添加工作经验");
			        	}else if(type == 'project'){
			        		$(".project-list").empty().append("<div class='nothing-box'>还没填写项目经验</div>");
			        		$(".add-project").text("添加项目经验");
			        	}
			        }else{
			            if(type == 'work'){
			            	$(".work-list").empty();
			                $.each(data.message.obj, function (index, item){
			                	var startDate = item.startDate.split("-")[0] + "-" + item.startDate.split("-")[1],
			                		endDate = item.endDate.split("-")[0] + "-" + item.endDate.split("-")[1];
			                    $(".work-list").append(
			                    	"<div class='work-show-box'>"+
				                    	"<table class='table-box' cellpadding='0' cellspacing='0'>"+
		                                    "<tr>" +
		                                        "<td class='w4'>时间：</td>" +
		                                        "<td><span class='startDate'>" + startDate + "</span> 到 <span class='endDate'>" + endDate + "</span></td>" +
		                                        "<td align='right'><span class='btn-box work-modify-btn' id='" + item.id + "'>修改</span></td>" +
		                                    "</tr>" +
			                            "</table>" +
			                            "<table class='table-box' cellpadding='0' cellspacing='0'>" +
		                                    "<tr>" +
		                                        "<td class='w4'>公司名称：</td>" +
		                                        "<td class='w5 showCompanyName'>" + item.expName + "</td>" +
		                                        "<td class='w4'>职位：</td>" +
		                                        "<td class='showWorkPosition'>" + item.workPosition + "</td>" +
		                                    "</tr>" +
		                                "</table>" +
	                    				"<table class='table-box' cellpadding='0' cellspacing='0'>" +
		                                    "<tr>" +
		                                        "<td class='w4'>工作描述：</td>" +
		                                        "<td class='showExpContent' content='" + item.expContent + "'>" + 
		                                        	item.expContent.replace(/\n/g,"<br>").replace(/\s/g,"&nbsp;") + 
		                                        "</td>" +
		                                    "</tr>" +
			                            "</table>" +
			                            "<div class='line'></div>" +
			                        "</div>" + 
			                        "<div class='work-modify-box'></div>"
			                    );
			                });
							$(".add-work").text("继续添加");
			            }else if(type == 'project'){
			            	$(".project-list").empty();
			                $.each(data.message.obj, function (index, item){
			                	var startDate = item.startDate.split("-")[0] + "-" + item.startDate.split("-")[1],
			                		endDate = item.endDate.split("-")[0] + "-" + item.endDate.split("-")[1];
			                    $(".project-list").append(
			                    	"<div class='project-show-box'>"+
				                    	"<table class='table-box' cellpadding='0' cellspacing='0'>" +
		                                    "<tr>" +
		                                        "<td class='w4'>项目时间：</td>" +
		                                        "<td><span class='startDate'>" + startDate + "</span> 到 <span class='endDate'>" + endDate + "</span></td>" +
		                                        "<td align='right'><span class='btn-box project-modify-btn' id='" + item.id + "'>修改</span></td>" +
		                                    "</tr>" +
		                                "</table>" +
		                                "<table class='table-box' cellpadding='0' cellspacing='0'>"+
		                                    "<tr>" +
		                                        "<td class='w4'>项目名称：</td>" +
		                                        "<td class='w5 showProjectName'>" + item.expName + "</td>" +
		                                        "<td class='w4'>项目职责：</td>" +
		                                        "<td class='showProjectPosition'>" + item.workPosition + "</td>" +
		                                    "</tr>" +
		                                "</table>" +
	                    				"<table class='table-box' cellpadding='0' cellspacing='0'>" +
		                                    "<tr>" +
		                                        "<td class='w4'>项目描述：</td>" +
		                                        "<td class='showExpContent' content='" + item.expContent + "'>" + 
		                                        	item.expContent.replace(/\n/g,"<br>").replace(/\s/g,"&nbsp;") + 
		                                        "</td>" +
		                                    "</tr>" +
			                            "</table>" +
			                            "<div class='line'></div>" +
			                        "</div>" +
			                        "<div class='project-modify-box'></div>"
			                    );
			                });
							$(".add-project").text("继续添加");
			            }
			            
			        }
			        

		        }
		    });
		},
		//保存工作经验
		saveWork : function(id, startDate, endDate, companyName, workPosition, workContent){
			$.ajax({
			    url : "http://hr.7road.com/website7road/exp/save.action", 
			    type : "POST",
			    data : {
			    	"exp.expType": 'work',
			        "exp.id": id,
			        "exp.expName": companyName,
			        "exp.expContent": workContent,
			        "exp.workPosition": workPosition,
			        "exp.startDate": startDate,
			        "exp.endDate": endDate
			    },
			    success : function(data){
			        alert(data.message.message);
			        if(data.message.code == 200){
			        	Fun.initTableList("work");
			        	$(".add-work").parent().show();
			        }
			    }

			});
		},
		//保存项目经验
		saveProject : function(id, startDate, endDate, projectName, projectPosition, expContent){
			
			$.ajax({
			    url : "http://hr.7road.com/website7road/exp/save.action",
			    type : "POST",
			    data : {
			    	"exp.expType": 'project',
			        "exp.id": id,
			        "exp.expName": projectName,
			        "exp.workPosition": projectPosition,
			        "exp.expContent": expContent,
			        "exp.startDate": startDate,
			        "exp.endDate": endDate
			    },
			    success : function(data){
			        alert(data.message.message);
			        if(data.message.code == 200){
			        	Fun.initTableList("project");
			        	$(".add-project").parent().show();
			        }
			    }
			});
		},
		//获取已经申请收藏的职位
		getApplyCollect : function(type){
			$.ajax({
				url : "http://www.7road.com/website7road/job/list.action",
				type : "GET",
				dataType : "jsonp",
				data : {"jobApply.applyType":type},
				success : function(data){
					if(type == "apply"){
						$("#apply-jobs-list").empty();
						if(data.msg.code == 200){
			                $.each(data.msg.obj, function (index, item) {
			                	var trClass = "odd";
			                	if(index % 2 == 0){
			                		trClass = "even";
			                	}
			                    $("#apply-jobs-list").append(
			                    	"<tr class='" + trClass + "'>" +
		                                "<td class='l'><a href='http://hr.7road.com/hr/page/" + item.id + ".html' target='_blank'>" + item.positionName + "</a></td>" +
		                                "<td>" + item.positionTypeName + "</td>" +
		                                "<td>" + item.positionPlace + "</td>" +
		                                "<td>" + item.applyDate + "</td>" +
		                                "<td class='s'>" + item.statusName + "</td>" +
		                                "<td class='blue'><span class='canceled' type='apply' id='" + item.id +"'>撤销</span></td>" +
		                            "</tr>"
			                    );
			                });
			            }else{
		                	$("#apply-jobs-list").append(
		                    	"<tr>" +
	                                "<td colspan='6'><div class='no-record'>没有申请记录</div></td>" +
	                            "</tr>"
			                );
		                }
		            }else if(type == "collect"){
		            	$("#collect-jobs-list").empty();
		            	if(data.msg.code == 200){
		            		$.each(data.msg.obj, function (index, item) {
			                	var trClass = "odd";
			                	if(index % 2 == 0){
			                		trClass = "even";
			                	}
			                    $("#collect-jobs-list").append(
			                    	"<tr class='" + trClass + "'>" +
		                                "<td class='l'><a href='http://hr.7road.com/hr/page/" + item.id + ".html' target='_blank'>" + item.positionName + "</a></td>" +
		                                "<td>" + item.positionTypeName + "</td>" +
		                                "<td>" + item.positionPlace + "</td>" +
		                                "<td>" + item.applyDate + "</td>" +
		                                "<td class='s'>" + item.statusName + "</td>" +
		                                "<td class='blue'><span class='canceled' type='collect' id='" + item.id +"'>撤销</span></td>" +
		                            "</tr>"
			                    );
			                });
		            	}else{
		                	$("#collect-jobs-list").append(
		                    	"<tr>" +
	                                "<td colspan='6'><div class='no-record'>没有收藏记录</div></td>" +
	                            "</tr>"
			                );
		                }
		            }
				}
	        });
		},
		//撤消已经申请收藏的职位
		removeApplyCollect : function(id, type){
			$.ajax({
				url : "http://www.7road.com/website7road/job/remove.action",
				type : "GET",
				dataType : "jsonp",
				data : {"jobApply.jobId":id,"jobApply.applyType":type},
				success : function(data){
					alert("撤消成功");
					if(type == "apply"){
						Fun.getApplyCollect("apply");
					}else if(type == "collect"){
						Fun.getApplyCollect("collect");
					}
				}
		    });
		},
		//申请职位
		applyJobs : function(id){
			$.ajax({
				url : "http://www.7road.com/website7road/job/apply.action",
				type : "GET",
				dataType : "jsonp",
				data : {"jobApply.jobId":id,"jobApply.applyType":"apply"},
                success : function(data){
                    alert(data.msg.message);
                    if( data.msg.code == 200 ){
                    	window.location.href = "http://hr.7road.com/center/applyRecord.html";
                    }else if( data.msg.code == 201 ){
                    	window.location.href = "http://hr.7road.com/center/login.html?url=" + window.location.href;
                    }else if( data.msg.code == 204 ){
                    	window.location.href = "http://hr.7road.com/center/resume.html";
                    }
                }
            });
		},
		//收藏职位
		collectJobs : function(id){
			$.ajax({
				url : "http://www.7road.com/website7road/job/collect.action",
				type : "GET",
				dataType : "jsonp",
				data : {"jobApply.jobId":id,"jobApply.applyType":"collect"},
                success : function(data){
                    alert(data.msg.message);
                    if( data.msg.code == 200 ){
                    	window.location.href = "http://hr.7road.com/center/collectRecord.html";
                    }else if( data.msg.code == 201 ){
                    	window.location.href = "http://hr.7road.com/center/login.html?url=" + window.location.href;
                    }else if( data.msg.code == 204 ){
                    	window.location.href = "http://hr.7road.com/center/resume.html";
                    }
                }
            });
		},
		//创建年份和月份
		yearMonth : function(id,type){
            //年份
            var y = new Date().getFullYear();
            $("#" + type + "_" + id).find(".fromYear,.toYear").empty().append("<option value=''>年</option>");
            $("#" + type + "_" + id).find(".fromMonth,.toMonth").empty().append("<option value=''>月</option>");
            for(var i=y; i>(y-40); i--){
                $("#" + type + "_" + id).find(".fromYear,.toYear").append("<option value=" + i +">" + i + "</option>");
            }
            //月份
            for(var i=1; i<13; i++){
            	if(i < 10){
            		i = "0" + i;
            	}
                $("#" + type + "_" + id).find(".fromMonth,.toMonth").append("<option value=" + i +">" + i + "</option>");
            }
        },
        //重新获取短信验证码
        againGetPhoneVerificationCode : function(time){
        	if( time > 0 ){
        		$(".get-phone-verification-code").attr({"id":"","disabled":"disabled"}).html("短信验证码已发送(" + time + ")");
        		time--;
        	}else{
        		$(".get-phone-verification-code").attr("id","getPhoneVerificationCode").removeAttr("disabled").html("获取短信验证码");
        		return false;
        	}
        	setTimeout(function(){
            	Fun.againGetPhoneVerificationCode(time);
            },
            1000);
        }


	};



	//初始化
	Fun.init();
	Fun.checkLogin();	
	Fun.yearMonth(0,"work");
	Fun.yearMonth(0,"project");
	

});


