<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
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
						  <small>查看工作组的详细信息</small>
						</h1>
						<jsp:include page="../common/page-navs.jsp" flush="true">
							<jsp:param name="page" value="profile"/>
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
				<div class="nav-tabs-custom" style="border-top: 1px solid #f4f4f4; margin-top:-1px;">
					<ul class="nav nav-tabs">
						<li class="active">
							<a class="tab-marker" data-toggle="tab" href="#tab_1">基本信息</a>
						</li>
						<li >
							<a class="tab-marker" data-toggle="tab" href="#tab_2">组织信息</a>
						</li>
						<li >
							<a class="tab-marker" data-toggle="tab" href="#tab_3">成员信息</a>
						</li>
						<li >
							<a class="tab-marker" data-toggle="tab" href="#tab_4">活动信息</a>
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
							<div id="member-row" class="row">
								
							</div>
						</div>
						<div id="tab_4" class="tab-pane">	
							<div id="actlog-row" class="row">
								
							</div>
						</div>
					</div>
				</div><!-- end box -->
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
	<script src="${path_script}/pages/workgroup/meta.js"></script>
  </body>
</html>
