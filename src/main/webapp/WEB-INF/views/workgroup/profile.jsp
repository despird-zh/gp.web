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
					  工作组信息
					  <small>查看工作组的设置信息</small>
					</h1>
					<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
						<li><a data-toggle="tooltip" title="查看个人相关的工作空间" href="../workspace/workgroup-grid.do"><i class="fa fa-lg fa-home"></i></a></li>
						<li><span class="v-separator"></span></li>	
						<li><a data-toggle="tooltip" title="查看工作组发布文档" href="publish.do" aria-expanded="true"><i class="fa fa-fw fa-database"></i></a></li>    
						<li><a data-toggle="tooltip" title="查看工作组网盘内容" href="netdisk.do" aria-expanded="true"><i class="fa fa-fw fa-suitcase"></i></a></li>
						<li><a data-toggle="tooltip" title="查看工作组任务内容" href="tasks.do" aria-expanded="true"><i class="fa fa-fw fa-flag"></i></a></li>							
						<li><a data-toggle="tooltip" title="查看工作组话题" href="topics.do" aria-expanded="false" ><i class="fa fa-fw fa-commenting"></i></a></li>	
						<li><a data-toggle="tooltip" title="查看工作组信息" href="profile.do" aria-expanded="false" class="bg-aqua-active"><i class="fa fa-fw fa-info-circle"></i></a></li>
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
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-name">工作组名称</label>
									  <div class="col-md-4">
										<input type="text" id="wrokgroup-id" value="${wgroup_id}" class="hidden">
										<input type="text" placeholder="Workgroup Name" value="Local" id="workgroup-name" class="form-control">
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-state-sel">状态</label>
									  <div class="col-md-2">
											<select class="form-control select2" id="workgroup-state-sel">
												<option value="READ_WRITE">Read/Write</option>
												<option value="READ_ONLY">Read Only</option>
												<option value="CLOSE">Close</option>
											</select>		
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-admin">管理联系人</label>
									  <div class="col-md-3">
										<div class="input-group">
											<input type="text" class="form-control" id="workgroup-admin">
											<span class="input-group-btn">
											  <a gpid="user-sel-btn" class="btn btn-info btn-sm" ><i class="fa fa-user"></i></a>
											</span>
										  </div>
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-org-id">组织设置</label>
									  <div class="col-md-3">
										<input type="hidden" id="workgroup-org-id">
										<div class="input-group">											
											<input type="text" id="workgroup-org-name" class="form-control">
											<span class="input-group-btn">
											  <a gpid="orghier-sel-btn" class="btn btn-info btn-sm" ><i class="fa fa-search"></i></a>
											</span>											
										  </div>
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="workgroup-description">头像</label>
									  <div class="col-md-2">
										<div class="avatar-view" title="Change the avatar">
										  <img gpid="workgroup-avatar" src="../img_cache/57-20160416-233518.png" alt="Avatar">
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
									  <label class="col-sm-3 control-label" for="workgroup-storage-id">程序项目工作组</label>
									  <div class="col-sm-4">
										<label class="checkbox-inline">
											<input type="checkbox" id="workgroup-share-enable">  在父级显示讨论
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
									  <label class="col-sm-3 control-label" for="workgroup-storage-id">子项目工作组1</label>
									  <div class="col-sm-4">
											<label class="checkbox-inline">
												<input type="checkbox" id="workgroup-share-enable">  在父级显示讨论
											</label> 						
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-sm-3 control-label" for="workgroup-storage-id">子项目工作组2</label>
									  <div class="col-sm-4">
											<label class="checkbox-inline">
												<input type="checkbox" id="workgroup-share-enable">  在父级显示讨论
											</label> 						
									  </div>
									</div>
									</form>
								</div>
							</div>
						</div>
						<div id="tab_3" class="tab-pane">	
							<div class="repo-list">
								<ul class="list-group list-group-unbordered">
									<li class="list-group-item clearfix">
										<div class="media">
										  <div class="item-type">
											<img class="direct-chat-img" src="/gp/dist/img/user1-128x128.jpg" alt="message user image">
										  </div>
										  <div class="repo-item bd">
											<ul class="action-list">
												<li title="" data-toggle="tooltip" class="action" data-original-title="version information">
													<a href="#">
													  <i class="fa fa-times"></i>
													</a>
												</li>												
											</ul>
											<div class="item-name-container">
											  <a href="#" class="item-link ">
												张宏伟
											  </a>
											  <span class="badge long-badge ellipsis">
												管理员
											  </span>
											</div>
											<ul class="inline-list">
											  <li class="">
												来自
												<a class="hoverlight profile_link">
												  广州天涯有限公司
												</a>
											  </li>
											  <li class="item-stat" data-toggle="tooltip" title="" data-original-title="12 Group 300,000 topics">
												<span class="">
												  <span>
													<i class="fa fa-sun-o"></i>
												  </span>
												  13
												</span>
											  </li>
											  <li class="item-stat" data-toggle="tooltip" title="3 Members">
												<span class="">
												  <span>
													<i class="fa fa-user"></i>
												  </span>
												  2
												</span>
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
												<a href="#">
												  <i class="fa fa-share-alt"></i>
												</a>
											  </li>
											  <li class="action">
												<a href="#"><i class="fa fa-star"></i>
												</a>
											  </li>
											  <li class="action">
												<a href="#"><i class="fa fa-square-o"></i>
												</a>
											  </li>
											
											</ul>
											<div class="item-name-container">
											  <a href="#" class="item-link ">
												sub2 folder
											  </a>      

											  <span data-toggle="tooltip" title="" class="badge long-badge ellipsis" data-original-title="This folder is owned by a user in another enterprise">
												Owned externally
											  </span>
											</div>
											<ul class="inline-list">
											  <li class="">
												Updated yesterday by 
												<a class="hoverlight profile_link">
												  evilsucker
												</a>
											  </li>
											  <li class="item-stat" data-toggle="tooltip" title="13 Files, 8.4 MB">
												<span class="">
												  <span>
													<i class="fa fa-file"></i>
												  </span>
												  13
												</span>
											  </li>
											  <li class="item-stat" data-toggle="tooltip" title="3 People favorite this ">
												<span class="">
												  <span>
													<i class="fa fa-user"></i>
												  </span>
												  2
												</span>
											  </li>
											</ul>
											<ul class="inline-list">
											  <li class="">
												<div class="description-text-container">
												  <span class="">
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
												<a href="#">
												  <i class="fa fa-share-alt"></i>
												</a>
											  </li>
											  <li class="action">
												<a href="#"><i class="fa fa-star"></i>
												</a>
											  </li>
											  <li class="action">
												<a href="#"><i class="fa fa-square-o"></i>
												</a>
											  </li>
											</ul>
											<div class="item-name-container">
											  <a href="#" class="item-link ">
												sub2 folder
											  </a>      

											  <span data-toggle="tooltip" title="" class="badge long-badge ellipsis ellipsis_180" data-original-title="This folder is owned by a user in another enterprise">
												Owned externally
											  </span>
											</div>
											<ul class="inline-list">
											  <li class="">
												Updated yesterday by 
												<a class="hoverlight profile_link">
												  evilsucker
												</a>
											  </li>
											  <li class="item-stat" data-toggle="tooltip" title="13 Files, 8.4 MB">
												<span class="">
												  <span>
													<i class="fa fa-file"></i>
												  </span>
												  13
												</span>
											  </li>
											  <li class="item-stat" data-toggle="tooltip" title="3 People favorite this ">
												<span class="">
												  <span>
													<i class="fa fa-user"></i>
												  </span>
												  2
												</span>
											  </li>
											</ul>
											<ul class="inline-list">
											  <li class="">
												<div class="description-text-container">
												  <span class="">
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
											<div class="img-32x32-repo-item img-repo-file">
											</div>
										  </div>
										  <div class="repo-item bd">
											<ul class="action-list">
											  <li class="action">
												<a href="#">
												  <i class="fa fa-share-alt"></i>
												</a>
											  </li>
											  <li class="action">
												<a href="#"><i class="fa fa-star"></i>
												</a>
											  </li>
											  <li class="action">
												<a href="#"><i class="fa fa-square-o"></i>
												</a>
											  </li>
											</ul>
											<div class="item-name-container">
											  <a href="#" class="item-link ">
												sub2 file
											  </a>      

											  <span data-toggle="tooltip" title="This folder is owned by a user in another enterprise" class="badge long-badge ellipsis ellipsis_200">
												Owned externally
											  </span>
											</div>
											<ul class="inline-list">
											  <li class="">
												Updated yesterday by 
												<a class="hoverlight profile_link">
												  evilsucker
												</a>
											  </li>
											  <li class="item-stat" data-toggle="tooltip" title="13 Files, 8.4 MB">
												<span class="">
												  <span>
													<i class="fa fa-file"></i>
												  </span>
												  13
												</span>
											  </li>
											  <li class="item-stat" data-toggle="tooltip" title="3 People favorite this ">
												<span class="">
												  <span>
													<i class="fa fa-user"></i>
												  </span>
												  2
												</span>
											  </li>
											</ul>
											<ul class="inline-list">
											  <li class="">
												<div class="description-text-container">
												  <span class="">
													this is for demo usage
												  </span>
												</div>
											  </li>
											</ul>
										  </div>
										</div>

									</li>
								</ul>
							</div>
						</div>
						<div id="tab_4" class="tab-pane">	
						<div class="row">
							<div class="col-md-12">
							  <!-- The time line -->
							  <ul class="timeline">
								<!-- timeline time label -->
								<li class="time-label">
								  <span class="bg-red label label-sm">
									2014年七月八日
								  </span>
								</li>
								<!-- /.timeline-label -->
								<!-- timeline item -->
								<li>
								  <i class="fa fa-envelope bg-blue"></i>
								  <div class="timeline-item">
									<span class="time"><i class="fa fa-clock-o"></i> 27 分钟之前</span>
									<div class="timeline-header"><a href="#">刘元发</a> 评论了你的帖子</div>
									<div class="timeline-body">
									  恭喜发财，评论内容
									</div>
								  </div>
								</li>
								<!-- END timeline item -->
								<!-- timeline item -->
								<li>
								  <i class="fa fa-user bg-aqua"></i>
								  <div class="timeline-item">
									<span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>
									<div class="timeline-header"><a href="#">Sarah Young</a> accepted your friend request</div>
								  </div>
								</li>
								<!-- END timeline item -->
								<!-- timeline item -->
								<li>
								  <i class="fa fa-comments bg-yellow"></i>
								  <div class="timeline-item">
									<span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>
									<h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>
									<div class="timeline-body">
									  Take me to your leader!
									  Switzerland is small and neutral!
									  We are more like Germany, ambitious and misunderstood!
									</div>
									<div class="timeline-footer">
									  <a class="btn btn-warning btn-flat btn-xs">View comment</a>
									</div>
								  </div>
								</li>
								<!-- END timeline item -->
								<!-- timeline time label -->
								<li class="time-label">
								  <span class="bg-green">
									3 Jan. 2014
								  </span>
								</li>
								<!-- /.timeline-label -->
								<li>
								  <i class="fa fa-clock-o bg-gray"></i>
								</li>
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
	 <script src="${path_plugins}/waypoints/jquery.waypoints.min.js"></script>
	 <script src="${path_plugins}/waypoints/shortcuts/infinite.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/message.js"></script>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroup/profile.js"></script>
  </body>
</html>
