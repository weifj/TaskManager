<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<jsp:include page="include/head.jsp" flush="true">
	<jsp:param name="title" value="用户管理后台" />
</jsp:include>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<jsp:include page="include/left.jsp" flush="true" />
			<div id="content" class="span10">
				<div>
					<ul class="breadcrumb">
						<li><a href="<%=basePath %>admin">首页</a> <span class="divider">/个人资料</span></li>
					</ul>
				</div>
				<div class="row-fluid sortable ui-sortable">
					<div class="box-content">
							<form class="form-horizontal" action="admin/update" method="post">
								<fieldset>
									<div class="control-group ">
										<label class="control-label" for="user.uname">用户名</label>
										<div class="controls">
											<input class="input-xlarge focused" id="user.uname" value="${roleInfo.uname}" name="user.uname" type="text" placeholder="请输入用户名"> <span class="label label-warning">${uname_msg}</span>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="user.upass">密码</label>
										<div class="controls">
											<input class="input-xlarge" readonly="readonly"  id="user.upass" value="${roleInfo.upass}" name="user.upass" type="password" >	
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="user.upass">加入时间</label>
										<div class="controls">
											<input class="input-xlarge" readonly="readonly"  value="${roleInfo.create_time}"  type="text" >	
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
										<label class="radio">
											<div class="radio">
												<span>
													<input type="radio"  name="user.role" id="user.role" value="1"  disabled <c:if test="${roleInfo.role == 1}">checked="checked"</c:if>>
												</span>
											</div>
											普通用户
								  		</label>
								  			<div style="clear:both"></div>
								  		<label class="radio">
											<div class="radio">
												<span>
													<input type="radio" name="user.role" id="user.role" value="99"  disabled <c:if test="${roleInfo.role == 99}">checked="checked"</c:if>>
												</span>
											</div>
											管理员
								  		</label>
								  		</div>
									</div>
								</fieldset>
								<div class="label "></div>
								<div class="form-actions center">
									<button type="submit" class="btn">更新</button>
									<button type="button" class="btn" onclick="window.location='admin'">返回</button>
								</div>
							</form>
						</div>
				</div>
			</div>
		</div>
		<jsp:include page="include/footer.jsp" flush="true" />
	</div>
</body>
</html>
