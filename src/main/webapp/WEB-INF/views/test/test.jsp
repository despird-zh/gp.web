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
						<a gpid="audit-test" class="btn btn-default"> Audit Test</a>
					</div>
					<div class="col-sm-10">
						<span gpid="audit-test-msg" class="label label-default"> </span>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						test value 
					</div>
					<div class="col-sm-10">
						${test}   ----   <c:if test="${test == 'test-value-xxx1'}"> ${test}</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						test value
					</div>
					<div class="col-sm-10">
						${testbean.attr1}
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						<a class="btn btn-default" id="test-relogon-btn"> Test Relogon </a>
					</div>

				</div>
				<div class="row">
					<p style="margin-bottom:0px;" class="tags xsmall">
						<a class="tag-red " href="" title="">Fashion</a>
						<a class="tag-yellow " href="" title="">测试</a>
						<a class="tag-blue " href="" title="">学习</a>
						<a class="tag-green  " href="" title="">Java</a>
						<a class="tag-default tag-point-red" href="" title="">工具</a>
						<a class="tag-default tag-point-yellow " href="" title="">专业</a>
						<a class="tag-default tag-point-green" href="" title="">电气</a>
						<a class="tag-default tag-point-blue" href="" title="">评分</a>
						<a class="tag-default  " href="" title="">投票</a>
						<a class="tag-red  " href="" title="">更新</a>
					</p>
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
			
			$('a[gpid=audit-test]').bind("click", function(){
				
				$.ajax({  
					type:'post',      
					url:'../test/test-audit.do',  
					data:{ audit : "test"},  
					cache:false,  
					dataType:'json',  
					success:function(data){  
						$('span[gpid=audit-test-msg]').html(data);
					}  
				}); 
			});
			
			$('#test-relogon-btn').bind('click', function(){
				
				$.ajax({  
					type:'post',      
					url:'../test/test-relogon.do',  
					data:{ audit : "test"},  
					cache:false,  
					dataType:'json',  
					success:function(data){  
						$('span[gpid=audit-test-msg]').html(data);
					}  
				}); 
			});
        });		  
		 
    </script>
</html>
