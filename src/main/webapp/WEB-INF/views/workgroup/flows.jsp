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
						  快速流程
						  <small>查看工作组关联的全部流程</small>
						</h1>
						<jsp:include page="../common/page-navs.jsp" flush="true">
							<jsp:param name="page" value="flows"/>
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
						<li class="list-group-item " >
							<div class="ticket clearfix">
								<!-- User image -->
								<div class="pull-left avatar-info p-t-xxs">
									<a href="javascript:void(0);" onmouseover="PageContext.UserLiteShow(this);" onmouseout="PageContext.UserLiteHide(this);" data-account="${postitem.owner}">
										<img alt="User Image" src="${path_image}/user3-128x128.jpg">
									</a>
								</div>
								<div class="post">
									<div class="post-head">
										<small class="label label-success" >话题发布</small>	
										<small class="label label-warning">初审</small>
										<span>测试时间讨论问题一二三</span>
										<span class="text-muted pull-right">
											<a href="javascript:void(0);" class="margin-r-5"><i class="fa fa-circle"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									</div><!-- /.post-head -->									  
									<div>
										<blockquote style="padding:0px 5px; margin-top:5px;margin-bottom:5px;font-size:13px;">
											<p style="margin:0;">当前的问题尚需进一步说明讨论posuere erat a ante.</p>
											<small style="font-size:90%;">王守祥 来自 <cite title="Source Title">安康科技开发分公司</cite> @ 3days</small>
										</blockquote>
										<blockquote style="padding:0px 5px; margin-top:5px;margin-bottom:5px;font-size:13px;">
											<p style="margin:0;">this request need further discussion and invite financial dept to join</p>
											<small>Someone famous in <cite title="Source Title">Source Title</cite> @ 3days</small>
										</blockquote>
									</div>
									<ul class="list-inline">
										<li>
											<a href="javascript:void(0);" class="link-black text-sm" data-trigger="focus" data-toggle="tooltip" title="Join discussion"><i class="fa fa-power-off"></i> Terminate</a>
										</li>
										<li>
											<a href="javascript:void(0);" class="link-black text-sm " onclick="PageContext.FavoritePost(this);" data-toggle="tooltip" title="Add or remove the post as favorite"><i class="fa fa-random"></i> Flow</a>
										</li>
										<li>
											<a href="javascript:void(0);" class="link-black text-sm " onclick="PageContext.FavoritePost(this);" data-toggle="tooltip" title="Add or remove the post as favorite"><i class="fa fa-road"></i> History</a>
										</li>
									</ul>
								</div><!-- /.comment-text -->
								
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
