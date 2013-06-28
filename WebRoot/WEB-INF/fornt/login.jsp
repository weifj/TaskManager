<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<%@ page import="com.guotingchao.model.impl.User"%>
<%
	String path = request.getContextPath();
	String base = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>登录</title>
<base href="<%=base%>" />
<link href="./css/modern.css" rel="stylesheet">
<link href="./css/modern-responsive.css" rel="stylesheet">
<link href="./css/site.css" rel="stylesheet">
<script src="jquery.min.js"></script>
      <link rel="stylesheet" href="./css/modern.css" />
      <link href="./css/modern-responsive.css" rel="stylesheet">
      <link rel="stylesheet" href="./css/theme-dark.css" />
      <style type="text/css">
         .metrouicss {
         background-color:rgb(0, 125, 266);
         }
         #pwordbox {               
         position: absolute;
         height: 100px;
         width: 100px;    
         left: 50%;
         top: 35%;
         transform: translate(-50%, -50%);    
         -webkit-transform: translate(-50%, -50%);
         -moz-transform: translate(-50%, -50%);
         -ms-transform: translate(-50%, -50%);
         }
         #imgcont {               
         position: absolute;   
         left: -175%;
         top: 50%;
         transform: translate(-50%, -10%);    
         -webkit-transform: translate(-50%, -10%);
         -moz-transform: translate(-50%, -10%);
         -ms-transform: translate(-50%, -10%);
         }
         #pboxcont {               
         position: absolute;   
         left: 0%;
         top: 100%;
         /*
         transform: translate(-50%, -10%);    
         -webkit-transform: translate(-50%, -10%);
         -moz-transform: translate(-50%, -10%);
         -ms-transform: translate(-50%, -10%);
         */}
         #pwordhint {
         color:#E86C19;
         font-size:17.5px;
         }
      </style>
</head>
<body class="metrouicss">
      <div id="pwordbox" >
      <div id="imgcont">
      </div>
      <div id="fieldcont">
         <div id="pboxcont">
         <h1 style="color:white;">&lt;User&gt;</h1>
           <div class="input-control text span4" id="pworddiv">
         		<input type="text" />
            </div>
            <h3 style="color:white;">&lt;Pass&gt;</h3>
            <div class="input-control password span4" id="pworddiv">
               <input type="password" />
               <button class="btn-reveal"></button>
            </div>
             <div class="span4" style="text-align: center;">
               <input type="submit" value="登陆"/>
               <input type="reset"  value="重置"/>
            </div>
         </div>
      </div>
      </div>
<!-- footer -->
<jsp:include page="footer.html" flush="true" />
<!-- footerEnd -->
<script type="text/javascript">
	$("document").ready(function(){
	});
</script>
</body>
</html>
