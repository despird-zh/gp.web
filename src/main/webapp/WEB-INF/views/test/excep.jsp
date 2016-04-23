<%@ page language="java" errorPage="/WEB-INF/view/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>

<!DOCTYPE html>
<html lang="zh_CN">
	<head>
		<meta name="generator"
		content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<title>AdminLTE 2 | Top Navigation</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
		<%@include file="../common/include.jsp" %>
		<!-- Morris charts -->
		<link rel="stylesheet" href="${path_plugins}/morris/morris.css" />
		<link rel="stylesheet" href="${path_plugins}/bootstrap-star-rating/css/star-rating.css" />

	</head>
	<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
	<body class="hold-transition skin-blue fixed layout-top-nav">
	<div class="wrapper">
		<header class="main-header">
			<%@include file="../common/header.jsp" %>
		</header>
		<!-- Full Width Column -->
		<div class="content-wrapper">
			<div class="container" style="min-height: 400px;">
				<div class="row">
					<div class="col-sm-2">
						<a class="btn btn-default" id="web-excep-btn"> web Excep </a>
					</div>
					<div class="col-sm-2">
						<a class="btn btn-default" id="svc-excep-btn"> svc excep </a>
					</div>
					<div class="col-sm-2">
						<a class="btn btn-default" id="html-excep-btn"> non json request </a>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<textarea rows="10" cols="80" id="response-text"></textarea>
					</div>
				</div>
			</div>
			<!-- /.container -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<%@include file="../common/footer.jsp" %>
		</footer>
	</div>
	<!-- ./wrapper -->
	<!-- jQuery 2.1.4 -->
	<script src="${path_plugins}/jQuery/jQuery-2.1.4.min.js"></script> 
	<!-- Bootstrap 3.3.5 -->	
	<script src="${path_bootstrap}/js/bootstrap.min.js"></script> 
	<!-- SlimScroll -->	
	<script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script> 
	<!-- FastClick -->	
	<script src="${path_plugins}/fastclick/fastclick.min.js"></script> 
	<!-- Sparkline -->	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script> 
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
			
			$('#web-excep-btn').bind('click', function(){
				
				$.ajax({  
					type:'post',      
					url:'../test/web-excep.do',  
					data:{ audit : "test"},  
					cache:false,  
					dataType:'json',  
					success:function(data){  
						$('#response-text').text(JSON.stringify(data));
					}  
				}); 
				
			});
			$('#svc-excep-btn').bind('click', function(){
				
				$.ajax({  
					type:'post',      
					url:'../test/svc-excep.do',  
					data:{ audit : "test"},  
					cache:false,  
					dataType:'json',  
					success:function(data){  
						$('#response-text').text(data);
					}  
				}); 
				
			});
			
			$('#html-excep-btn').bind('click', function(){
				
				window.location.href='../test/svc-excep.do';
				
			});
        });		  
		 
    </script>
</html>
