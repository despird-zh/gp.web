<%@ page language="java" errorPage="/WEB-INF/view/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh_CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Top Navigation</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<%@include file="../common/include.jsp" %>
	<link rel="stylesheet" href="${path_plugins}/summernote/summernote.css">
  </head>
  <!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
  <body class="hold-transition skin-blue fixed layout-top-nav">
    <div class="wrapper">
      <header class="main-header">
        <%@include file="../common/header.jsp" %>
      </header>
      <!-- Full Width Column -->
      <div class="content-wrapper">
        <div class="container bg-white">
			<section class="content-header">
				<div class="row ">
					<div class="col-sm-12">	
						<h1 class="page-title">
						  工作组话题
						  <small>查看工作组的全部话题</small>
						</h1>
						<jsp:include page="../common/page-navs.jsp" flush="true">
							<jsp:param name="page" value="posts"/>
							<jsp:param name="module" value="workgroup"/>
						</jsp:include>
					</div>
				 </div>
			</section>

          <!-- Main content -->
          <section class="content">
		<div class="row">
			<div class="col-md-9">
				<div class="box box-widget no-radius border-top">
					<div class="box-header repo-header with-border">
						<a gpid="filter-switch-btn" class="pull-left btn btn-default btn-header-circle" role="button" ><i class="fa fa-angle-double-down"></i> </a>
						<ul class="nav nav-pills m-l-xxs">
							<li class="active"><a href="tasks.do" class="filter-nav m-l-xs">全部 <span class="badge">100</span></a></li>
							<li><a href="messages.do" class="filter-nav m-l-xs">公开发布 <span class="badge badge-primary">50</span></a></li>
							<li><a href="messages.do" class="filter-nav m-l-xs">个人发布 <span class="badge badge-primary">50</span></a></li>
						</ul>
					</div><!-- /.box-header-->
					<div gpid="wgroup-filter" class="border-bottom p-xs hidden">
						<div>		
							<form class="form-inline">
								<label class="m-r-sm">Workgroup</label><input type="text" class="form-control input-md" placeholder="storage name" gpid="list-search-sname">
								<a class="btn btn-default btn-sm" gpid="list-search-btn"><i class="fa fa-search"></i></a>
								<a class="btn btn-default btn-sm" gpid="list-clear-btn"><i class="fa fa-close"></i></a>
							</form>												
						</div>
					</div>
					<div id="post-container" class="box-body repo-list">
						 
					</div><!-- /.box-body -->
				</div><!-- end box -->
			</div>
			<div class="col-md-3">
				<!-- Profile Image -->
				<div class="box box-widget no-radius border-top">
					<div class="box-header with-border">
						<div class="view-toolbar"> <!-- toolbar -->
							<button class="btn btn-warning btn-xs" gpid="new-post-btn" data-toggle="tooltip" data-placement="top" title="Create New Post">
								<i class="fa fa-file-o"></i>
							</button>
							<button class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="top" title="Create New Folder">
								<i class="fa fa-folder-o"></i>
							</button>
							<button class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="top" title="Create About">
								<i class="fa fa-info-circle"></i>
							</button>
						</div><!-- toolbar -->
					</div>
					<div class="box-body box-profile">
						<%@include file="meta-sum-info.jsp" %>
					</div><!-- /.box-body -->
				</div><!-- /.box -->
				
			 </div>
			<div class="clearfix"></div>
		  </div>

          </section><!-- /.content -->
        </div><!-- /.container -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
		<%@include file="../common/footer.jsp" %>
      </footer>
    </div><!-- ./wrapper -->
    <!-- SlimScroll -->
    <script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script>
	    <!-- Select2 -->
    <script src="${path_plugins}/select2/select2.full.min.js"></script>
    <!-- FastClick -->
    <script src="${path_plugins}/fastclick/fastclick.min.js"></script>
	<!-- mustache -->
    <script src="${path_plugins}/mustache/mustache.min.js"></script>
    <!-- inifite -->
    <script src="${path_plugins}/waypoints/jquery.waypoints.min.js"></script>
    <script src="${path_plugins}/waypoints/shortcuts/infinite.min.js"></script>
	<!-- uniform -->
	<script src="${path_plugins}/uniform/jquery.uniform.min.js"></script>
    <!-- AdminLTE App -->
	<script src="${path_script}/app.ctx.js" type="text/javascript"></script>
	<!-- GPress Err Message -->
	<script src="${path_script}/message.js" type="text/javascript"></script>
	<%@include file="../dialog/new-workgroup-post.jsp" %>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroup/posts.js"></script>
    <!-- AdminLTE for demo purposes -->
	<script src="${path_script}/pages/workgroup/meta.js" type="text/javascript"></script>
  </body>
</html>
