<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="head.jsp" flush="true">
	<jsp:param name="title" value="用户管理前台-任务展示" />
</jsp:include>
 	<div class="container">
		<div id="content" class="span10">
				<div>
					<ul class="breadcrumb">
						<li><a href="http://localhost:8080/TaskManager">前台管理</a> <span class="divider">/</span></li>
						<li><a href="#">添加任务</a></li>
					</ul>
				</div>
				<div class="row-fluid sortable ui-sortable">
					<div class="box span12">
						<div class="box-header well">
							<h2>
								<i class="icon-edit"></i>添加任务
							</h2>
							<div class="box-icon">
								<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a> <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
							</div>
						</div>
						<div class="box-content">
							<form class="form-horizontal" action="admin/add" method="post">
								<fieldset>
									<div class="control-group ">
										<label class="control-label" for="task.taskname">任务名称</label>
										<div class="controls">
											<input class="input-xlarge focused" id="task.taskname" value="" name="user.uname" type="text" placeholder="请输入任务名称"> <span class="label label-warning"></span>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="task.taskmanger">任务描述</label>
										<div class="controls">
											<input class="input-xlarge" id="task.taskmange" value="" name="user.upass" type="password" placeholder="请输入描述内容">	<span class="label label-warning"></span>
										</div>
									</div>
								</fieldset>
								<div class="label "></div>
								<div class="form-actions center">
									<button type="submit" class="btn">
										<span class="icon32 icon-color icon-check">
									</span></button>
									<button type="reset" class="btn">
										<span class="icon32  icon-color icon-close">
									</span></button>
								</div>
							</form>
						</div>
							
								<div class="alert alert-info span3">
									<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>注意</strong> 请正确填写以上相关内容.
								</div>
							
						
					</div>
				</div>

			</div>
	</div>
<jsp:include page="footer.jsp" flush="true" />
<script type="text/javascript">
	$("document").ready(function(){
		var tid=-1;
		$(".taskName").click(function(){
			var _self=this;
			tid = _self.value;
			$(_self).parent().parent().parent().parent().parent().parent().parent().parent().parent().find("span:eq(1)").show();
			$.ajax({
				url:"taskInfo",
				type:"post",
				data:{"tid":this.value},
				success:function(Task){
				   var html='<table class="table-bordered" style="width: 500px;">'+
							'<tr><td align="right">任务描述：</td><td align="left">'+Task.taskmanager+'</td></tr>'+
							'<tr><td align="right">计划完成时间：</td><td align="left">'+Task.play_time+'</td></tr>'+
							'<tr><td align="right">派发人：</td><td align="left">'+Task.taskmaker+'</td></tr>'+
							'<tr><td align="right">完成进度：</td><td align="left">'+
							'<div class="progress progress-striped progress-success active">'+
								'<div class="bar" style="width: '+Task.taskpercent+'%;"></div>'+
							'</div>'+
							'</td></tr>'+
							'</table>';
						
						$(_self).parent().parent().parent().parent().find("td:eq(2)").html(html);	
						for(var i=0;i<_self.parentNode.childElementCount;i++){
							$(_self.parentNode.children[i].children[0]).css("background","#fff");
						}
						$(_self.childNodes[0]).css("background","#B0E0E6");
   				},
				error:function(){
					alert("error");
				}
			});
		});
		$(".btn.btn-primary").click(function(){
			 window.location.href="taskInfo/show/"+tid;
		});
		
	});
</script>

</body>
</html>