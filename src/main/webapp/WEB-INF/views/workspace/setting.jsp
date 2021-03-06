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
						  个人设置
						  <small>查看个人的设置信息</small>
						</h1>
						<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
							<li>
								<a data-toggle="tooltip" title="查看全部工作组空间" href="../workgroup/all-grid.do">
									<i class="fa fa-lg fa-globe"></i>
								</a>
							</li>
							<li>
								<a data-toggle="tooltip" title="查看全部个人话题" href="topics.do?user_id=${wgroup_id}">
									<i class="fa fa-lg fa-home"></i>
								</a>
							</li>    
						</ul>
						<hr class="m-t-sm m-b-xs">
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
							<a class="tab-marker" data-toggle="tab" href="#tab_3">存储及区域</a>
						</li>
						<li>
							<a class="tab-marker" data-toggle="tab" href="#tab_4">密码设置</a>
						</li> 						
					</ul>
					<div class="tab-content">
						<div id="tab_1" class="tab-pane active">
							<div class="row">
								<div class="col-md-12">								
									<span>基础设置</span> 		
									<a gpid="save-basic-btn" class="btn btn-primary btn-xs pull-right">
										<i class="fa fa-save"></i>
									</a>									
									<hr class="m-t-sm m-b-sm">
								</div>
								<div class="col-md-12">
									<form class="form-horizontal">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-md-4 control-label">账户</label>
												<div class="col-md-8">
													<p gpid="setting-account" class = "form-control-static"></p>
													<input type="hidden" id="setting-uid">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-4 control-label" for="setting-name">姓名</label>
												<div class="col-md-5">
												<input type="text" placeholder="name" value="dev1" id="setting-name" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-4 control-label" for="setting-type">类型</label>
												<div class="col-md-5">
													<select class="form-control select2" id="setting-type">
													<option value="LDAP"> LDAP</option>
													<option value="INLINE">IN-LINE</option>
													<option value="EXTERN">EXTERN</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-4 control-label" for="setting-state">状态</label>
												<div class="col-md-5">
													<select class="form-control select2" id="setting-state">
													<option value="ACTIVE">Active</option>
													<option value="DEACTIVE">Deactive</option>
													<option value="FROZEN">Frozen</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-4 control-label" for="setting-email">邮件</label>
												<div class="col-md-8">
												<input type="text" placeholder="email" id="setting-email" value="dd@123.com" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-4 control-label" for="setting-mobile">手机</label>
												<div class="col-md-8">
												<input type="text" placeholder="mobile" id="setting-mobile" value="13910076754" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-4 control-label" for="setting-phone">电话</label>
												<div class="col-md-8">
												<input type="text" placeholder="phone" id="setting-phone" value="78653542" class="form-control">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
											  <label class="col-md-4 control-label">头像</label>
											  <div class="col-md-4">
												<div class="avatar-view" title="Change the avatar">
												  <img id="setting-avatar" src="../img_cache/57-20160416-233518.png" alt="Avatar">
												</div>
											  </div>									  
											</div>
										</div>
									</div>
										<div class="form-group">
										  <label class="col-md-2 control-label" for="setting-signature">个人签名</label>
										  <div class="col-md-7">
											<textarea placeholder="Enter ..." rows="3" id="setting-signature" class="form-control"></textarea>
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
									<a gpid="save-org-belongs-btn" class="btn btn-primary btn-xs pull-right">
										<i class="fa fa-save"></i>
									</a>										
									<hr class="m-t-sm m-b-sm">
								</div>
								<form class="form-horizontal">	
								<div class="col-md-12" id="orghier-belongs">
									
								</div>
								<div class="col-md-12">									
									<span>工作组信息</span> 	
									<a gpid="save-wgroup-belongs-btn" class="btn btn-primary btn-xs pull-right">
										<i class="fa fa-save"></i>
									</a>										
									<hr class="m-t-sm m-b-sm">
								</div>
								<div class="col-md-12" id="workgroup-belongs">
									
								</div>
								</form>
							</div>
						</div>
						<div id="tab_3" class="tab-pane">	
							<div class="row">
								<div class="col-md-12">
									<span>存储设置</span> 
									<a gpid="save-storage-btn" class="btn btn-primary btn-xs pull-right">
										<i class="fa fa-save"></i>
									</a>	
									<hr class="m-t-sm m-b-sm">
								</div>				
								<form class="form-horizontal">
								<div class="col-md-12">
									<div class="form-group">
										<label class="col-md-2 control-label" for="setting-storage">存储</label>
										<div class="col-md-4">
											<select class="form-control select2" id="setting-storage">												
											</select>						
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label" for="setting-publish-capacity">发布库容量</label>
										<div class="col-md-2">
											<div class="input-group">
												<input type="text" value="20" id="setting-publish-capacity" class="form-control">
												<span class="input-group-addon">M</span>
											</div>					
										</div>						  
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label" for="setting-netdisk-capacity">网盘库容量</label>
										<div class="col-md-2">
											<div class="input-group">
												<input type="text" value="20" class="form-control" id="setting-netdisk-capacity">
												<span class="input-group-addon">M</span>
											</div>					
										</div>						  
									</div>
								</div>
								<div class="col-md-12">
									<span>区域设置</span> 
									<a gpid="save-region-btn" class="btn btn-primary btn-xs pull-right">
										<i class="fa fa-save"></i>
									</a>	
									<hr class="m-t-sm m-b-sm">
								</div>		
								<div class="col-md-12">
									<div class="form-group">
										<label class="col-md-2 control-label" for="setting-language">语言</label>
										<div class="col-md-3">
											<select class="form-control select2" id="setting-language">
												<option value="en_US">English</option>
												<option value="zh_CN">Chinese</option>
												<option value="fr_FR">France</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label" for="setting-timezone">时区</label>
										<div class="col-md-3">
											<select class="form-control select2" id="setting-timezone">
												<option value="GMT+08:00">GMT+08:00</option>
												<option value="GMT+09:00">GMT+09:00</option>
												<option value="GMT+10:00">GMT+10:00</option>
											</select>
										</div>
									</div>
									
								</div>
								</form><!-- /.form-horizontal -->
							</div>
						</div>
						<div id="tab_4" class="tab-pane">	
							<div class="row">
								<div class="col-md-12">
									<span>密码设置</span> 
									<a gpid="change-pwd-btn" class="btn btn-primary btn-xs pull-right">
										<i class="fa fa-save"></i>
									</a>
									<hr class="m-t-sm m-b-sm">
								</div>							
								<div class="col-md-12">
									<form class="form-horizontal">		
										<div class="form-group">
										  	<label class="col-md-2 control-label" for="new-pwd">新密码</label>
										  	<div class="col-md-3">
												<input type="password" class="form-control" id="new-pwd">
										  	</div>
										</div>
										<div class="form-group">
										  	<label class="col-md-2 control-label" for="confirm-pwd">密码确认</label>
										  	<div class="col-md-3">
												<input type="password" class="form-control" id="confirm-pwd">
										  	</div>					  
										</div>
										<div class="form-group">
										  	<label class="col-md-2 control-label" for="origin-pwd">旧密码</label>
										  	<div class="col-md-3">
												<input type="password" class="form-control" id="origin-pwd">
										  	</div>					  
										</div>
									</form><!-- /.form-horizontal -->
								</div>
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
	<!-- define the belong -->
	<script id="belongs-tmpl" type="x-tmpl-mustache">
		{{#.}}
		<div class="form-group">
			<label class="col-md-3 control-label">{{name}}</label>
			<div class="col-md-8">
				<label class="checkbox-inline">
					<input type="checkbox" gpid="post-accept" data-belong-type="{{type}}" data-belong-id="{{belongId}}" {{#postVisible}}checked="true"{{/postVisible}}>  发布到该用户群内
				</label>
			</div>
		</div>
		{{/.}}
	</script><!-- /#belong -->
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
	<script src="${path_plugins}/cropper/2.3.0/cropper.min.js"></script>	
	<script src="${path_plugins}/bootstrap-fileinput/bootstrap.file-input.js"></script>	
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js" type="text/javascript"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/message.js" type="text/javascript"></script>
	<%@include file="../dialog/avatar-cropper.jsp" %>
	<script src="${path_script}/pages/workspace/setting.js" type="text/javascript"></script>
	<script src="${path_script}/pages/workspace/meta.js" type="text/javascript"></script>
  </body>
</html>
