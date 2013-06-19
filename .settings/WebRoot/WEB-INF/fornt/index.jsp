<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	List<Task> taskListInit = (List<Task>) request.getAttribute("taskListInit");
	List<Task> taskListOn = (List<Task>) request.getAttribute("taskListOn");
	List<Task> taskListOver = (List<Task>) request.getAttribute("taskListOver");
	List<Task> taskListClose = (List<Task>) request.getAttribute("taskListClose");
%>
<jsp:include page="head.jsp" flush="true">
	<jsp:param name="title" value="用户管理前台-任务展示" />
</jsp:include>
 	<div class="container">
		<div id="content" class="span20">
  				 <div class="box span10">
					<div class="box-header well" data-original-title="">
						<span class="label" style="font-size:16px;padding:3px">初始的任务</span>
						<span class="btn btn-primary" style="line-height: 14px;padding-bottom: 4px;margin-bottom: 6px;display:none">查看任务</span>
						<div class="box-icon">
								<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a> <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					
					<div class="box-content">
                  	<div class="row-fluid">
                  		<table >
                  			<tr>
                  				<td>
	                  			<div class="box-content">
										<ul>
										  <c:forEach items="${taskListInit}" var="task">
										 	 <li class="taskName" value="${task.id}"><a href="#"><span title=".icon  .icon-black  .icon-flag " class="icon icon-black icon-flag"></span>${task.taskname}</a></li>
										   </c:forEach>
										</ul>           
								</div>
                  				</td>
                  				<td width="90px"></td>
                  				<td>
                  				</td>
                  			</tr>
                  		</table>
                    </div>                   
                  </div>
				</div>
				 <div class="box span10">
					<div class="box-header well" data-original-title="">
						<span class="label label-important" style="font-size:16px;padding:3px">进行的任务</span>
						<a href="admin/addUser" class="btn btn-primary" style="line-height: 14px;padding-bottom: 4px;margin-bottom: 6px;">查看任务</a>
						<div class="box-icon">
								<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a> <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <table >
                  			<tr>
                  				<td>
                  				 <div class="box-content">
										<ul>
										  <c:forEach items="${taskListOn}" var="task">
										 	 <li class="taskName" value="${task.id}"><a href="#"><span title=".icon  .icon-red  .icon-unlocked " class="icon icon-red icon-unlocked"></span>${task.taskname}</a></li>
										   </c:forEach>
										</ul>           
								</div>
                  				</td>
                  				<td width="90px"></td>
                  				<td>
                  					<table id="beginTable" style="display:none">
                  					</table>
                  				</td>
                  			</tr>
                  		</table>
                    </div>                   
                  </div>
				</div>
				 <div class="box span10">
					<div class="box-header well" data-original-title="">
						<span class="label label-warning" style="font-size:16px;padding:3px">冻结的任务</span>
						<a href="admin/addUser" class="btn btn-primary" style="line-height: 14px;padding-bottom: 4px;margin-bottom: 6px;">查看任务</a>
						<div class="box-icon">
								<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a> <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <table >
                  			<tr>
                  				<td>
                  				 <div class="box-content">
										<ul>
										  <c:forEach items="${taskListClose}" var="task">
										 	 <li class="taskName" value="${task.id}"><a href="#"><span title=".icon  .icon-red  .icon-locked " class="icon icon-red icon-locked"></span>${task.taskname}</a></li>
										   </c:forEach>
										</ul>           
								</div>
                  				</td>
                  				<td width="90px">
                  				</td>
                  				<td>
                  				</td>
                  			</tr>
                  		</table>                    
                  	</div>                   
                  </div>
				</div>
				 <div class="box span10">
					<div class="box-header well" data-original-title="">
						<span class="label label-success" style="font-size:16px;padding:3px">完成的任务</span>
						<a href="admin/addUser" class="btn btn-primary" style="line-height: 14px;padding-bottom: 4px;margin-bottom: 6px;">查看任务</a>
						<div class="box-icon">
								<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a> <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <table >
                  			<tr>
                  				<td>
                  				 <div class="box-content">
										<ul>
										  <c:forEach items="${taskListOver}" var="task">
										 	 <li class="taskName" value="${task.id}"><a href="#"><span title=".icon  .icon-green  .icon-check " class="icon icon-green icon-check"></span>${task.taskname}</a></li>
										   </c:forEach>
										</ul>           
								</div>
                  				</td>
                  				<td width="90px"></td>
                  				<td>
                  					<table id="tab_detail" style="display:none">
                  					</table>
                  				</td>
                  			</tr>
                  		</table>
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
			$(".btn.btn-primary").show();
			$.ajax({
				url:"TaskInfo",
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
			 window.location.href="show";
		});
		
	});
</script>

</body>
</html>