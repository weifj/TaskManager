<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@  page import="com.guotingchao.model.impl.User"%>
<!DOCTYPE HTML>
<html>
<jsp:include page="include/head.jsp" flush="true">
	<jsp:param name="title" value="用户管理后台-登录" />
</jsp:include>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="row-fluid">
				<div class="span12 center login-header">
					<h2>任务管理系统</h2>
				</div>
				<!--/span-->
			</div>
			<!--/row-->
			<div class="row-fluid">
				<div class="well span5 center login-box">
					<div class="alert alert-info">请输入你的用户名和密码</div>
					<form class="form-horizontal" action="admin/dologin" method="post">
						<fieldset>
							<div class="input-prepend" title="用户名" data-rel="tooltip">
								<span class="add-on"><i class="icon-user"></i></span><input
									autofocus class="input-large span10" name="user.uname"
									id="user.uname" type="text" value="${user.uname}" />
							</div>
							<div class="clearfix"></div>
							<div class="input-prepend" title="密码" data-rel="tooltip">
								<span class="label label-warning "></span>
								<span class="add-on"><i class="icon-lock"></i></span>
								<input class="input-large span10" name="user.upass" id="user.upass"
									type="password" value="${user.upass}" />
							</div>
						<div class="clearfix"></div>
							<div class="input-prepend">
								<label class="remember" for="remember"><input
									type="checkbox" id="remember" />记住密码</label>
							</div>
							<div class="clearfix"></div>

							<p class="center span5">
								<button type="submit" class="btn btn-primary">登录</button>
							</p>
						</fieldset>
					</form>
				</div>
				<c:if test="${(login_error!=null && login_error!='')||((upass_msg!='' ||uname_msg!='') && (upass_msg!=null || uname_msg!=null))}">
				<div class="alert alert-error span4 center">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<strong>${uname_msg}</strong>
							<c:if test="${(upass_msg!='' && uname_msg!='')&&(upass_msg!=null && uname_msg!=null) }">
								和
							</c:if>
							<strong>${upass_msg}</strong>
							<strong>${login_error}</strong>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="include/footer.jsp" flush="true" />
</body>
</html>
