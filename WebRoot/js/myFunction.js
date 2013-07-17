$(function(){
	//浮现消息框
	if(!$(".msg").is(":hidden")){
		$(".msg").animate({bottom: "0px"}, "4000");
	}
	//消息框消失
	$(".icon-cancel-2").click(function(){
        $(this).parents(".span4.bg-color-blue.msg").animate({
            opacity: "hide"
        }, "slow");		   
	});
	//不再提示
	$(".span1.neverShow").click(function(){
		var _self=this;
		$.get('doUpdateMsgTask', function(data){
			$(_self).parents(".span4.bg-color-blue.msg").animate({
	            opacity: "hide"
	        }, "slow");	
		});
		
	});
})