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
		<link href="${path_plugins}/bootstrap-wysiwyg/index.css" rel="stylesheet">
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

							    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
								  <div class="btn-group">
									<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
									  <ul class="dropdown-menu">
									  </ul>
									</div>
								  <div class="btn-group">
									<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
									  <ul class="dropdown-menu">
									  <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
									  <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
									  <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
									  </ul>
								  </div>
								  <div class="btn-group">
									<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
									<a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
									<a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
									<a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
								  </div>
								  <div class="btn-group">
									<a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
									<a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
									<a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
									<a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
								  </div>
								  <div class="btn-group">
									<a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
									<a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
									<a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
									<a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
								  </div>
								  <div class="btn-group">
									  <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
										<div class="dropdown-menu input-append">
											<input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
											<button class="btn" type="button">Add</button>
									</div>
									<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>

								  </div>
								  
								  <div class="btn-group">
									<a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
									<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
								  </div>
								  <div class="btn-group">
									<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
									<a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
								  </div>
								  <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
								</div>

								<div id="editor">
								  Go ahead&hellip;
								</div>
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
	<script src="${path_plugins}/bootstrap-wysiwyg/bootstrap-wysiwyg.js"></script>
	<script src="${path_plugins}/bootstrap-wysiwyg/external/jquery.hotkeys.js"></script>
	<!-- Sparkline -->	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script> 
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
        	$('#editor').wysiwyg().on('change', function()
			{

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
