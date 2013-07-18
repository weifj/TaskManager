var msgBox = function($scope,  $element){};
$(function(){
	$.ajax({
		url:"msgInterceptor",
		type:"POST",
		success:function(task){
			msgBox.title=task.taskName;
			
			
			msgBox.MsgCount=task.MsgCount;
			
		}
	
	});
	if(!$(".msg").is(":hidden")){
		$(".msg").animate({bottom:0},2000);
	}
	//消息框消失
	$(".msgClose").click(function(){
        $(this).parents(".span3.bg-color-blue.msg").animate({
            opacity: "hide"
        }, "slow");		   
	});
	
	//不再提示
	$(".neverShow").click(function(){
		var _self=this;
		$.get('doUpdateMsgTask', function(data){
			$(_self).parents(".span3.bg-color-blue.msg").animate({
	            opacity: "hide"
	        }, "slow");	
		});
	});
});

angular.bootstrap(document.documentElement);