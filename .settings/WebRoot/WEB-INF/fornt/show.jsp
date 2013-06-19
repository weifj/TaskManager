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
						<div class="box-icon">
								<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a> <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					
					<div class="box-content">
                  	<div class="row-fluid">
                    </div>                   
                  </div>
				</div>
	</div>
	</div>
<jsp:include page="footer.jsp" flush="true" />
<script type="text/javascript">
	$("document").ready(function(){
	});
</script>

</body>
</html>