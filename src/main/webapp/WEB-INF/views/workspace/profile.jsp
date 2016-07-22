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
						<jsp:include page="../common/page-navs.jsp" flush="true">
							<jsp:param name="page" value="profile"/>
							<jsp:param name="module" value="workspace"/>
						</jsp:include>
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
									  <label class="col-sm-3 control-label">人力资源</label>
									  <div class="col-sm-4">
										<label class="checkbox-inline">
											<input type="checkbox" id="workgroup-p-121" gpid="topic-in-parent">  同组织公开
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
												<input type="checkbox" id="workgroup-c-122" gpid="topic-in-parent">  工作组内信息可见
											</label> 						
									  </div>
									</div>
									<div class="form-group">
									  <label class="col-sm-3 control-label" >子项目工作组2</label>
									  <div class="col-sm-4">
											<label class="checkbox-inline">
												<input type="checkbox" id="wrokgroup-c-123" gpid="topic-in-parent">  工作组内信息可见
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
					<div class="view-toolbar">
						<button class="btn btn-warning btn-xs" data-toggle="tooltip" data-placement="top" title="Create New File">
							<i class="fa fa-file-o"></i>
						</button>
						<button class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="top" title="Create New Folder">
							<i class="fa fa-folder-o"></i>
						</button>
						<button class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="top" title="Create About">
							<i class="fa fa-info-circle"></i>
						</button>
					</div>
                </div>
                <div class="box-body box-profile">
					<%@include file="meta-sum-info.jsp" %>
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
	<script src="${path_script}/pages/workspace/meta.js" type="text/javascript"></script>
  </body>
</html>
