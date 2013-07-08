<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!--  header-->
<jsp:include page="header.jsp" flush="true" />
<!-- header End -->
<div class="page with-sidebar">
	<!-- header -->
	<div class="page-header">
		<div class="page-header-content">
			<h1>
				<a href="<%=basePath %>"><i class="icon-arrow-left-3 fg-color-red" style="font-size: 60px;"></a></i>更新<small>任务</small>
			</h1>
		</div>
	</div>
	<!-- end Header -->
	<div class="page-region">
		<div class="page-region-content">
			<form id="addTaskFrom" action="doAddTask" method="post">
				<div class="row">
					<table class="span8">
						<tr>
							<td>派发人:</td>
							<td><input class="span4" type="text" id="task.taskMaker" value="${task.taskMaker}" readonly  value="" name="task.taskMaker" /></td>
						</tr>
						<tr>
							<td>任务名称:</td>
							<td>
								<div class="input-control text span4">
									<span class="fg-color-red" >${taskName_error}</span>
									<input type="text" id="task.taskName" placeholder="请输入名称"
										name="task.taskName" value="${task.taskName}" />
									<button class="btn-clear"  type="button"></button>
								</div> 
								
							</td>
						</tr>
						<tr>
							<td>任务描述：</td>
							<td>
								<div class="input-control textarea span4">
									<textarea placeholder="在这描述任务" id="task.taskInfo"
										name="task.taskInfo" >${task.taskInfo}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td>计划时间：</td> 
							<td>
								<div class="input-control text datepicker span4" id="picker1"
									data-Role="datepicker" data-param-lang="zh-cn" data-param-init-date="${task.play_Time}" >
									<input type="text" id="task.play_Time" name="task.play_Time"
										/>
									<button onclick="return false;" class="btn-date"></button>
								</div>
							</td>
						</tr>
						<tr>
							<td>重要指数：</td>
							<td><input type="hidden"
								id="task.rank" name="task.rank" />
								<div class="rating" data-role="rating" data-param-rating="${task.rank}">
								</div></td>
						</tr>
						<tr>
							<td>当前进度：</td>
							<td>
								<div class="span4">
								<div class="span3">
								<div class="slider taskupdate" data-param-init-value="${task.taskPercent}"></div>
								
								</div>
								<div class="offset3 bg-color-blue updateTask">
								<span id="slider_val">${task.taskPercent}%</span>
								</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>指定人：</td>
							<td>
								<div class="input-control select">
									<select>
									<c:forEach items="${userList}" var="user">
										<option value="value="${user.attrs['id']}">${user.attrs['uname']}</option>
									</c:forEach>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan='2' style="text-align: center;"><input
								type="button" id="addTask" value="添加" /> <input type="button"
								value="返回" onclick="javascript:window.history.go(-1)" /></td>
						</tr>
					</table>
				</div>

			</form>
		</div>
	</div>
	<c:if test="${add_success_msg != null}">
			<div class="page-footer">
				<div class="pushResult message-dialog bg-color-green">
					<h3 class="fg-color-white padding30">${add_success_msg}</h3>
				</div>
			</div>
	</c:if>
</div>
<script type="text/javascript">
	var nameStr = valueStr = "";
	$("#suname").change(function() {
		var index = this.selectedIndex;
		nameStr += this.children[index].text + " ";
		if (valueStr == "") {
			valueStr += this.value;
		} else {
			valueStr += "," + this.value;
		}
		$("#user\\.id").val(valueStr);
		$("#username").val(nameStr);
		this.children[index].remove();
	});
	
	$(".slider").change(function(e,val){
		$("#slider_val").html(val+"%");
		if(val==100){
			this.children[0].style.background="green";
		}else{
			this.children[0].style.background="";
		}
	});
	$("#addTask").click(function() {
		$("#task\\.rank").val($("#rating .rated").length);
		var playtime = $("#task\\.play_Time").val();
		playtime = playtime.replace("年", "-");
		playtime = playtime.replace("月", "-");
		playtime = playtime.replace("日", "");
		$("#task\\.play_Time").val(playtime);

		$("#addTaskFrom").submit();
	});

</script>
<jsp:include page="footer.html" flush="true" />
</body>
</html>