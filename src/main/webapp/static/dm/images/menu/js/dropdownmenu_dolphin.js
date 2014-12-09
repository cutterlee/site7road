//下拉菜单
$(document).ready(function() {	
	var getObj = $('div.dorpmenu_dolphin');
	getObj.each(function(id) {
		var obj = this.id;
		var n=parseInt(obj.substr(16));

		$("#"+obj).mouseover(function () {
			if($("div#subdorpmenu_dolphin"+n)[0].style.display!="block"){
				$("div.subdorpmenu_dolphin").hide();
			}
			$("div#subdorpmenu_dolphin"+n)[0].style.top=$("#"+obj)[0].offsetTop+$("#"+obj)[0].offsetHeight+"px";
			$("div#subdorpmenu_dolphin"+n).show();

			if(id==0){
				$("div#subdorpmenu_dolphin"+n)[0].style.left=$("#"+obj)[0].offsetLeft+1 + "px";
			}else{
				$("div#subdorpmenu_dolphin"+n)[0].style.left=$("#"+obj)[0].offsetLeft + "px";
			}		
		});
		$("#"+obj).mouseout(function () {
			$('#dorpmenu'+n)[0].className="dorpmenu_dolphin";
			if(!$("div#subdorpmenu_dolphin"+n).is(':hidden'))
			$('div#subdorpmenu_dolphin'+n).hide();
		});
	});
	
	var Obj = $('div.subdorpmenu_dolphin');
	Obj.each(function(id) {

		var oid = this.id;
		var n=parseInt(oid.substr(19));
		$("#"+oid).mouseover(function () {
			$('#dorpmenu'+n)[0].className="dorpmenu_dolphin_current";
			$("div#subdorpmenu_dolphin"+n)[0].style.display="block";
		});

		$("#"+oid).mouseout(function () {
			$('#dorpmenu'+n)[0].className="dorpmenu_dolphin";
			if(!$("div#subdorpmenu_dolphin"+n).is(':hidden'))
			$('div#subdorpmenu_dolphin'+n).hide();
		});
	});
	var ie = /*@cc_on!@*/!1;
	if(!ie)
		$('.subdorpmenu_dolphin ul').css('margin-left','2px');
});