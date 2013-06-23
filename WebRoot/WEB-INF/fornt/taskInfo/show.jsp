<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<%@ page import="com.guotingchao.model.impl.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../head.jsp" flush="true">
	<jsp:param name="title" value="用户管理前台-任务展示" />
</jsp:include>
<div class="container">
	<div class="row-fluid sortable ui-sortable">
		<div class="box span12">
			<div class="box-header well" data-original-title="">
				<h2><span title=".icon32  .icon-blue  .icon-pin " class="icon32 icon-blue icon-pin" style="margin-top: -8px;"></span>${task.taskname}
					<span style="padding-left: 241px;">重要指数:</span>
				</h2>
				
	            <c:forEach begin="1" end="${task.rank}" step="1">
				      <span title=".icon32  .icon-blue  .icon-star-on " class="icon32 icon-blue icon-star-on"  style="margin-top: -8px;"></span>  
			    </c:forEach>
				<div class="box-icon">
					<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
					<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
					<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
				</div>
			</div>
			<div class="box-content">
                  	 <div class="row-fluid sortable ui-sortable">
                  	 	<div class="box span4">
						<div class="box-header well" data-original-title="">
							<h2><span title=".icon32  .icon-color  .icon-user " class="icon32 icon-color icon-user" style="margin-top: -8px;"></span> 派发人</h2>
							<div class="box-icon">
								<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
							</div>
						</div>
						<div class="box-content">
	                  	<div class="row-fluid">
	                  		<div class="span4"><h6>${task.taskmaker}</h6></div>
	                    </div>                   
	                  </div>
					</div>
					<div class="box span4">
						<div class="box-header well" data-original-title="">
							<h2><span title=".icon32  .icon-color  .icon-book " class="icon32 icon-color icon-book" style="margin-top: -8px;"></span> 任务描述</h2>
							<div class="box-icon">
								<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
							</div>
						</div>
						<div class="box-content">
	                  	<div class="row-fluid">
	                  		<div class="span4"><h6>${task.taskmanager}</h6></div>
	                    </div>                   
	                  </div>
					</div>
					<div class="box span4">
						<div class="box-header well" data-original-title="">
							<h2><span title=".icon32  .icon-blue  .icon-attachment " class="icon32 icon-blue icon-attachment" style="margin-top: -8px;"></span>任务状态</h2>
							<div class="box-icon">
								<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
							</div>
						</div>
						<div class="box-content">
	                  	<div class="row-fluid">
	                  		<div class="span4" style="margin-left: 37%;">
		                  			<c:choose>
		                  				<c:when test="${task.tasktype eq 0}"><span style="font-size: 20px;font-weight: bold;color: black;margin: -17px;"><span title=".icon32  .icon-black  .icon-flag " class="icon32 icon-black icon-flag" style="margin-top: -6px;"></span>初始化</span></c:when>
		                  				<c:when test="${task.tasktype eq 1}"><span style="font-size: 20px;font-weight: bold;color: red;margin: -17px;"><span title=".icon32  .icon-red  .icon-unlocked " class="icon32 icon-red icon-unlocked" style="margin-top: -6px;"></span>进行中</span></c:when>
		                  				<c:when test="${task.tasktype eq -1}"><span style="font-size: 20px;font-weight: bold;color:rgb(177, 84, 84);margin: -17px;"><span title=".icon32  .icon-red  .icon-locked " class="icon32 icon-red icon-locked" style="margin-top: -6px;"></span>已冻结</span></c:when>
		                  				<c:when test="${task.tasktype eq 2}"><span style="font-size: 20px;font-weight: bold;color: green;margin: -17px;"><span title=".icon32  .icon-green  .icon-check " class="icon32 icon-green icon-check" style="margin-top: -6px;"></span>已完成</span></c:when>
		                  			</c:choose>
	                  		</div>
	                    </div>                   
	                  </div>
				  </div>
				</div>
				<div class="row-fluid sortable ui-sortable">
                  	 	<div class="box span6">
						<div class="box-header well" data-original-title="">
							<h2><span title=".icon32  .icon-color  .icon-users " class="icon32 icon-color icon-users" style="margin-top: -8px;"></span> 执行人员</h2>
							<div class="box-icon">
								<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
							</div>
						</div>
						<div class="box-content">
	                  	<div class="row-fluid">
	                  		<c:forEach items="${userList}" var="user">
	                        <div class="span4"><h6>${user.uname}</h6></div>
	                        </c:forEach>
	                    </div>                   
	                  </div>
					</div>
					<div class="box span6">
						<div class="box-header well" data-original-title="">
							<h2><span title=".icon32  .icon-blue  .icon-edit " class="icon32 icon-blue icon-edit" style="margin-top: -8px;"></span>当前进度</h2>
							<div class="box-icon">
								<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
							</div>
						</div>
						<div class="box-content">
	                  	<div class="row-fluid">
	                  		<div class="progress progress-striped progress-success active">
								<div class="bar" style="width:${task.taskpercent}%;">${task.taskpercent}%</div>
							</div>
	                    </div>                   
	                  </div>
					</div>
				</div>
				<div class="row-fluid sortable ui-sortable">
					<div class="box span4">
						<div class="box-header well" data-original-title="">
							<h2><span title=".icon32  .icon-color  .icon-clock " class="icon32 icon-color icon-clock" style="margin-top: -8px;"></span> 任务初始时间</h2>
							<div class="box-icon">
								<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
							</div>
						</div>
						<div class="box-content">
	                  	<div class="row-fluid">
	                  		<div class="span4">
							<span><fmt:formatDate value="${task.creat_time}" type="both" pattern="yyyy-MM-d EEEE	 HH:mm:ss"/>
	                  			
	                  		</span>
							</div>
	                    </div>                   
	                  </div>
					</div>
					<div class="box span4">
						<div class="box-header well" data-original-title="">
							<h2><span title=".icon32  .icon-black  .icon-clock " class="icon32 icon-black icon-clock" style="margin-top: -8px;"></span>计划完成时间</h2>
							<div class="box-icon">
								<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
							</div>
						</div>
						<div class="box-content">
	                  	<div class="row-fluid">
	                  		<div class="span4">
							<span><fmt:formatDate value="${task.play_time}" type="both" pattern="yyyy-MM-d EEEE	 HH:mm:ss"/>
	                  			
	                  		</span>
							</div>
	                    </div>                   
	                  </div>
					</div>
					<div class="box span4">
						<div class="box-header well" data-original-title="">
							<h2><span title=".icon32  .icon-green  .icon-clock " class="icon32 icon-green icon-clock" style="margin-top: -8px;"></span> 实际完成时间</h2>
							<div class="box-icon">
								<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
							</div>
						</div>
						<div class="box-content">
	                  	<div class="row-fluid">
	                  		<div class="span4">
							<span><fmt:formatDate value="${task.finish_time}" type="both" pattern="yyyy-MM-d EEEE	 HH:mm:ss"/>
	                  			
	                  		</span>
							</div>
	                    </div>                   
	                  </div>
					</div>
				</div>
           </div>
         </div>
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