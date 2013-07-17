<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.guotingchao.model.impl.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>任务管理平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="./css/modern.css" rel="stylesheet">
<link href="./css/modern-responsive.css" rel="stylesheet">
<link href="./css/site.css" rel="stylesheet">
<link href="./css/animate.min.css" rel="stylesheet">
<script type="text/javascript" src="./js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="./js/angular.js"></script>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="//cdnjs.bootcss.com/ajax/libs/html5shiv/3.6.2/html5shiv.js"></script>
<![endif]-->
</head>
<body class="metrouicss">
<div class="page">
		<div class="nav-bar fixed-top">
			<div class="nav-bar-inner padding10">
				<span class="pull-menu"></span> <a href="<%=basePath%>"><span
					class="element brand">任务管理平台</span></a>
				<ul class="menu place-right">
				
				<c:choose>
					<c:when test="${user_info.attrs['uname']==null}">
					<li><a href="login"><span class="icon"><i
								class="icon-user-2"></i></span>登录</a></li>
					<li><a href="#"><span class="icon"><i
								class="icon-accessibility"></i></span> 注册</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#"><span class="icon"><i
								class="icon-user-2"></i></span>${user_info.attrs['uname']}</a></li>
					<li><a href="loginOut"><span class="icon"><i
								class="icon-accessibility"></i></span> 退出</a></li>
					</c:otherwise>
				</c:choose>
					
				</ul>
			</div>
		</div>
	</div>
	<c:if test="${MsgCount!=null}">
	<div class="span4 bg-color-blue msg" style="bottom:-180px;height: 175px;color: #FFF;float: right;position: fixed;right: 0px;z-index: 999;box-shadow: 0px 0px 8px 1px #817171;-webkit-border-radius: 4px;">
	  <div class="span4" style="border-bottom: 1px solid #150EBE;">
	  	<span class="icon-comments-5" style="width: 25px;height: 25px;font-size: 25px;color: blue;padding-left: 6px; padding-top: 5px;"></span>
	  	<span style="font-size: 18px;">你有新的任务</span>
	  	<a href="javascript:void(0);" class="icon-cancel-2" style="color: #FFF;float: right;font-size: 15px;padding-right: 5px;padding-top: 5px;"></a>
	  </div>
	  <div class="span4" style="border-bottom: 1px solid #150EBE;">
	  	<p style="text-align: center;">${MsgTask.attrs['taskName']}</p>
	  	<p style="text-align: left;">信息描述：${MsgTask.attrs['taskInfo']}</p>
	  	<p style="text-align: left;">派发人：${MsgTask.attrs['taskMaker']}</p>
	  	<p style="text-align: left;">建立时间：${MsgTask.attrs['creat_Time']}</p>
	  </div>
	  <div class="span4" style="display: inline;">
	  	<p class="span3" style="text-align: left;float: left;"><a href="javascript：void(0);" style="color: #FFF;font-weight: bold;">查看更多任务（${MsgCount}）</a></p>
	  	<a href="javascript:void(0);" class="span1 neverShow" style="float: right;color: #FFF;">不再提示</a>
	  </div>        
	</div>
    </c:if>                    
                        
                        
                        
                        
                        
                        
                        