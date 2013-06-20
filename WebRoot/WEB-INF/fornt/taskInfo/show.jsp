<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<%@ page import="com.guotingchao.model.impl.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	List<User> userList = (List<User>)request.getAttribute("userList");
	Task task = (Task)request.getAttribute("task");
%>
<jsp:include page="../head.jsp" flush="true">
	<jsp:param name="title" value="用户管理前台-任务展示" />
</jsp:include>
<div class="container">
			<div class="row-fluid sortable ui-sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-th"></i> ${task.taskname}</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
			</div><!--/row-->
			
			<div class="row-fluid sortable ui-sortable">
				<div class="box span3">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-th"></i> Grid 3</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
				<div class="box span3">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-th"></i> Grid 3</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
				<div class="box span3">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-th"></i> Grid 3</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
				<div class="box span3">
					<div class="box-header well" data-original-title="">
						<h2>Plain</h2>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
			</div><!--/row-->
			
			<div class="row-fluid sortable ui-sortable">
				<div class="box span6">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-th"></i> Grid 6</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
				
				<div class="box span6">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-th"></i> Grid 6</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
			</div><!--/row-->
			<div class="row-fluid sortable ui-sortable">
				<div class="box span4">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-th"></i> Grid 4</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
				
				<div class="box span4">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-th"></i> Grid 4</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
				
				<div class="box span4">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-th"></i> Grid 4</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
			</div><!--/row-->
			
			<div class="row-fluid">
				<div class="span12 well">
					<div>
						<h1>Box less area</h1>
						<p>The flat boxes can be created using grids. But you can also use grids inside grids, which makes the layout 100% flexible!</p>
					</div>
				</div><!--/span-->
			</div><!--/row-->
			
			<div class="row-fluid show-grid">
				<div class="span1">1</div>
				<div class="span1">1</div>
				<div class="span1">1</div>
				<div class="span1">1</div>
				<div class="span1">1</div>
				<div class="span1">1</div>
				<div class="span1">1</div>
				<div class="span1">1</div>
				<div class="span1">1</div>
				<div class="span1">1</div>
				<div class="span1">1</div>
				<div class="span1">1</div>
			</div>
			
			<div class="row-fluid show-grid">
				<div class="span4">4</div>
				<div class="span4">4</div>
				<div class="span4">4</div>
			</div>
			
			<div class="row-fluid show-grid">
				<div class="span3">3</div>
				<div class="span3">3</div>
				<div class="span3">3</div>
				<div class="span3">3</div>
			</div>
			
			<div class="row-fluid show-grid">
				<div class="span4">4</div>
				<div class="span8">8</div>
			</div>
			
			<div class="row-fluid show-grid">
				<div class="span6">6</div>
				<div class="span6">6</div>
			</div>
			
			<div class="row-fluid show-grid">
				<div class="span12">12</div>
			</div>


</div>
<jsp:include page="../footer.jsp" flush="true" />
<script type="text/javascript">
	$("document").ready(function(){
	});
</script>

</body>
<%@page import="com.guotingchao.model.impl.User"%>
</html>