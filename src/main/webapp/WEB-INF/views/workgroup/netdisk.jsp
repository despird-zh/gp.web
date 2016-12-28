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
					  网盘内容
					  <small>查看工作组的网盘内容</small>
					</h1>
					<jsp:include page="../common/page-navs.jsp" flush="true">
						<jsp:param name="page" value="netdisk"/>
						<jsp:param name="module" value="workgroup"/>
					</jsp:include>
				</div>
			 </div>
          </section>
          <!-- Main content -->
          <section class="content">
		  <div class="row">
			<div class="col-md-9">
			  <div class="box box-widget">
				<div class="box-header repo-header with-border" style="border-top: 1px solid #f4f4f4;">
					<a gpid="back-parent-btn" class="pull-left btn btn-default btn-header-circle" role="button" ><i class="fa fa-level-up"></i> </a>
					<a gpid="filter-switch-btn" class="pull-left btn btn-default btn-header-circle" role="button" ><i class="fa fa-angle-double-down"></i> </a>
					<div class="folder-descr">					
						<span class="text">电力设计协作组</span>
					</div>
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
				<div id="cabinet-container" class="box-body repo-list">
					
				</div><!-- /.box-body -->
			  </div><!-- /.box -->
			</div>
			<div class="col-md-3">
              <div class="box box-widget no-radius border-top">
				<div class="box-header with-border">
					<div class="view-toolbar clearfix" style="margin-bottom: 0px;"> <!-- toolbar -->
						<span class="pull-left" title="Create New Doc" data-toggle="tooltip" data-placement="top">
							<button gpid="new-file-btn" class="btn btn-warning btn-xs " >
							<i class="fa fa-fw fa-file-o"></i>
							</button>
						</span>
						<span class="pull-left" title="Create new folder" data-toggle="tooltip" data-placement="top">
							<button gpid="new-folder-btn" class="btn btn-default btn-xs" >
							<i class="fa fa-fw fa-folder-o"></i>
							</button>
						</span>
						<span class="pull-left" title="Show clipboard content" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-default btn-xs" >
							<i class="fa fa-fw fa-clipboard"></i>
							</button>
						</span>
					</div><!-- toolbar -->
				</div>
                <div class="box-body box-profile">
					<%@include file="meta-sum-info.jsp" %>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
			  <%@include file="../dialog/clipboard.jsp" %>
			</div>
			<div class="hidden">
				<input id="cabinet-id" type="hidden" value="${cabinet_id}" />
				<input id="folder-id" type="hidden" value="${folder_id}" />
				<input id="wgroup-id" type="hidden" value="${wgroup_id}" />
			</div>
		  </div>
          </section><!-- /.content -->
        </div><!-- /.container -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <%@include file="../common/footer.jsp" %>
      </footer>
    </div><!-- ./wrapper -->
	<script id="clipboard-item-template" type="x-tmpl-mustache">
		<li class="list-group-item p-xxs border-none" data-item-id="{{itemId}}" data-item-type="{{itemType}}">
			<a href="#">
				<span class="v-center ellipsis ellipsis-140" style="line-height:16px;"><i class="fa fa-file-o m-r-xs"></i>
				{{itemName}}                    
				</span>
			</a>
			<a gpid="remove-clipboard-btn" class="pull-right"><i class="fa fa-times"></i></a>
		</li>
	</script><!-- /#clipboard-item-template-->

    <!-- SlimScroll -->
    <script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${path_plugins}/fastclick/fastclick.min.js"></script>
	<!-- mustache -->
    <script src="${path_plugins}/mustache/mustache.min.js"></script>
	<!-- inifite -->
	<script src="${path_plugins}/waypoints/jquery.waypoints.min.js"></script>
	<script src="${path_plugins}/waypoints/shortcuts/infinite.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/message.js"></script>
	<%@include file="../dialog/new-file.jsp" %>
	<%@include file="../dialog/new-folder.jsp" %>
	<%@include file="../dialog/entry-tags.jsp" %>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroup/netdisk.js"></script>
	<script src="${path_script}/pages/workgroup/meta.js"></script>
  </body>
</html>
