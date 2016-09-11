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
						<h1 class="text-muted" style="font-size: 18px; margin-top: 10px; margin-bottom: 0px; margin-left: 10px;">
						  任务信息
						  <small>查看工作组的全部任务</small>
						</h1>
						<jsp:include page="../common/page-navs.jsp" flush="true">
							<jsp:param name="page" value="tasks"/>
							<jsp:param name="module" value="workgroup"/>
						</jsp:include>
						<hr style="margin-top: 9px;" class="m-t-none m-b-xs">
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
              <div class="box box-primary border-top">
                <div class="box-header with-border">
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

                  <hr style="margin-bottom: 5px; margin-top: 5px;">

                  <strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
			  <div class="box box-widget">
				<div class="box-header with-border">
				  <h3 class="box-title">Clipboard Information </h3>
				  <div class="box-tools">    

					<small class="label label-success">5</small>				  
                    <button data-widget="collapse" class="btn btn-box-tool" type="button"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" type="button"><i class="fa fa-cut"></i></button>
					<button class="btn btn-box-tool" type="button"><i class="fa fa-copy"></i></button>
					<button class="btn btn-box-tool" type="button"><i class="fa fa-trash-o"></i></button>
                  </div>
				</div><!-- /.box-header -->
				<div class="box-body">
					<ul class="doc-list">
					  <li>
						<!-- inner menu: contains the actual data -->
						<ul class="doc-items">
						  <li><!-- start message -->
							<a href="#">
							  <span class="ellipsis ellipsis-140" style="line-height:16px;"><i class="fa fa-file-o margin-r-5"></i>
								Support Team                            
							  </span>
							  <small><i class="fa fa-clock-o"></i> 5 mins</small>
							</a>
							<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
						  </li><!-- end message -->
						  <li>
							<a href="#">
							  <span class="ellipsis ellipsis-140" style="line-height:16px;"><i class="fa fa-file-o margin-r-5"></i>
								AdminLTE Design Team                           
							  </span>
							   <small><i class="fa fa-clock-o"></i> 2 hours</small>
							</a>
							<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
						  </li>
						  <li>
							<a href="#">
							  <span class="ellipsis ellipsis-140" style="line-height:16px;"><i class="fa fa-file-o margin-r-5"></i>
								Developers                            
							  </span>
							  <small><i class="fa fa-clock-o"></i> Today</small>
							</a>
							<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
						  </li>
						  <li>
							<a href="#">
							  <span class="ellipsis ellipsis-140" style="line-height:16px;"><i class="fa fa-file-o margin-r-5"></i>
								Sales Department                            
							  </span>
							  <small><i class="fa fa-clock-o "></i> Yesterday</small>
							</a>
							<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
						  </li>
						  <li>
							<a href="#">
								
							 <span class="ellipsis ellipsis-140" style="line-height:16px;"><i class="fa fa-file-o margin-r-5"></i>
								Reviewers                            
							  </span>
							  <small><i class="fa fa-clock-o"></i> 2 days</small>
							</a>
							<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
						  </li>
						</ul>
					  </li>
					</ul>
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
