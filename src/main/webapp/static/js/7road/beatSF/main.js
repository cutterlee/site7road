(function(){
	
	var Roll = function (id,options) {

		var op = $.extend({ delay:3000,speed:1000,currentLeft:0, singleDis:114,count:7,
			items:"li",currentClass:".current"}, options);	

		this.initialize(id,op);
	};


		

	Roll.prototype = {
		initialize: function (id,options)
		{
			var oThis = this;
			this.op = options;
			this.oBox = $('#'+id);
			this.oLi = $(this.op.items, this.oBox);
			this.timer = null;
			this.autoTimer = null;
			this.currentLeft = this.op.currentLeft;
			this.singleDis = this.op.singleDis;
			this.roller = $('ul', this.oBox);
			this.count = this.op.count;
			this.speed = options.speed;	
			this.direction = 'next';
			this.next();			
			this.toggle();

			this.autoTimer = setInterval(function ()
			{
				oThis.next();
				oThis.toggle()
				
			}, this.op.delay);	

			this.oBox.mouseover(function(){
				
				clearInterval(oThis.autoTimer)
			});
			this.oBox.mouseout(function(){
				
				oThis.autoTimer = setInterval(function ()
				{
					oThis.next();
					oThis.toggle()
				}, oThis.op.delay)	
			});

		},
		toggle: function ()
		{

			this.roller.animate({'left':this.currentLeft}); 
			
		},
		next: function ()
		{
			if(Math.abs(this.currentLeft) == Math.abs( parseInt(this.count)*parseInt(this.singleDis))){
				this.direction = 'prev';
			}

			if(Math.abs(this.currentLeft) == 0){
				this.direction = 'next';
			}
			this.direction == 'next'?this.currentLeft-=this.singleDis:this.currentLeft += this.singleDis;

		}
	};

	if($('#livePicRoll li').length>7){
		new Roll('livePicRoll');
	}

	


	$.fn.extend({

		hoverClass: function(className){
			var _className = className || "hover";
			return this.each(function(){
				$(this).hover(function(){
					$(this).addClass(_className);
				},function(){
					$(this).removeClass(_className);
				});
			});
		},
		focusClass: function(className){
			var _className = className || "textInputFocus";
			return this.each(function(){
				$(this).focus(function(){
					$(this).addClass(_className);
				}).blur(function(){
					$(this).removeClass(_className);
				});
			});
		},
		inputAlert: function(){
//			var isIE = /msie/i.test(navigator.userAgent);
//			var isIE10 = isIE && (function() {"use strict";return this === undefined;}());
//
//			if(!isIE || isIE10){
//				return;
//			}

			return this.each(function(){
				
				var $this = $(this);
				var altStr = $.trim($this.attr("alt"));
				var type = $this.attr("type");
				var isEmpty = function(){
					return (!$this.val() || $.trim($this.val()) == altStr);
				};

				if (isEmpty()){ 
					$this.val(altStr);

				}
				if(type=="password"){
					
	    	        var frag = $('<div></div>');
	    	        var html = frag.append($this.clone()).html();
	    	        html = html.replace('password','txt');	
	    	        frag = null;	
	    	        $this.hide();				
					$this.after(html);
					$this.next().attr('id',$this.attr('id')+'1').val(altStr);
					$this.next().focus(function(){
						$(this).hide().prev().show().focus();
					});						
				}
			
				$this.focus(function(){
					$this.addClass("focus");
					if(type=="password"){
						$this.show();
						$this.next().hide();					
					}
	
					if (isEmpty()) $this.val("");
				}).blur(function(){
					if (isEmpty()) {
						$this.val(altStr);
						if(type=="password"){
							$this.hide();
							$this.next().show();								
						}
					
					}
					$this.removeClass("focus");
				});		
			});
		},
		isTag:function(tn) {
			if(!tn) return false;
			return $(this)[0].tagName.toLowerCase() == tn?true:false;
		}
				
	});


	var beat = {
			actionUrl:"http://www.7road.com/website7road",
		    lockScreen:function(flag){
    			 flag?$('#background').height($(document).height()).show():$('#background').hide();
    		},
     		showbox:function(id){
                var box = $('#'+id);
                box.show().addClass('bounceIn');
                setTimeout( function(){
                    box.removeClass('bounceIn')},
                    1300
                );

                this.lockScreen(true);
                box.find('.pop-close').on('click',function(){
                    beat.lockScreen(false);
                    box.hide();        
                });    			
    		},
    		trim:function(str){
    			return str.replace(/(^\s*)|(\s*$)|\r|\n/g, "");
    		},    		
    		isValidMail:function(str){
    			return(new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(beat.trim(str)));
    		},
    		isPhone:function(str) {
    			return (new RegExp(/(^([0-9]{3,4}[-])?\d{3,8}(-\d{1,6})?$)|(^\([0-9]{3,4}\)\d{3,8}(\(\d{1,6}\))?$)|(^\d{3,8}$)/).test(beat.trim(str)));
    		},
    		isUrl:function(str){
    			var strRegex = "((http|https|ftp)://)?[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&amp;*+?:_/=<>]*)?";   			
    			return (new RegExp(strRegex).test(beat.trim(str)));
    		},
    		alert:function(text,type,opts){
    			var html = '<div class="ui-tiptext-container ui-tiptext-container-#type# fn-hide"><p class="ui-tiptext ui-tiptext-#type#"><i class="ui-tiptext-icon iconfont">&#xF046;</i>#text#</p></div>';
    			html = html.replace('#type#',type).replace('#type#',type).replace('#text#',text);
				$('body').append(html);
				var tip = $('div.ui-tiptext-container').last();
    			if(opts.obj){
    				
    			}else{
    				tip.css({
    					top:parseInt($(window).height()/2) - 100,
    					left:(parseInt($(window).width()) - tip.width())/2
    				});
    				tip.fadeIn('slow');
    			}
    			if(opts.time){
    				setTimeout(function(){
    					tip.fadeOut('slow',function(){tip.remove()});
    				},opts.time*1000);
    			}
    		},
    		bindInform:function($sub){
    			
    			$sub.click(function(){
    				$(this).hide();
					var that = this;
    				setTimeout(function(){$(that).show()},3000);
    				var flag = true;
    				var box = $('#inform-box');
    				var urlArray = [], urls = $('input[name=reportUrl]',box), urls0 = urls.first();
    				if(!urls0.val() || urls0.val() == urls0.attr('alt')){
    					flag = false;
    					beat.alert("您尚未填写举报的网址!",'error',{time:2});
    					return flag;
    				}
    				
    				for(var i=0; i < urls.length; i++){
    					var obj = urls[i];
    					
    					if(obj.value && !beat.isUrl(obj.value)){
    						beat.alert("您填写的网址格式不正确!",'error',{time:2});
    						flag = false;
    						break;
    					}
    					
    					if(obj.value.length>50){
    						beat.alert("网址超出长度限制!",'error',{time:2});
    						flag = false;
    						break;				
    					}
    					urlArray.push($.trim(obj.value));			
    				}

    				
    				if(!flag){
    					return;
    				}
    				
						var captcha = $('input[name=captcha]',box);
						if(!captcha.val()){
							flag = false;
							beat.alert('您尚未填写验证码', 'error', {time:2});
							return flag;
						}

						if(captcha.val().length < 4){
							beat.alert('验证码位数太小', 'error', {time:2});
							return flag = false;
						}

    				
    				var obj = $('input[name=reportObject]',box);
    				if(!obj.val() || obj.val() == obj.attr('alt')  ){
    					flag = false;
    					beat.alert("您尚未填写侵权人信息",'error',{time:2});
    					return flag;
    				}
    				
    				if(obj.val().length <2 || obj.val().length > 50){
    					beat.alert("侵权人信息太短或超出长度限制！",'error',{time:2});
    					flag = false;
    					return flag;
    				}
    				
    				var reason = $('textarea[name=reportReason]',box);
    				if(!reason.val() || reason.val() == reason.attr('alt')){
    					flag = false;
    					beat.alert("您尚未填写举报理由",'error',{time:2});
    					return flag;
    				}
    				
    				if(reason.val().length <4 || reason.val().length >200){
    					beat.alert("举报理由太短或超出长度限制！",'error',{time:2});
    					flag = false;
    					return flag;			
    				}
    				var email = $('input[name=reportEmail]',box);
    				if(!email.val() || email.val() == email.attr('alt')){
    					flag = false;
    					beat.alert("您尚未填写邮箱地址！",'error',{time:2});
    					return flag;
    				}
    				
    				if(!beat.isValidMail(email.val())){
    					flag = false;
    					beat.alert("邮箱地址格式不正确！",'error',{time:2});
    					return flag;			
    				}
    				
    				if(email.val().length>50){
    					flag = false;
    					beat.alert("邮箱地址超出长度限制！",'error',{time:2});
    					return flag;			
    				}
    				
    				if(!flag){
    					return;
    				}
    				
    				var action = beat.actionUrl+"/beatSF/createSubmit.action?time="+new Date().getTime().toString();
    				var params = {
    						url:urlArray,
								captcha: captcha.val(),
    						reportReason:$.trim(reason.val()),
    						reportEmail:$.trim(email.val()),
    						reportObject:$.trim(obj.val())
    				};
						params = $.param(params, true)
    				$.post(action,params,function(data){
    					if(data.code == '1'){
    						
    						box.find('.pop-close').click();
    						box.find('.text,.textarea').each(function(i,obj){
    							$(obj).val($(obj).attr('alt'));
    						});
    						beat.alert("提交成功！感谢您的参与",'success',{time:3});
    						
    					} else {
								beat.alert(data.msg, 'error', {time:2});
								$("#captcha").click();
							}
    				});    				
    			});
    		}
   		
	};


	$('#inform-box .text,#inform-box .textarea').inputAlert();

	$('#inform-btn').click(function(){
		window.scroll('top',0);
		beat.showbox('inform-box');
		$('#captcha').attr('src', 'http://www.7road.com/website7road/captcha.do?' + new Date().getTime().toString());
		return false;
	});

	$('#inform-add').click(function(){
		var lists = $('#inform-box .add-item');
		if(lists.length == 9){
			$(this).hide();
		}

		var clone = $(lists).last().clone();
		clone.find('input').val("");
		lists.last().after(clone);

		$(this).css('top',parseInt($(this).css('top'))+32);
	});

	beat.bindInform($('#inform-sub'));
	
	
	
	function ajaxFunction(url,isAsync,param,successFn,errorFn){
		$.ajax({
			url:url,
			type:"post",
			data:param,
			async:isAsync,
			timeout:5000,
			headers:{
				"isAjaxRequest":"true"
			},
			success:function(data, textStatus, jqXHR){
				successFn(data,textStatus,jqXHR);
			},
			error:function(jqXHR, textStatus, errorThrown){
				if(errorFn){
					errorFn(jqXHR, textStatus, errorThrown);
				}
				else{
					alert("链接超时,请稍后再试");
				}	
			}


		})
	}
	
	function escNavGameUrl(){
        $(".g01").attr("href","http://sq.7road.com/");
    }
	
	 //退出登录
    $("#login-out").on("click",function(){
        var result = confirm('确认退出吗？');
        if(result == true){
            ajaxFunction("http://www.7road.com/website7road/indexLogout.action",true,{},function(data){
				 $("body").append(data.bbsData);
				  //同步顶部
				$(".topLoginInfo").show();
				$(".topLoginedInfo").hide();
				//成功之后更改导航下拉游戏的链接
				escNavGameUrl();
			})
        }else{
            return false;
        }

    });
	

	 $("textarea[maxlength]").keyup(function(){ 
         var area=$(this); 
         var max=parseInt(area.attr("maxlength"),10);   //获取maxlength的值 
         if(max>0){ 
            if(area.val().length>max){                 //textarea的文本长度大于maxlength 
                 area.val(area.val().substr(0,max));    //截断textarea的文本重新赋值             
             } 
        } 
     }); 
	
	
	

})();
