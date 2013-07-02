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
			<form id="addTaskFrom" action="addTask/doAdd" method="post">
			<div>
				<table>
					<tr>
						<td style="text-align: right;">派发人:</td>
						<td style="text-align: left;"><input type="text"
							id="task.taskMaker" value="${user_info.attrs['uname']}" disabled
							class="span4" value="" name="task.taskMaker" /></td>
					</tr>
					<tr>
						<td style="text-align: right;">任务名称:</td>
						<td style="text-align: left;">
							<div class="input-control text span4">
								<input type="text" id="task.taskName" placeholder="请输入名称" name="task.taskName" value=""/>
								<button class="btn-clear" tabindex="-1" type="button"></button>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">任务描述：</td>
						<td style="text-align: left;">
							<div class="input-control textarea span4">
								<textarea placeholder="在这描述任务" id="task.taskInfo" name="task.taskInfo"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">计划时间：</td>
						<td style="text-align: left;">
							<div class="input-control text datepicker span4" id="picker1"
								data-param-lang="zh-cn">
								<input type="text" id="task.play_Time" value=""/>
								<button class="btn-date"></button>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">重要指数：</td>
						<td style="text-align: left;">
							<div class="rating" date-role="rating" id="rating">
								<a href="javascript:void(0)" class=""></a> <a
									href="javascript:void(0)" class=""></a> <a
									href="javascript:void(0)" class=""></a> <a
									href="javascript:void(0)" class=""></a> <a
									href="javascript:void(0)" class=""></a> <a
									href="javascript:void(0)" class=""></a>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">指定人：</td>
						<td style="text-align: left;">
						<input type="text" id="username" /> 
						<select id="suname">
								<option>请选择</option>
								<c:forEach items="${userList}" var="user">
									<option value="${user.id}">${user.uname }</option>
								</c:forEach>
						</select>
						<input type="hidden" name="user.id" id="user.id"  value=""  />
						</td>
					</tr>
					<tr>
						<td style="text-align: right;"><input type="button"
							id="addTask" value="添加" /></td>
						<td style="text-align: left;"><input type="button" value="取消"
							onclick="javascript:window.history.go(-1)" /></td>
					</tr>

				</table>
				<input type="hidden" id="task.rank"/>
				<c:if test="${taskName_error!=null || uid_error!=null}">				
					<div class="notices">
						<div class="bg-color-yellow">
							<a href="javascript:void(0);" class="close"></a>
							<div class="notice-text">
								<small class="fg-color-red">${taskName_error}</small><br/>
								<small class="fg-color-red">${uid_error}</small><br/>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			
		</form>
		</div>
	</div>
</div>
<jsp:include page="footer.html" flush="true" />
<script type="text/javascript">

		var nameStr=valueStr = "";
		$("#suname").change(function() {
			var index = this.selectedIndex;
			nameStr += this.children[index].text + " ";
			if(valueStr==""){
				valueStr+= this.value ;
			}else{
				valueStr+= ","+this.value; 
			}
			$("#user\\.id").val(valueStr);
			$("#username").val(nameStr);
			this.children[index].remove();
		});
		
		$("#addTask").click(function() {
			$("#task.rank").val($("#rating .rated").length);
			$("#addTaskFrom").submit();
		});
		
		$(".close").click(function(){
			$(this).parent().parent().hide();
		});
	
</script>

</body>
</html>