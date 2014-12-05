
//下拉菜单
$('.menu ul li').each(function(i){
	$(this).hover(function(e){
		$(this).addClass('curr');
		$(this).find('.subMenuWrap').show();
	},function(){
		$(this).removeClass('curr');
		$(this).find('.subMenuWrap').hide();
	})
});

//大事件年份切换
$(".eventNav a").live("click",function(){
    var li = $(".eventList ul li");
    $(this).addClass("on").siblings("a").removeClass("on");
    li.removeClass("curr").hide();

    for(var i=0;i<$(this).length;i++){
        if($(this).eq(i).hasClass("on")){
            year = $(this).eq(i).text();
        }
    }
    if(year == "全部大事件"){
        li.show().eq(0).addClass("curr");
    }else{
        $("[year='"+year+"']").show().eq(0).addClass("curr");
    }
});

//内页左侧菜单边框
var leftSideBarLi = $(".leftSideBar ul li");
if($(".leftSideBar ul li").length > 3){
    $(".leftSideBar ul li:last").css("border","none");
}
$(window,document).scroll(function(){
	var sTop = $(document).scrollTop();
	var _meth = sTop>220? "addClass" : "removeClass";
	$(".leftSideBar")[_meth]("fixed");

});

//大事件列表页
$(".eventNav a").hover(function(){
    (function(){
        var ul = $(".eventList ul");
        for(var j=0;j<ul.length;j++){
            if(!ul.eq(j).is(":hidden")){
                var flag = false;
                var dls = ul.eq(j).find("li");
                for(var i=0;i<dls.length;i++){
                    dls[i].onmouseover = function(){
                        if(flag){
                            if(flag == this) return;
                            flag.className = '';
                        }
                        flag = this;
                        flag.className = 'curr';
                    }
                }
                dls[0].onmouseover();
            }
        }
    }());
});
$(".eventNav a").eq(0).mouseover();
