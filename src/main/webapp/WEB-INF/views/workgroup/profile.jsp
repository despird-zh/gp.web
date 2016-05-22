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
	<link rel="stylesheet" href="${path_plugins}/uniform/themes/default/css/uniform.default.min.css" />
	<link rel="stylesheet" href="${path_plugins}/cropper/2.3.0/cropper.min.css">
	<%@include file="../common/include.jsp" %>
	<link rel="stylesheet" href="${path_plugins}/select2/select2-bootstrap.css" />
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
					  工作组信息
					  <small>查看工作组的设置信息</small>
					</h1>
					<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
						<li><a data-toggle="tooltip" title="查看个人相关的工作空间" href="../workspace/workgroup-grid.do"><i class="fa fa-lg fa-home"></i></a></li>
						<li><span class="v-separator"></span></li>	
						<li><a data-toggle="tooltip" title="查看工作组发布文档" href="publish.do?wgroup_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-database"></i></a></li>    
						<li><a data-toggle="tooltip" title="查看工作组网盘内容" href="netdisk.do?wgroup_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-suitcase"></i></a></li>
						<li><a data-toggle="tooltip" title="查看工作组分享" href="share.do?wgroup_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-link"></i></a></li>	
						<li><a data-toggle="tooltip" title="查看工作组任务内容" href="tasks.do?wgroup_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-flag"></i></a></li>
						<li><a data-toggle="tooltip" title="查看工作组话题" href="topics.do?wgroup_id=${wgroup_id}" aria-expanded="false" ><i class="fa fa-fw fa-commenting"></i></a></li>	
						<li><a data-toggle="tooltip" title="查看工作组信息" href="profile.do?wgroup_id=${wgroup_id}" aria-expanded="false" class="bg-aqua-active"><i class="fa fa-fw fa-info-circle"></i></a></li>
					</ul>
					<hr style="margin-top: 9px;" class="m-t-none m-b-xs">
				</div>
			 </div>
          </section>

          <!-- Main content -->
          <section class="content">
		<div class="row">
			<div class="col-md-9">
				<div class="nav-tabs-custom" style="border-top: 1px solid #f4f4f4; margin-top:-1px;">
					<ul class="nav nav-tabs">
						<li class="active">
							<a gpid="list-tab" data-toggle="tab" href="#tab_1">基本信息</a>
						</li>
						<li >
							<a gpid="edit-tab" data-toggle="tab" href="#tab_2">组织信息</a>
						</li>
						<li >
							<a gpid="edit-tab" data-toggle="tab" href="#tab_3">成员信息</a>
						</li>
						<li >
							<a gpid="edit-tab" data-toggle="tab" href="#tab_4">活动信息</a>
						</li> 						
					</ul>
					<div class="tab-content">
						<div id="tab_1" class="tab-pane active">
							<div class="row">
							<div class="col-md-12">								
								<span>基础设置</span> 							
								<hr class="m-t-sm m-b-sm">
							</div>
							<div class="col-md-12">
								<form class="form-horizontal">
								<div class="row">
								<div class="col-md-6">
									<div class="form-group">
									  <label class="col-md-4 control-label" for="workgroup-name">工作组名称</label>
									  <div class="col-md-8">
										<input type="text" id="wrokgroup-id" value="${wgroup_id}" class="hidden">
										<input type="text" placeholder="Workgroup Name" value="Local" id="workgroup-name" class="form-control">
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-md-4 control-label" for="workgroup-state-sel">状态</label>
									  <div class="col-md-4">
											<select class="form-control select2" id="workgroup-state-sel">
												<option value="READ_WRITE">Read/Write</option>
												<option value="READ_ONLY">Read Only</option>
												<option value="CLOSE">Close</option>
											</select>		
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-md-4 control-label" for="workgroup-admin">管理联系人</label>
									  <div class="col-md-6">
										<div class="input-group">
											<input type="text" class="form-control" id="workgroup-admin">
											<span class="input-group-btn">
											  <a gpid="user-sel-btn" class="btn btn-info btn-sm" ><i class="fa fa-fw fa-user"></i></a>
											</span>
										  </div>
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-md-4 control-label" for="workgroup-org-id">组织设置</label>
									  <div class="col-md-6">
										<input type="hidden" id="workgroup-org-id">
										<div class="input-group">											
											<input type="text" id="workgroup-org-name" class="form-control">
											<span class="input-group-btn">
											  <a gpid="orghier-sel-btn" class="btn btn-info btn-sm" ><i class="fa fa-fw fa-search"></i></a>
											</span>											
										  </div>
									  </div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									  <label class="col-md-4 control-label" for="workgroup-description">头像</label>
									  <div class="col-md-4">
										<div class="avatar-view" title="Change the avatar">
										  <img gpid="workgroup-avatar" src="../img_cache/57-20160416-233518.png" alt="Avatar">
										</div>
									  </div>									  
									</div>
								</div>
								</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-description">描述</label>
									  <div class="col-md-7">
										<textarea placeholder="Enter ..." rows="3" id="workgroup-description" class="form-control"></textarea>
									  </div>
									</div>
								</form><!-- /.form-horizontal -->
							</div>
							<div class="col-md-12">
								<hr class="m-t-sm m-b-sm">
								<span>存储及其他设置</span> 
								<hr class="m-t-sm m-b-sm">
							</div>							
							<div class="col-md-12">
								<form class="form-horizontal">		
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-storage-id">存储</label>
									  <div class="col-md-4">
											<select class="form-control select2" id="workgroup-storage-id">												
											</select>						
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-publish-enable">发布库</label>
									  <div class="col-md-2">
										<label class="checkbox-inline">
										  <input type="checkbox" id="workgroup-publish-enable"> 开启
										</label>			
									  </div>
									  <label class="col-md-2 control-label" for="workgroup-publish-capacity">容量</label>
									  <div class="col-md-2">
										<div class="input-group">
										<input type="text" value="20" id="workgroup-publish-capacity" class="form-control">
										<span class="input-group-addon">M</span>
										</div>					
									  </div>						  
									</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-netdisk-enable">网盘库</label>
									  <div class="col-md-2">
										<label class="checkbox-inline">
										  <input type="checkbox" id="workgroup-netdisk-enable"> 开启
										</label>			
									  </div>
									  <label class="col-md-2 control-label" for="workgroup-netdisk-capacity">容量</label>
									  <div class="col-md-2">
										<div class="input-group">
										<input type="text" value="20" class="form-control" id="workgroup-netdisk-capacity">
										<span class="input-group-addon">M</span>
										</div>					
									  </div>						  
									</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-topic-enable">讨论</label>
									  <div class="col-md-2">
										<label class="checkbox-inline">
											<input type="checkbox"  id="workgroup-topic-enable">  开启
										</label> 							
									  </div>					  
									</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-share-enable">分享</label>
									  <div class="col-md-2">
										<label class="checkbox-inline">
											<input type="checkbox" id="workgroup-share-enable">  开启
										</label> 			
									  </div>	
									  <label class="col-md-2 control-label" for="workgroup-link-enable">链接</label>
									  <div class="col-md-2">
										<label class="checkbox-inline">
											<input type="checkbox" id="workgroup-link-enable"> 开启
										</label> 			
									  </div>		  
									</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-task-enable">任务</label>
									  <div class="col-md-2">
										<label class="checkbox-inline">
											<input type="checkbox" id="workgroup-task-enable">  开启
										</label> 		
									  </div>
									  <label class="col-md-2 control-label" for="workgroup-task-weight">进度比重</label>
									  <div class="col-md-2">
										<div class="input-group">
										<input type="text" value="20" class="form-control" id="workgroup-task-weight">
										<span class="input-group-addon">%</span>
										</div>	
									  </div>	
									</div>
								</form><!-- /.form-horizontal -->
							</div>
							</div>
						</div>
						<div id="tab_2" class="tab-pane">	
							<div class="row">
								<div class="col-md-12">									
									<span>父工作组</span> 									
									<hr class="m-t-sm m-b-sm">
								</div>
								<div class="col-md-12">
									<form class="form-horizontal">		
									<div class="form-group">
									  <label class="col-sm-3 control-label">程序项目工作组</label>
									  <div class="col-sm-4">
										<label class="checkbox-inline">
											<input type="checkbox" id="workgroup-p-121" gpid="topic-in-parent">  在父级显示讨论
										</label> 					
									  </div>
									</div>
									</form>
								</div>
								<div class="col-md-12">									
									<span>子工作组</span> 									
									<hr class="m-t-sm m-b-sm">
								</div>
								<div class="col-md-12">
									<form class="form-horizontal">		
									<div class="form-group">
									  <label class="col-sm-3 control-label" >子项目工作组1</label>
									  <div class="col-sm-4">
											<label class="checkbox-inline">
												<input type="checkbox" id="workgroup-c-122" gpid="topic-in-parent">  在父级显示讨论
											</label> 						
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-sm-3 control-label" >子项目工作组2</label>
									  <div class="col-sm-4">
											<label class="checkbox-inline">
												<input type="checkbox" id="wrokgroup-c-123" gpid="topic-in-parent">  在父级显示讨论
											</label> 						
									  </div>
									</div>
									</form>
								</div>
							</div>
						</div>
						<div id="tab_3" class="tab-pane">	
							<div class="repo-list">
								<ul id="members-container" class="infinite-container list-group list-group-unbordered">

								</ul>
							</div>
						</div>
						<div id="tab_4" class="tab-pane">	
						<div class="row">
							<div class="col-md-12">
							  <!-- The time line -->
							  <ul id="actlogs-container" class="timeline">
								
							  </ul>
							</div>
						</div>
						</div>
					</div>
				</div><!-- end box -->
			</div>
			<div class="col-md-3">
				<!-- Profile Image -->
              <div class="box box-widget no-radius border-top">
				<div class="box-header with-border">
					<div class="view-toolbar clearfix" style="margin-bottom: 0px;"> <!-- toolbar -->
						<span class="pull-left" title="Create New Workgroup" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-warning btn-xs " data-toggle="modal" data-target="#new-file-modal">
							<i class="fa fa-fw fa-file-o"></i>
							</button>
						</span>
						<span class="pull-left" title="Create new ticket" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#new-file-modal">
							<i class="fa fa-fw fa-fire"></i>
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

                  <hr style="margin-bottom: 5px; margin-top: 5px;">

                  <strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
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
	<!-- mustache -->
    <script src="${path_plugins}/mustache/mustache.min.js"></script>
	<!-- inifite -->
	<script src="${path_plugins}/waypoints/jquery.waypoints.min.js"></script>
	<script src="${path_plugins}/waypoints/shortcuts/infinite.min.js"></script>
	<!-- uniform -->
	<script src="${path_plugins}/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <!-- Select2 -->
    <script src="${path_plugins}/select2/select2.full.min.js"></script>
	<script src="${path_plugins}/cropper/2.3.0/cropper.min.js"></script>	
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/message.js"></script>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroup/profile.js"></script>
  </body>
</html>
