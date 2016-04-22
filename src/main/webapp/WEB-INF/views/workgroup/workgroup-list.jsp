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
	<link rel="stylesheet" href="${path_plugins}/isotope/isotope.css" rel="stylesheet" />
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
          <section class="content-header clearfix">
			<div class="row ">
				<div class="col-sm-12">	
					<h1 style="font-size: 18px; margin-top: 10px; margin-bottom: 0px; margin-left: 10px;">
					  工作区间
					  <small>查看下属的工作组信息</small>
					</h1>
					<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
						<li class="active"><a  href="workgroup.do" aria-expanded="false"><i class="fa fa-fw fa-cubes"></i></a></li>
						<li class=""><a  href="netdisk-pub.do" aria-expanded="true"><i class="fa fa-fw fa-database"></i></a></li>    
						<li class=""><a  href="shares.do" aria-expanded="true"><i class="fa fa-fw fa-share-alt"></i></a></li>					
						<li class=""><a  href="topics.do" aria-expanded="false"><i class="fa fa-fw fa-commenting"></i></a></li>
						<li ><span class="v-separator"></span></li>	
						<li class="pull-right"><a class="text-muted" href="../workgroup/workgroup-list.do"><i class="fa fa-th-list"></i></a></li>
						<li class="pull-right"><a class="text-muted" href="../workgroup/workgroup-grid.do"><i class="fa fa-th"></i></a></li>
					</ul>
					<hr style="margin-top: 9px;" class="m-t-none m-b-xs">
				</div>
			 </div>
          </section>

          <!-- Main content -->
          <section class="content">
		  <div class="row">
			<div class="col-md-9">
			<div class="box box-widget list-view no-radius">
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
								<div class="img-32x32-repo-item img-repo-folder">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
								  <li class="action">
									<a  href="#"><i class="fa fa-share-alt"></i></a>
								  </li>
								  <li class="action">
									<a  href="#"><i class="fa fa-star"></i></a>
								  </li>
								  <li class="action" data-toggle="tooltip" title="detail information">
									<a  href="#"><i class="fa fa-info"></i></a>
								  </li>									
								</ul>

								<ul class="inline-list" >
								  <li>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									sub2 folder
								  </a>
								  <span class="time"><i class="fa fa-clock-o"></i> 2015-5-12 12:13:23</span>								  
								</div>
								  </li>
								  <li class="">
									managed by 
									<a class="hoverlight profile_link">
									  evilsucker
									</a>
								  </li>
								  <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-database"></i></span>
									  13
									</span>
								  </li>
								  <li title="12 People (13) external " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-user "></i></span>
									  25
									</span>
								  </li>
								  <li title="25 done, 10 pending,3 in-prcess " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-flag text-yellow"></i> </span>
									  35
									</span>
								  </li>
								</ul>
								<ul class="inline-list">
								  <li class="">
									<div class="description-text-container">
									  <span class="" >
										this is for demo usage
									  </span>
									</div>
								  </li>
								</ul>
							  </div>
							</div>
						</li>
						<li class="list-group-item clearfix">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-repo-folder">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
								  <li class="action">
									<a  href="#"><i class="fa fa-share-alt"></i></a>
								  </li>
								  <li class="action">
									<a  href="#"><i class="fa fa-star"></i></a>
								  </li>
								  <li class="action" data-toggle="tooltip" title="detail information">
									<a  href="#">
									  <i class="fa fa-info"></i>
									</a>
								  </li>									
								</ul>

								<ul class="inline-list" >
								  <li>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									sub2 folder
								  </a>
								  <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>								  
								</div>
								  </li>
								  <li class="">
									managed by 
									<a class="hoverlight profile_link">
									  evilsucker
									</a>
								  </li>
								  <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-file"></i></span>
									  13
									</span>
								  </li>
								  <li title="12 People (13) external " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-user "></i></span>
									  25
									</span>
								  </li>
								  <li title="25 done, 10 pending,3 in-prcess " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-flag text-yellow"></i> </span>
									  35
									</span>
								  </li>
								</ul>
								<ul class="inline-list">
								  <li class="">
									<div class="description-text-container">
									  <span class="" >
										this is for demo usage
									  </span>
									</div>
								  </li>
								</ul>
							  </div>
							</div>
						</li>
						<li class="list-group-item clearfix">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-repo-folder">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
								  <li class="action">
									<a  href="#"><i class="fa fa-share-alt"></i></a>
								  </li>
								  <li class="action">
									<a  href="#"><i class="fa fa-star"></i></a>
								  </li>
								  <li class="action" data-toggle="tooltip" title="detail information">
									<a  href="#">
									  <i class="fa fa-info"></i>
									</a>
								  </li>									
								</ul>

								<ul class="inline-list" >
								  <li>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									sub2 folder
								  </a>
								  <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>								  
								</div>
								  </li>
								  <li class="">
									managed by 
									<a class="hoverlight profile_link">
									  evilsucker
									</a>
								  </li>
								  <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-file"></i></span>
									  13
									</span>
								  </li>
								  <li title="12 People (13) external " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-user "></i></span>
									  25
									</span>
								  </li>
								  <li title="25 done, 10 pending,3 in-prcess " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-flag text-yellow"></i> </span>
									  35
									</span>
								  </li>
								</ul>
								<ul class="inline-list">
								  <li class="">
									<div class="description-text-container">
									  <span class="" >
										this is for demo usage
									  </span>
									</div>
								  </li>
								</ul>
							  </div>
							</div>
						</li>
						<li class="list-group-item clearfix">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-repo-folder">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
								  <li class="action">
									<a  href="#"><i class="fa fa-share-alt"></i></a>
								  </li>
								  <li class="action">
									<a  href="#"><i class="fa fa-star"></i></a>
								  </li>
								  <li class="action" data-toggle="tooltip" title="detail information">
									<a  href="#">
									  <i class="fa fa-info"></i>
									</a>
								  </li>									
								</ul>

								<ul class="inline-list" >
								  <li>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									sub2 folder
								  </a>
								  <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>								  
								</div>
								  </li>
								  <li class="">
									managed by 
									<a class="hoverlight profile_link">
									  evilsucker
									</a>
								  </li>
								  <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-file"></i></span>
									  13
									</span>
								  </li>
								  <li title="12 People (13) external " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-user "></i></span>
									  25
									</span>
								  </li>
								  <li title="25 done, 10 pending,3 in-prcess " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-flag text-yellow"></i> </span>
									  35
									</span>
								  </li>
								</ul>
								<ul class="inline-list">
								  <li class="">
									<div class="description-text-container">
									  <span class="" >
										this is for demo usage
									  </span>
									</div>
								  </li>
								</ul>
							  </div>
							</div>
						</li>
					</ul>
				</div><!-- /.box-body -->
			</div><!-- end box -->
			</div>
			<div class="col-md-3">
              <div class="box box-widget no-radius">
				<div class="box-header with-border border-top">
					<div class="view-toolbar clearfix" style="margin-bottom: 0px;"> <!-- toolbar -->
						<span class="pull-left" title="Create New Workgroup" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-warning btn-xs " data-toggle="modal" data-target="#new-file-modal">
							<i class="fa fa-file-o"></i>
							</button>
						</span>
						<span class="pull-left" title="Create new ticket" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#new-file-modal">
							<i class="fa fa-fire"></i>
							</button>
						</span>
					</div><!-- toolbar -->
				</div>
                <div class="box-body box-profile">
					<div class="clearfix">
						<div class="pull-left lite-info">
						  <img class="profile-user-img img-responsive img-circle" src="${path_image}/user4-128x128.jpg" alt="User profile picture">
						  <h4 class="profile-username text-center" >沙特项目群</h4>
						  <div >
							<p class="text-muted text-center" >admin by <a>Gary </a></p>
						  </div>
						</div>							
						<ul class="stats-info list-group list-group-unbordered pull-right" >
							<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
							  <b>成员</b> <a class="pull-right">1,322</a>
							</li>
							<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
							  <b>工作组</b> <a class="pull-right">543</a>
							</li>
							<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
							  <b>文件</b> <a class="pull-right">13,287</a>
							</li>
							<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
							  <b>讨论</b> <a class="pull-right">13,287</a>
							</li>
						 </ul>
					</div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

              <!-- About Me Box -->
              <div class="box box-widget">
                <div class="box-header with-border border-top">
                  <h3 class="box-title">About</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <strong><i class="fa fa-book margin-r-5"></i>  Description</strong>
                  <p class="text-muted">
                    B.S. in Computer Science from the University of Tennessee at Knoxville
                  </p>

                  <hr style="margin-bottom: 5px; margin-top: 5px;">

                  <strong><i class="fa fa-map-marker margin-r-5"></i> Organization</strong>
                  <p class="text-muted">Branch 华东 co.</p>

                  <hr style="margin-bottom: 5px; margin-top: 5px;">

                  <strong><i class="fa fa-tags margin-r-5"></i> Tags</strong>
                  <p>
                    <span class="label label-danger">UI Design</span>
                    <span class="label label-success">Coding</span>
                    <span class="label label-info">Javascript</span>
                    <span class="label label-warning">PHP</span>
                    <span class="label label-primary">Node.js</span>
                  </p>
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

    <!-- jQuery 2.1.4 -->
    <script src="${path_plugins}/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${path_bootstrap}/js/bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${path_plugins}/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/ga/err-message.js"></script>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroups-list.js"></script>
  </body>
</html>
