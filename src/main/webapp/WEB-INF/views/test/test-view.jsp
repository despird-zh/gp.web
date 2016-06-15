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
		<link rel="stylesheet" href="${path_plugins}/x-editable/bootstrap3-editable/css/bootstrap-editable.css" />
		<link rel="stylesheet" href="${path_plugins}/morris/morris.css" />
		<link rel="stylesheet" href="${path_plugins}/morris/morris.css" />
		<link rel="stylesheet" href="${path_plugins}/bootstrap-star-rating/css/star-rating.css" />
	</head>
	<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
	<body class="hold-transition skin-blue fixed layout-top-nav">
	<div class="wrapper">
		<header class="main-header">
			
		</header>
		<!-- Full Width Column -->
		<div class="content-wrapper">
			<div class="container" style="min-height: 400px;padding-top: 20px;">
				<div class="row">
					<div class="col-sm-2">
						<a gpid="audit-test" class="btn btn-xs btn-default"> Audit Test</a>
					</div>
					<div class="col-sm-10">
						<span gpid="audit-test-msg" class="label label-default"> blank </span>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<a href="#" id="username">superuser</a>
					</div>
				</div>
					<h1>AJAX demo</h1>
					<div id="ajax" class="demo"></div>
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
	<script src="${path_plugins}/jstree/dist/jstree.min.js"></script>
	<script src="${path_plugins}/x-editable/bootstrap3-editable/js/bootstrap-editable.js"></script>
	<script src="${path_plugins}/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	<!-- Sparkline -->	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script> 
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
			$('#username').editable({
				"mode" : "inline",
				type: 'text',
			    pk: 1,
			    url: '/test/editable-update.do',
   				title: 'Enter username'
			});
			// ajax demo
			$('#ajax').jstree({
				'core' : {
					'data' : {
				      	'url' : function (node) {
				        	return '../test/tree-node.do';
				      	},
				      	'data' : function (node) {
				        	return { 'id' : node.id };
				      	},
				      	'cache' : false
				    },
				    'themes': {
		                'name': 'proton'
		            }
				},
				"types" : {
				    "#" : {
				      	"max_children" : 1,
				      	"max_depth" : 4,
				      	"valid_children" : ["root"]
				    },
				    "root" : {
				      	"icon" : "fa fa-folder-o",
				      	"valid_children" : ["default"]
				    },
				    "default" : {
				      	"valid_children" : ["default","file","folder"]
				    },
				    "file" : {
				      	"icon" : "fa fa-file-o",
				      	"valid_children" : []
				    },
				    "folder" : {
				      	"icon" : "fa fa-folder-o",
				      	"valid_children" : []
				    }
				},
				"plugins" : [
				    "types"
				]
			}).on("open_node.jstree", function (evt, data) {
			
				//$('#'+data.node.a_attr.id).find('i').removeClass('fa-folder-o').addClass('fa-folder-open-o');
			}).on("after_close.jstree", function (evt, data) {
				var tree = $('#ajax').jstree(true);
					tree.delete_node(data.node.children);
					tree._model.data[data.node.id].state.loaded = false;
				//$('#'+data.node.a_attr.id).find('i').removeClass('fa-folder-open-o').addClass('fa-folder-o');
			});
        });		  
		 
    </script>
</html>
