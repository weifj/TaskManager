<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<footer>
	<p class="pull-left">
		&copy; <a href="#" target="_blank">创建者: guotingchaopr@gmail.com</a>
		2013
	</p>
	<p class="pull-right">
		<a href="#">任务管理系统</a>
	</p>
</footer>
<!-- jQuery -->
<script src="js/jquery-1.7.2.min.js"></script>
<!-- jQuery UI -->
<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
<!-- transition / effect library -->
<script src="<%=basePath%>js/bootstrap-transition.js"></script>
<!-- alert enhancer library -->
<script src="<%=basePath%>js/bootstrap-alert.js"></script>
<!-- modal / dialog library -->
<script src="<%=basePath%>js/bootstrap-modal.js"></script>
<!-- custom dropdown library -->
<script src="<%=basePath%>js/bootstrap-dropdown.js"></script>
<!-- scrolspy library -->
<script src="<%=basePath%>js/bootstrap-scrollspy.js"></script>
<!-- library for creating tabs -->
<script src="<%=basePath%>js/bootstrap-tab.js"></script>
<!-- library for advanced tooltip -->
<script src="<%=basePath%>js/bootstrap-tooltip.js"></script>
<!-- popover effect library -->
<script src="<%=basePath%>js/bootstrap-popover.js"></script>
<!-- button enhancer library -->
<script src="<%=basePath%>js/bootstrap-button.js"></script>
<!-- accordion library (optional, not used in demo) -->
<script src="<%=basePath%>js/bootstrap-collapse.js"></script>
<!-- carousel slideshow library (optional, not used in demo) -->
<script src="<%=basePath%>js/bootstrap-carousel.js"></script>
<!-- autocomplete library -->
<script src="<%=basePath%>js/bootstrap-typeahead.js"></script>
<!-- tour library -->
<script src="<%=basePath%>js/bootstrap-tour.js"></script>
<!-- library for cookie management -->
<script src="<%=basePath%>js/jquery.cookie.js"></script>
<!-- calander plugin -->
<script src='<%=basePath%>js/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='<%=basePath%>js/jquery.dataTables.min.js'></script>


<!-- select or dropdown enhancer -->
<script src="<%=basePath%>js/jquery.chosen.min.js"></script>
<!-- checkbox, radio, and file input styler -->
<script src="<%=basePath%>js/jquery.uniform.min.js"></script>
<!-- plugin for gallery image view -->
<script src="<%=basePath%>js/jquery.colorbox.min.js"></script>
<!-- rich text editor library -->
<script src="<%=basePath%>js/jquery.cleditor.min.js"></script>
<!-- notification plugin -->
<script src="<%=basePath%>js/jquery.noty.js"></script>
<!-- file manager library -->
<script src="<%=basePath%>js/jquery.elfinder.min.js"></script>
<!-- star rating plugin -->
<script src="<%=basePath%>js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="<%=basePath%>js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="<%=basePath%>js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="<%=basePath%>js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="<%=basePath%>js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="<%=basePath%>js/charisma.js"></script>
<script type="text/javascript">
	  (function(){
	  		$(".nav.nav-tabs.nav-stacked.main-menu").append("<div id='systime' class='box span10 left'><h5></h5></div>");
	  		setInterval("$('#systime h5').html(new Date().toLocaleString()+'<br/> 星期'+'日一二三四五六'.charAt(new Date().getDay()));",1000);
	  }());
</script>
