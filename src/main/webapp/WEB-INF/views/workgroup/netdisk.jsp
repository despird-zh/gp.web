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
					<h1 style="font-size: 18px; margin-top: 10px; margin-bottom: 0px; margin-left: 10px;">
					  Netdisk (Public Repository)
					  <small>Browse and manage the workgroup documents</small>
					</h1>
					<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
						<li><a data-toggle="tooltip" title="查看个人相关的工作空间" href="../workspace/messages.do"><i class="fa fa-lg fa-home"></i></a></li>
						<li><span class="v-separator"></span></li>	
						<li><a data-toggle="tooltip" title="查看工作组发布文档" href="publish.do?wgroup_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-database"></i></a></li>    
						<li><a data-toggle="tooltip" title="查看工作组网盘内容" href="netdisk.do?wgroup_id=${wgroup_id}" aria-expanded="true" class="bg-aqua-active"><i class="fa fa-fw fa-suitcase"></i></a></li>
						<li><a data-toggle="tooltip" title="查看工作组分享" href="share.do?wgroup_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-link"></i></a></li>	
						<li><a data-toggle="tooltip" title="查看工作组任务内容" href="tasks.do?wgroup_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-flag"></i></a></li>							
						<li><a data-toggle="tooltip" title="查看工作组话题" href="topics.do?wgroup_id=${wgroup_id}" aria-expanded="false"><i class="fa fa-fw fa-commenting"></i></a></li>
						<li><a data-toggle="tooltip" title="查看工作组信息" href="profile.do?wgroup_id=${wgroup_id}" aria-expanded="false" ><i class="fa fa-fw fa-info-circle"></i></a></li>
					</ul>
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
					<div class="clearfix">
						<div class="pull-left lite-info">
						  <img class="profile-user-img img-responsive img-circle" src="${path_image}/user4-128x128.jpg" alt="User profile picture">
						  <h4 class="profile-username text-center" >沙特项目群</h4>
						  <div >
							<p class="text-muted text-center" >admin by <a>Gary </a></p>
						  </div>
						</div>							
						<ul class="stats-info list-group list-group-unbordered pull-right" >
							<li class="list-group-item border-none p-none m-b-xs">
							  <b>成员</b> <a class="pull-right">1,322</a>
							</li>
							<li class="list-group-item border-none p-none m-b-xs">
							  <b>工作组</b> <a class="pull-right">543</a>
							</li>
							<li class="list-group-item border-none p-none m-b-xs">
							  <b>文件</b> <a class="pull-right">13,287</a>
							</li>
							<li class="list-group-item border-none p-none m-b-xs">
							  <b>讨论</b> <a class="pull-right">13,287</a>
							</li>
						 </ul>
					</div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              <!-- About Me Box -->
              <div class="box box-widget border-top">
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
                </div><!-- /.box-body -->
              </div><!-- /.box -->	
			  <div class="box box-widget border-top">
				<div class="box-header with-border">
				  <h3 class="box-title">Clipboard</h3>
				  <div class="box-tools">    
					<small class="label label-success">5</small>				  
                    <button data-widget="collapse" class="btn btn-box-tool" type="button"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" type="button"><i class="fa fa-cut"></i></button>
					<button class="btn btn-box-tool" type="button"><i class="fa fa-copy"></i></button>
					<button class="btn btn-box-tool" type="button"><i class="fa fa-trash-o"></i></button>
                  </div>
				</div><!-- /.box-header -->
				<div class="box-body p-none">
                    <!-- inner menu: contains the actual data -->
                    <ul gpid="clipboard-container" class="list-group list-group-unbordered m-b-xs m-r-sm m-l-sm">
                      
                    </ul>
				</div><!-- /.box-body -->
			  </div><!-- /.box -->
			</div>
			<div class="hidden">
				<input id="cabinet-id" type="hidden" value="${cabinet_id}" />
				<input id="folder-id" type="hidden" value="${folder_id}" />
				<input id="workgroup-id" type="hidden" value="${wgroup_id}" />
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
  </body>
</html>
