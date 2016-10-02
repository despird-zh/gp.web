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
						  任务信息
						  <small>查看工作组的全部任务</small>
						</h1>
						<jsp:include page="../common/page-navs.jsp" flush="true">
							<jsp:param name="page" value="tasks"/>
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
				<div class="box-body repo-list">
					<ul class="list-group list-group-unbordered">
						<li class="list-group-item clearfix">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-normal-task">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
									<li class="action" data-toggle="tooltip" title="version information">
										<a  href="#">
										  <i class="fa fa-signal"></i>
										</a>
									</li>									
								</ul>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									某某设计开发文件
								  </a>
								  <span class="badge long-badge ellipsis" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
									Owned externally
								  </span>								  
								</div>
								<ul class="inline-list" >
								  <li class="">
									负责人
									<a class="hoverlight profile_link">
									  evilsucker
									</a>
									来自于
									<a class="hoverlight profile_link">
										康辉设计公司
									</a>
								  </li>							
								  <li >
									<span class="item-stat">
									  <span>
										2014年5月6日
									  </span>
									  <span>
										<i class="fa  fa-arrows-h"></i>
									  </span>
									 <span>
										2014年5月8日
									  </span>
									</span>
								  </li>
								  <li style="width:80px;" data-toggle="tooltip" title="55% 完成">
									<div class="progress progress-sm m-b-none progress-striped active">
									  <div style="width: 55%" class="progress-bar progress-bar-danger"></div>
									</div>
								  </li>
								</ul>								
							  </div>
							</div>
						</li>
						<li class="list-group-item clearfix">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-normal-task">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
									<li class="action" data-toggle="tooltip" title="version information">
										<a  href="#">
										  <i class="fa fa-signal"></i>
										</a>
									</li>									
								</ul>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									某某设计开发文件
								  </a>
								  <span class="badge long-badge ellipsis" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
									Owned externally
								  </span>								  
								</div>
								<ul class="inline-list" >
								  <li class="">
									负责人
									<a class="hoverlight profile_link">
									  evilsucker
									</a>
									来自于
									<a class="hoverlight profile_link">
										康辉设计公司
									</a>
								  </li>							
								  <li >
									<span class="item-stat">
									  <span>
										2014年5月6日
									  </span>
									  <span>
										<i class="fa  fa-arrows-h"></i>
									  </span>
									 <span>
										2014年5月8日
									  </span>
									</span>
								  </li>
								  <li style="width:80px;" data-toggle="tooltip" title="55% 完成">
									<div class="progress progress-sm m-b-none progress-striped active">
									  <div style="width: 55%" class="progress-bar progress-bar-danger"></div>
									</div>
								  </li>
								</ul>								
							  </div>
							</div>
						</li>
						<li class="list-group-item clearfix">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-normal-task">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
									<li class="action" data-toggle="tooltip" title="version information">
										<a  href="#">
										  <i class="fa fa-signal"></i>
										</a>
									</li>									
								</ul>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									某某设计开发文件
								  </a>
								  <span class="badge long-badge ellipsis" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
									Owned externally
								  </span>								  
								</div>
								<ul class="inline-list" >
								  <li class="">
									负责人
									<a class="hoverlight profile_link">
									  evilsucker
									</a>
									来自于
									<a class="hoverlight profile_link">
										康辉设计公司
									</a>
								  </li>							
								  <li >
									<span class="item-stat">
									  <span>
										2014年5月6日
									  </span>
									  <span>
										<i class="fa  fa-arrows-h"></i>
									  </span>
									 <span>
										2014年5月8日
									  </span>
									</span>
								  </li>
								  <li style="width:80px;" data-toggle="tooltip" title="55% 完成">
									<div class="progress progress-sm m-b-none progress-striped active">
									  <div style="width: 55%" class="progress-bar progress-bar-danger"></div>
									</div>
								  </li>
								</ul>								
							  </div>
							</div>
						</li>
						<li class="list-group-item clearfix">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-normal-task">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
									<li class="action" data-toggle="tooltip" title="version information">
										<a  href="#">
										  <i class="fa fa-signal"></i>
										</a>
									</li>									
								</ul>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									某某设计开发文件
								  </a>
								  <span class="badge long-badge ellipsis" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
									Owned externally
								  </span>								  
								</div>
								<ul class="inline-list" >
								  <li class="">
									负责人
									<a class="hoverlight profile_link">
									  evilsucker
									</a>
									来自于
									<a class="hoverlight profile_link">
										康辉设计公司
									</a>
								  </li>							
								  <li >
									<span class="item-stat">
									  <span>
										2014年5月6日
									  </span>
									  <span>
										<i class="fa  fa-arrows-h"></i>
									  </span>
									 <span>
										2014年5月8日
									  </span>
									</span>
								  </li>
								  <li style="width:80px;" data-toggle="tooltip" title="55% 完成">
									<div class="progress progress-sm m-b-none progress-striped active">
									  <div style="width: 55%" class="progress-bar progress-bar-danger"></div>
									</div>
								  </li>
								</ul>								
							  </div>
							</div>

						</li>
					</ul>
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
    <!-- FastClick -->
    <script src="${path_plugins}/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/message.js"></script>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroup/tasks.js"></script>
  </body>
</html>
