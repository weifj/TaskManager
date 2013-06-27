<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.guotingchao.model.impl.Task"%>
<!DOCTYPE HTML>
<html>
<!--  header-->
<jsp:include page="header.html" flush="true" />
<!-- header End -->
<div class="page with-sidebar">
	<!-- header -->
	<div class="page-header">
		<div class="page-header-content">
			<h1>
				<i class="icon-arrow-down-3 fg-color-red"></i> 首页<small>任务列表</small>
			</h1>
		</div>
	</div>
	<!-- header End -->
	<!-- leftMenu -->
	<div class="page-sidebar">
		<ul class="sub-menu light">
			<li class="sticker sticker-color-blue" data-for-id="NotBegin"><a
				href="#">未开始任务</a></li>
			<li class="sticker sticker-color-yellow" data-for-id="Begin"><a
				href="#">进行中任务</a></li>
			<li class="sticker sticker-color-green" data-for-id="Finish"><a
				href="#">已完成的任务</a></li>
			<li class="sticker sticker-color-red" data-for-id="Blocked"><a
				href="#">冻结的任务</a></li>
		</ul>
	</div>
	<!-- leftMenu End -->
	<div class="page-region">
		<!-- 未开始  -->
		<div class="page-region-content" id="NotBegin">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>未开始的任务</h3></a>
					<div>
						<ul class="listview fluid">
							<c:forEach items="${taskListInit}" var="task">
								<li class="" value="${task.id}">
									<div class="title">任务名称：${task.taskName}</div>
									<div>
										任务描述：
										<blockquote>${task.taskInfo}</blockquote>
										任务进度:
										<div class="progress-bar">
											<div class="bar bg-color-green"
												style="width: ${task.taskPercent}%"></div>
											<div class="bar bg-color-yellow"
												style="width: ${100-task.taskPercent}%"></div>
										</div>
										<p class="place-right">
											<strong>发起人:<a>${task.taskMaker}</a></strong>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div></li>
			</ul>
		</div>
		<!-- 未开始 end -->
		<!-- 进行中  -->
		<div class="page-region-content" id="Begin" style="display: none">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>进行中的任务</h3></a>
					<div>
						<ul class="listview fluid">
							<c:forEach items="${taskListOn}" var="task">
								<li class="selected"
									value="${task.id}">
									<div class="title">任务名称：${task.taskName}</div>
									<div>
										任务描述：
										<blockquote>${task.taskInfo}</blockquote>
										任务进度:
										<div class="progress-bar">
											<div class="bar bg-color-green"
												style="width: ${task.taskPercent}%"></div>
												<div class="bar bg-color-yellow"
												style="width: ${100-task.taskPercent}%"></div>
										</div>
										<p class="place-right">
											<strong>发起人:<a>${task.taskMaker}</a></strong>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div></li>
			</ul>
		</div>
		<!-- 进行中 end -->
		<!-- 完成的  -->
		<div class="page-region-content" id="Finish" style="display: none">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>已完成的任务</h3></a>
					<div>
						<ul class="listview fluid">
							<c:forEach items="${taskListFinish}" var="task">
								<li class="bg-color-green fg-color-white" value="${task.id}">
									<div class="title">任务名称：${task.taskName}</div>
									<div>
										任务描述：
										<blockquote>${task.taskInfo}</blockquote>
										任务进度:
										<div class="progress-bar">
											<div class="bar bg-color-yellow" style="width: 100%"></div>
										</div>
										<p class="place-right">
											<strong>发起人:<a class="fg-color-white">${task.taskMaker}</a></strong>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div></li>
			</ul>
		</div>
		<!-- 完成  end -->
		<!-- 冻结  -->
		<div class="page-region-content" id="Blocked" style="display: none">
			<ul class="accordion" data-role="accordion">
				<li class="active"><a href="#"><h3>冻结的任务</h3></a>
					<div>
						<ul class="listview fluid">
							<c:forEach items="${taskListBlocked}" var="task">
								<li class="bg-color-red fg-color-white" value="${task.id}">
									<div class="title">任务名称：${task.taskName}</div>
									<div>
										任务描述：
										<blockquote class="bg-color-blueLight">${task.taskInfo}</blockquote>
										任务进度:
										<div class="progress-bar">
											<div class="bar bg-color-green"
												style="width: ${task.taskPercent}%"></div>
											<div class="bar bg-color-yellow"
												style="width: ${100-task.taskPercent}%"></div>
										</div>
										<p class="place-right">
											<strong>发起人:<a class="fg-color-white">${task.taskMaker}</a></strong>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div></li>
			</ul>
		</div>
		<!-- 冻结 end -->
	</div>
</div>
<!-- footer -->
<jsp:include page="footer.html" flush="true" />
<!-- footerEnd -->
<script type="text/javascript">
function toPlace(location){
	$('html, body, .content').animate({scrollTop: location},1000);
}
	$("document").ready(function() {
		$(".sub-menu li").click(function() {
			var obj=$(this),
			__selfName=$(this).attr("data-for-id"),
			$hover_active=$("#"+__selfName);
			if($hover_active.is(":hidden")){
				$(".page-region-content").each(function(){
					$(this).fadeOut(500);
				});
				setTimeout("$('#"+__selfName+"').fadeIn(1000,toPlace("+obj.offset().top+"))",1000);
			}else{
				return;
			}
		});
		$(".title").click(function() {
			var obj = $(this);
			tid=obj.parent().val();
			window.location.href="taskInfo/show/"+tid;
		});
	});
</script>
</body>
</html>
