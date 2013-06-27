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
<base href="<%=base%>" />
<!--  header-->
<jsp:include page="../header.html" flush="true" />
<!-- header End -->
<div class="page secondary">
	<!-- header -->
	<div class="page-header">
		<div class="page-header-content">
			<h1>
				<i class="icon-arrow-down-3 fg-color-red"></i>${task.taskName}<small>任务详细</small>
			</h1>
		</div>
	</div>
	<div class="page-region">
		<!-- 任务描述-->
		<div class="page-region-content" id="NotBegin">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>任务描述</h3></a>
					<div>
						<ul class="listview fluid">
							<li>
								<div class="title">描述信息</div>
								<div>
									<blockquote>${task.taskInfo}</blockquote>
								</div>
							</li>
							
							<li>
								<div class="title">重要指数</div>
								<div>
									<blockquote>
										<span style="font-size: 30px;color: red;">
										<c:forEach begin="1" end="${task.rank}" step="1">
											★
										</c:forEach>
										<c:forEach begin="1" end="${5-task.rank}" step="1">
											☆
										</c:forEach>
										</span>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="title">任务状态</div>
								<div>
									<blockquote>
										<span style="font-size: 30px;color: red;">
										<c:choose>
			                  				<c:when test="${task.taskType eq 0}">初始化</c:when>
			                  				<c:when test="${task.taskType eq 1}">进行中</c:when>
			                  				<c:when test="${task.taskType eq -1}">已冻结</c:when>
			                  				<c:when test="${task.taskType eq 2}">已完成</c:when>
		                  				</c:choose>
										</span>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="title">当前进度     ${task.taskPercent}%</div>
								<div>
									<blockquote>
										<div class="progress-bar" style="height: 30px;margin: auto;">
											<div class="bar bg-color-green" style="width: ${task.taskPercent}%;"></div>
											<div class="bar bg-color-yellow" style="width:${100-task.taskPercent}%"></div>
										</div>
									</blockquote>
								</div>
							</li>
						</ul>
					</div>
				</li>
				
			</ul>
		</div>
	</div>
	<div class="page-region">
		<!--时间-->
		<div class="page-region-content" id="NotBegin">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>任务时间</h3></a>
					<div>
						<ul class="listview fluid">
							<li>
								<div class="title">初始时间</div>
								<div>
									<blockquote>
										<span><fmt:formatDate value="${task.creat_Time}" type="both" pattern="yyyy年MM月d日  EEEE HH:mm:ss"/>
	                  				    </span>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="title">计划时间</div>
								<div>
									<blockquote>
										<span><fmt:formatDate value="${task.play_Time}" type="both" pattern="yyyy年MM月d日  EEEE HH:mm:ss"/>
	                  				    </span>
									</blockquote>
							   </div>
							</li>
							<li>
								<div class="title">完成时间</div>
								<div>
								
									<blockquote>
										<c:if test="${empty task.finish_Time}">
											<span style="font-size: 18px;font-weight: bold;"> 未完成</span>
										</c:if>
										<span><fmt:formatDate value="${task.finish_Time}" type="both" pattern="yyyy年MM月d日  EEEE HH:mm:ss"/>
	                  				    </span>
									</blockquote>
								</div>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="page-region">
		<!--操作人员-->
		<div class="page-region-content" id="NotBegin">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>关联人员</h3></a>
					<div>
						<ul class="listview fluid">
							<li>
								<div class="title">派发人</div>
								<div>
									<blockquote>
				                        <h6>${task.taskMaker}</h6>
									</blockquote>
								</div>
							</li>
							<li>
								<div class="title">指定人</div>
								<div>
									<blockquote>
										<c:forEach items="${userList}" var="user">
				                        <h6>${user.uname}</h6>
				                        </c:forEach>
									</blockquote>
								</div>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>						             
</div>	                  
<!-- footer -->
<jsp:include page="../footer.html" flush="true" />
<!-- footerEnd -->
<script type="text/javascript">
	$("document").ready(function(){
			
	});
</script>
</body>
</html>
