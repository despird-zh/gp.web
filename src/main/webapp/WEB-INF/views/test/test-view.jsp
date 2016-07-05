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
						<h1>AJAX demo</h1>
						<div id="ajax" class="demo"></div>
					</div>
					<div class="col-sm-6">
						<a href="#" id="username">superuser</a>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
		<div >
			<h1>Type something to see events</h1>

			<div class="btn-toolbar" data-role="editor-toolbar"
				data-target="#editor">
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a data-edit="fontSize 5" class="fs-Five">Huge</a></li>
						<li><a data-edit="fontSize 3" class="fs-Three">Normal</a></li>
						<li><a data-edit="fontSize 1" class="fs-One">Small</a></li>
					</ul>
				</div>
				<div class="btn-group">
					<a class="btn btn-default" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
					<a class="btn btn-default" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
					<a class="btn btn-default" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
					<a class="btn btn-default" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
				</div>
				<div class="btn-group">
					<a class="btn btn-default" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
					<a class="btn btn-default" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
					<a class="btn btn-default" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-outdent"></i></a>
					<a class="btn btn-default" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
				</div>
				<div class="btn-group">
					<a class="btn btn-default" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
					<a class="btn btn-default" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
					<a class="btn btn-default" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
					<a class="btn btn-default" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
				</div>
				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
					<div class="dropdown-menu input-append">
						<input placeholder="URL" type="text" data-edit="createLink" />
						<button class="btn" type="button">Add</button>
					</div>
				</div>
				<div class="btn-group">
					<a class="btn btn-default" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-unlink"></i></a>
					<span class="btn btn-default" title="Insert picture (or just drag & drop)" id="pictureBtn"> <i class="fa fa-picture-o"></i>
						<input class="imgUpload" type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
					</span>
				</div>
				<div class="btn-group">
					<a class="btn btn-default" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
					<a class="btn btn-default" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
				</div>
			</div>
			<div id="editor" class="lead" data-placeholder="This is a basic example with no toolbars."></div>
			<h2>Live Preview</h2>
			<div id="editorPreview"></div>
			<h2>Events fired:</h2>
			<p id="events_log"></p>
		</div>
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
        	$('#editor').wysiwyg().on('change', function()
			{
				$('#editorPreview').html($(this).cleanHtml());
				$('#events_log').append(' change');
			});
			
			$(".dropdown-menu > input").click(function (e) {
        		e.stopPropagation();
    		});
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
