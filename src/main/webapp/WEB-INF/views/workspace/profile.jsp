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
	<!-- Morris charts -->
	<link rel="stylesheet" href="${path_plugins}/morris/morris.css" />
	<link rel="stylesheet" href="${path_plugins}/bootstrap-star-rating/css/star-rating.css" />
	
	
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
						  个人信息
						  <small>查看个人的设置信息</small>
						</h1>
						<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
							<li><a data-toggle="tooltip" title="查看全部工作组空间" href="../workgroup/all-grid.do"><i class="fa fa-lg fa-home"></i></a></li>
							<li><span class="v-separator"></span></li>	
							<li><a data-toggle="tooltip" title="查看全部个人话题" href="topics.do?user_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-map-signs"></i></a></li>    
							<li><a data-toggle="tooltip" title="查看个人网盘" href="netdisk.do?user_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-suitcase"></i></a></li>
							<li><a data-toggle="tooltip" title="查看个人分享" href="shares.do?user_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-link"></i></a></li>	
							<li><a data-toggle="tooltip" title="查看个人任务内容" href="tasks.do?user_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-flag"></i></a></li>							
							<li><a data-toggle="tooltip" title="查看个人消息" href="messages.do?user_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-comments"></i></a></li>
							<li><a class="bg-aqua-active" data-toggle="tooltip" title="查看个人设置" href="profile.do?user_id=${wgroup_id}" aria-expanded="false"><i class="fa fa-fw fa-info-circle"></i></a></li>
						</ul>
						<hr style="margin-top: 9px;" class="m-t-none m-b-xs">
					</div>
				</div>
			</section>

          <!-- Main content -->
          <section class="content">
		  <div class="row">
			<div class="col-md-9">
				<div class="nav-tabs-custom no-radius" style="border-top: 1px solid #f4f4f4; margin-top:-1px;">
					<ul class="nav nav-tabs">
						<li class="active">
							<a class="tab-marker" data-toggle="tab" href="#tab_1">基本信息</a>
						</li>
						<li>
							<a class="tab-marker" data-toggle="tab" href="#tab_2">隶属信息</a>
						</li>
						<li>
							<a class="tab-marker" data-toggle="tab" href="#tab_3">收藏信息</a>
						</li>
						<li>
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
											<label class="col-md-4 control-label" for="profile-account">账户</label>
											<div class="col-md-8">
												<p gpid="profile-account" class = "form-control-static"></p>
												<input type="hidden" id="profile-uid">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label" for="profile-name">姓名</label>
											<div class="col-md-5">
											<input type="text" placeholder="name" value="dev1" id="profile-name" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label" for="profile-type">类型</label>
											<div class="col-md-5">
												<select class="form-control select2" id="profile-type">
												<option value="LDAP"> LDAP</option>
												<option value="INLINE">IN-LINE</option>
												<option value="EXTERN">EXTERN</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label" for="profile-state">状态</label>
											<div class="col-md-5">
												<select class="form-control select2" id="profile-state">
												<option value="ACTIVE">Active</option>
												<option value="DEACTIVE">Deactive</option>
												<option value="FROZEN">Frozen</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label" for="profile-email">邮件</label>
											<div class="col-md-8">
											<input type="text" placeholder="email" id="profile-email" value="dd@123.com" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label" for="profile-mobile">手机</label>
											<div class="col-md-8">
											<input type="text" placeholder="mobile" id="profile-mobile" value="13910076754" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label" for="profile-phone">电话</label>
											<div class="col-md-8">
											<input type="text" placeholder="phone" id="profile-phone" value="78653542" class="form-control">
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
										  <label class="col-md-4 control-label" for="profile-description">头像</label>
										  <div class="col-md-4">
											<div class="avatar-view" title="Change the avatar">
											  <img gpid="profile-avatar" src="../img_cache/57-20160416-233518.png" alt="Avatar">
											</div>
										  </div>									  
										</div>
									</div>
								</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="profile-signature">个人签名</label>
									  <div class="col-md-7">
										<textarea placeholder="Enter ..." rows="3" id="profile-signature" class="form-control"></textarea>
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
									  <label class="col-md-2 control-label" for="profile-storage-id">存储</label>
									  <div class="col-md-4">
											<select class="form-control select2" id="profile-storage-id">												
											</select>						
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="profile-publish-enable">发布库</label>
									  <div class="col-md-2">
										<label class="checkbox-inline">
										  <input type="checkbox" id="profile-publish-enable"> 开启
										</label>			
									  </div>
									  <label class="col-md-2 control-label" for="profile-publish-capacity">容量</label>
									  <div class="col-md-2">
										<div class="input-group">
										<input type="text" value="20" id="profile-publish-capacity" class="form-control">
										<span class="input-group-addon">M</span>
										</div>					
									  </div>						  
									</div>
									<div class="form-group">
									  <label class="col-md-2 control-label" for="profile-netdisk-enable">网盘库</label>
									  <div class="col-md-2">
										<label class="checkbox-inline">
										  <input type="checkbox" id="profile-netdisk-enable"> 开启
										</label>			
									  </div>
									  <label class="col-md-2 control-label" for="profile-netdisk-capacity">容量</label>
									  <div class="col-md-2">
										<div class="input-group">
										<input type="text" value="20" class="form-control" id="profile-netdisk-capacity">
										<span class="input-group-addon">M</span>
										</div>					
									  </div>						  
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label" for="profile-language">language</label>
										<div class="col-md-3">
											<select class="form-control select2" id="profile-language">
												<option value="en_US">English</option>
												<option value="zh_CN">Chinese</option>
												<option value="fr_FR">France</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label" for="profile-timezone">time zone</label>
										<div class="col-md-3">
											<select class="form-control select2" id="profile-timezone">
												<option value="GMT+08:00">GMT+08:00</option>
												<option value="GMT+09:00">GMT+09:00</option>
												<option value="GMT+10:00">GMT+10:00</option>
											</select>
										</div>
									</div>
								</form><!-- /.form-horizontal -->
							</div>
							</div>
						</div>
						<div id="tab_2" class="tab-pane">	
							<div class="row">
								<div class="col-md-12">									
									<span>组织信息</span> 									
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
									<span>工作组信息</span> 									
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
			<div class="col-md-3" >
				<div class="box box-widget no-radius border-top">
				<div class="box-header with-border">
					<div class="view-toolbar clearfix" style="margin-bottom: 0px;"> <!-- toolbar -->
						<span class="pull-left" title="Create New File" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#new-file-modal">
							<i class="fa fa-file-o"></i>
							</button>
						</span>
						<span class="pull-left" title="Create new folder" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#new-file-modal">
							<i class="fa fa-folder-o"></i>
							</button>
						</span>
						<span class="pull-left" title="Workgroup Information" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-default btn-xs">
							<i class="fa fa-info-circle"></i>
							</button>
						</span>
					</div><!-- toolbar -->
                </div>
                <div class="box-body box-profile">

					<div class="clearfix">
						<div class="pull-left lite-info">
						  <img class="profile-user-img img-responsive img-circle" src="${path_image}/user4-128x128.jpg" alt="User profile picture">
						 
						  <div >
							<p class="text-muted text-center" >owned by <a>Gary </a></p>
							<p class="text-muted text-center" >since 2015-6-7</p>
						  </div>
						</div>							
						<ul class="stats-info list-group list-group-unbordered pull-right" >
							<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
							  <b>任务</b> <a class="pull-right">1,322</a>
							</li>
							<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
							  <b>共享</b> <a class="pull-right">543</a>
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
              <div class="box box-widget no-radius border-top">
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
			  <div class="box box-widget no-radius border-top">
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

				<ul obid="docs_list" class="doc-list">
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

    <!-- jQuery 2.1.4 -->
    <script src="${path_plugins}/jQuery/jquery.min.js" type="text/javascript"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${path_bootstrap}/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- SlimScroll -->
    <script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src="${path_plugins}/fastclick/fastclick.min.js" type="text/javascript"></script>
	<!-- Select2 -->
    <script src="${path_plugins}/select2/select2.full.min.js" type="text/javascript"></script>
	<!-- mustache -->
    <script src="${path_plugins}/mustache/mustache.min.js" type="text/javascript"></script>
	<!-- uniform -->
	<script src="${path_plugins}/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js" type="text/javascript"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/message.js" type="text/javascript"></script>
	
	<script src="${path_script}/pages/workspace/profile.js" type="text/javascript"></script>
  </body>
</html>
