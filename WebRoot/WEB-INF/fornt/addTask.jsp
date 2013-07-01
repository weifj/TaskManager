<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--  header-->
<jsp:include page="header.jsp" flush="true" />
<!-- header End -->
<div class="page secondary">
	<!-- header -->
	<div class="page-header">
		<div class="page-header-content">
			<h1>
				<i class="icon-arrow-down-3 fg-color-red"></i>添加新任务
			</h1>
		</div>
	</div>
	<div class="page-region">
		<div class="page-region-content">
			<div>
				<table>
					<tr>
						<td style="text-align: right;">派发人:</td>
						<td style="text-align: left;"><input type="text" id="taskMaker" value="${user_info.attrs['uname']}" disabled class="span4"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">任务名称:</td>
						<td style="text-align: left;">
							<div class="input-control text span4">
								<input type="text" id="taskname" placeholder="请输入名称"/>
								<button class="btn-clear" tabindex="-1" type="button"></button>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">任务描述：</td>
						<td style="text-align: left;">
							<div class="input-control textarea span4">
								<textarea placeholder="在这描述任务" id="taskInfo"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">计划时间：</td>
						<td style="text-align: left;">
							<div class="input-control text datepicker span4" id="picker1" data-param-lang="zh-cn">
								<input type="text" id="paly_Time"/>
								<button class="btn-date"></button>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">重要指数：</td>
						<td style="text-align: left;">
							<div class="rating" date-role="rating" id="rating3">
								<a href="javascript:void(0)" class=""></a>
								<a href="javascript:void(0)" class=""></a>
								<a href="javascript:void(0)" class=""></a>
								<a href="javascript:void(0)" class=""></a>
								<a href="javascript:void(0)" class=""></a>
								<a href="javascript:void(0)" class=""></a>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">指定人：</td>
						<td style="text-align: left;">
							<input type="text" id="username" />
							<select id="uname">
							<c:forEach items="${userList}" var="user">
								<option value="${user.uname}">${user.uname }</option>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;"><input type="button" id="addTask" value="添加"/></td>
						<td style="text-align: left;">
							<input type="button"  value="取消" onclick="javascript:window.history.go(-1)"/>
							<span id="message"></span>
						</td>
					</tr>
					
				</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.html" flush="true" />
<script type="text/javascript">
	$("document").ready(function(){
		var nameStr="";
		$("#uname").change(function(){
			nameStr+=this.value+" ";
			this.remove();
			$("#username").val(nameStr);
		});
		//$(".rating").children()[1] 遍历选中的星星
		$("#addTask").click(function(){
			$.ajax({
				url: "taskAdd",
				type: "POST",
				data: {
					"taskMaker":$("#taskMaker").val(),
					"taskname":$("#taskname").val(),
					"taskInfo":$("#taskInfo").val(),
					"paly_Time":$("#paly_Time").val(),
					"username":$("#username").val(),
				},
				beforeSend: function() {
					$("#message").html("请稍后...");
					return true;
				},
				success: function(flag) {
						if(flag){
							window.location="";
						}else{
							$("#message").html("添加失败");
						}
				}
			});		
		}); 
	});
</script>

</body>
</html>