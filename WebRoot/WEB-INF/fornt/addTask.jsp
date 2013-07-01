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
						<td style="text-align: left;"><input type="text" value="${user_info.attrs['uname']}" disabled class="span4"/></td>
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
								<textarea placeholder="在这描述任务"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">计划时间：</td>
						<td style="text-align: left;">
							<div class="input-control text datepicker span4" id="picker1" data-param-lang="zh-cn">
								<input type="text"/>
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
							<select onchange="change()">
							<c:forEach items="${userList}" var="user">
								<option value="${user.uname}">${user.uname }</option>
							</c:forEach>
							</select>
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
		function change({
			alert();
		});
	});
</script>

</body>
</html>