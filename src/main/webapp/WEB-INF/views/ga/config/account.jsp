<%@ page language="java" errorPage="/WEB-INF/view/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../../common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en_US">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>AdminLTE 2 | Dashboard</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<link rel="stylesheet" href="${path_plugins}/datatables/datatables.min.css" />
		<link rel="stylesheet" href="${path_plugins}/datatables/plugins/bootstrap/datatables.bootstrap.css"/>
		<link rel="stylesheet" href="${path_plugins}/uniform/themes/default/css/uniform.default.min.css" />
		<%@include file="../common/include.jsp" %>
		<link rel="stylesheet" href="${path_plugins}/select2/select2-bootstrap.css" />

	</head>
	<body class="hold-transition skin-blue sidebar-mini fixed">
		<div class="wrapper">
			<header class="main-header">
			<%@include file="../common/header.jsp" %>
			</header>
			<!-- Left side column. contains the logo and sidebar -->
			<aside class="main-sidebar">
				<!-- sidebar: style can be found in sidebar.less -->
				<section class="sidebar">
				  <jsp:include page="../common/sidebar.jsp" flush="true">     
						 <jsp:param name="curr_module" value="security"/> 
						 <jsp:param name="curr_page" value="account"/> 
				  </jsp:include> 
				</section>
				<!-- /.sidebar -->
			</aside>

			  <!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<h1>
					账户管理
					<small>查询、维护系统账户信息</small>
					</h1>
				</section>
				<!-- Main content -->
				<section class="content">
					  <!-- Custom Tabs -->
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs">
							<li <c:if test="${viewtab == 'list'}">class="active"</c:if>>
								<a gpid="list-tab" data-toggle="tab" href="#tab_1">用户列表</a>
							</li>
							<li <c:if test="${viewtab == 'edit'}">class="active"</c:if>>
								<a gpid="edit-tab" data-toggle="tab" href="#tab_2">用户信息</a>
							</li> 
							<li class="hidden <c:if test="${viewtab == 'new'}">active</c:if>">
								<a gpid="new-tab" data-toggle="tab" href="#tab_4">新建用户</a>
							</li>   							
							<li class="hidden <c:if test="${viewtab == 'ext'}">active</c:if>">
								<a gpid="ext-tab" data-toggle="tab" href="#tab_3">外部用户</a>
							</li>   
							<li class="pull-right">
								<a gpid="new-account-btn" class="text-primary" role="button" href="javascript:void(0)"><i class="fa fa-fw fa-plus"></i>新建用户</a>
							</li>
							<li class="pull-right">
								<a gpid="new-extern-btn" class="text-primary" role="button" href="javascript:void(0)"><i class="fa fa-fw fa-plus"></i>添加外部用户</a>
							</li>						
						</ul>
						<div class="tab-content">
							<div id="tab_1" class="tab-pane <c:if test="${viewtab == 'list'}">active</c:if> ">					  
								<div class="col-md-12">		
									<form class="form-inline">
										<label>User : </label> 
										<input gpid="list-search-user" type="text" placeholder="user name, account, email" class="form-control input-sm"> &nbsp;
										<label>Type : </label> 
										<select gpid="list-search-type" class="form-control select2">
											<option value="ALL" selected>All</option>	
											<option value="INLINE">In-Line</option>
											<option value="LDAP">LDAP</option>	
											<option value="EXTERN">EXTERN</option>								
										</select>&nbsp;
										<label>State : </label> 
										<select gpid="list-search-state" class="form-control select2">		
											<option value="ALL" selected>All</option>	
											<option value="ACTIVE" selected>Active</option>	
											<option value="DEACTIVE">Deactive</option>
											<option value="FROZEN">Frozen</option>		
										</select>&nbsp;
										<label>Entity : </label> 
										<select gpid="list-search-enode" class="form-control select2">							
										</select>&nbsp;
										<a gpid="list-search-btn" class="btn btn-default btn-sm"><i class="fa fa-search"></i></a>
										<a gpid="list-clear-btn" class="btn btn-default btn-sm"><i class="fa fa-close"></i></a>
									</form>
									<hr class="m-t-sm m-b-sm">	
								</div>
								
								<div class="box-body">
									<table gpid="list-table" class="table table-bordered table-condensed table-hover">
										<thead>
											<tr>
												<th >Account</th>
												<th >Mail</th>
												<th >Mobile</th>
												<th >Type</th>
												<th >State</th>
												<th>Entity</th>
												<th >Create</th>
												<th >Act</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div><!-- /.tab-pane -->
							<div id="tab_2" class="tab-pane <c:if test="${viewtab == 'edit'}">active</c:if> ">
								<div class="row m-l-none m-r-none">
									<div class="col-md-6">
										<div class="col-md-12 no-padding">
										  <form class="form-inline">
											<label class="p-t-xxs  m-r-sm"> Basic Information </label>						
										  </form>
										  <hr class="m-t-sm m-b-sm">
										</div>
										<div class="col-md-12 no-padding">
											<form class="form-horizontal">
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-account">account</label>
													<div class="col-sm-4">
														<p gpid="edit-account" class = "form-control-static"></p>
														<input type="hidden" id="edit-uid">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-name">name</label>
													<div class="col-sm-4">
													<input type="text" placeholder="name" value="dev1" id="edit-name" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-type">type</label>
													<div class="col-sm-4">
														<select class="form-control select2" id="edit-type">
														<option value="LDAP"> LDAP</option>
														<option value="INLINE">IN-LINE</option>
														<option value="EXTERN">EXTERN</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-state">type</label>
													<div class="col-sm-4">
														<select class="form-control select2" id="edit-state">
														<option value="ACTIVE">Active</option>
														<option value="DEACTIVE">Deactive</option>
														<option value="FROZEN">Frozen</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-password">password</label>
													<div class="col-sm-4">
													<input type="password" placeholder="set password" value="1" id="edit-password" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-password-confirm">confirm</label>
													<div class="col-sm-4">
													<input type="password" placeholder="confirm password" value="1" id="edit-password-confirm" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-email">email</label>
													<div class="col-sm-4">
													<input type="text" placeholder="email" id="edit-email" value="dd@123.com" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-mobile">mobile</label>
													<div class="col-sm-4">
													<input type="text" placeholder="mobile" id="edit-mobile" value="13910076754" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-phone">phone</label>
													<div class="col-sm-4">
													<input type="text" placeholder="phone" id="edit-phone" value="78653542" class="form-control">
													</div>
												</div>
											</form>
										</div>
									</div><!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="col-md-12 no-padding">
										  <form class="form-inline">
											<label class="p-t-xxs  m-r-sm"> User Store Setting </label>						
										  </form>
										  <hr class="m-t-sm m-b-sm">
										</div>
										<div class="col-md-12 no-padding">
											<form class="form-horizontal">
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-storage-sel">Storage</label>
													<div class="col-sm-4">
														<select class="form-control select2" id="edit-storage-sel" style="width : 150px;">
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-pub-cap">public cabinet</label>
													<div class="col-sm-4">
														<div class="input-group">
															<input type="text" id="edit-pub-cap" value="${item.pubcapacity}" class="form-control">
															<span class="input-group-addon">G</span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-pri-cap">private cabinet</label>
													<div class="col-sm-4">
														<div class="input-group">
															<input type="text" id="edit-pri-cap" value="${item.pricapacity}" class="form-control">
															<span class="input-group-addon">G</span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">International</label>
													<div class="col-sm-7 ">								
														<p gpid="new-store-setting" class = "form-control-static">International support Setting</p>
													</div>
												</div>
												<hr class="m-t-sm m-b-sm">
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-language">language</label>
													<div class="col-sm-5">
														<select class="form-control select2" id="edit-language">
															<option value="en_US">English</option>
															<option value="zh_CN">Chinese</option>
															<option value="fr_FR">France</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="edit-timezone">time zone</label>
													<div class="col-sm-5">
														<select class="form-control select2" id="edit-timezone">
															<option value="GMT+08:00">GMT+08:00</option>
															<option value="GMT+09:00">GMT+09:00</option>
															<option value="GMT+10:00">GMT+10:00</option>
														</select>
													</div>
												</div>
											</form><!-- /.form-horizontal -->
										</div>
									</div><!-- /.col-md-6 -->
								</div><!-- /.row -->
								<div class="box-footer">
									<a gpid="edit-save-btn" class="btn btn-info pull-right">Update</a>
								</div><!-- /.box-footer -->
							</div><!-- /.tab-pane -->
							<div id="tab_3" class="tab-pane <c:if test="${viewtab == 'ext'}">active</c:if> ">
								<div class="row m-l-none m-r-none">
									<div class="col-md-6">
										<div class="col-md-12  no-padding">
											<form class="form-inline">
												<label>Find : </label> <input gpid="ext-search-cond" type="text" placeholder="account/mail/mobile" class="form-control input-sm"> &nbsp;
												<a gpid="ext-search-btn" class="btn btn-default btn-sm"><i class="fa fa-search"></i></a>
												<a gpid="ext-clear-btn" class="btn btn-default btn-sm"><i class="fa fa-close"></i></a>
											</form>	
											<hr class="m-t-sm m-b-sm">
										</div>	
										<div class="col-md-12 no-padding">
											<table gpid="ext-list-table" class="table table-bordered table-condensed table-hover">
												<thead>
													<tr>
														<th>Account</th>
														<th>Name</th>
														<th>Mobile</th>
														<th>Email</th>
														<th>Act</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div><!-- /.box-body -->
									</div>
									<div class="col-md-6">
										<div class="col-md-12 no-padding">
										  <form class="form-inline">
											<label class="p-t-xxs  m-r-sm"> Entity Information </label>						
										  </form>
										  <hr class="m-t-sm m-b-sm">
										</div>
										<div class="col-md-12 no-padding">
											<form class="form-horizontal">									 
												<div class="form-group">
												  <label class="col-sm-3 control-label">Entity / Node</label>
												  <div class="col-sm-9">
													<p class="form-control-static"><span gpid="ext-entity-p" class="label label-success">EN0001</span> - <span gpid="ext-node-p" class="label label-warning">ND0022</span></p>
													<p gpid="ext-entity-name-p" class="form-control-static">Hard disk store setting</p>
												  </div>
												</div>
												<div class="form-group">
												  <label class="col-sm-3 control-label" >Account</label>
												  <div class="col-sm-9">
													<p gpid="ext-account-p" class="form-control-static">user1</p>
													<input type="hidden" id="ext-global-account" >
												  </div>
												</div>
												<div class="form-group">
												  <label class="col-sm-3 control-label" for="ext-name">Name</label>
												  <div class="col-sm-6">
													<input type="text" placeholder="Account name" id="ext-name" class="form-control">
												  </div>
												</div>
												<div class="form-group">
												  <label class="col-sm-3 control-label" >Mobile</label>
												  <div class="col-sm-9">
													<p gpid="ext-mobile-p" class="form-control-static">1827374646</p>
												  </div>
												</div>
												<div class="form-group">
												  <label class="col-sm-3 control-label" >Email</label>
												  <div class="col-sm-9">
													<p gpid="ext-email-p" class="form-control-static">rtyyy@176.com</p>
												  </div>
												</div>									
											</form>
										</div>
									</div>
								</div><!-- /.row -->
							  <div class="box-footer">
								<button gpid="ext-close-btn" class="btn btn-default" type="button">Close</button>
								<button gpid="ext-save-btn" class="btn btn-warning pull-right" type="button">Create</button>
							  </div><!-- /.box-footer -->
							</div>
							<div id="tab_4" class="tab-pane <c:if test="${viewtab == 'new'}">active</c:if> ">
								<div class="row m-l-none m-r-none">
									<div class="col-md-6">
										<div class="col-md-12 no-padding">
										  <form class="form-inline">
											<label class="p-t-xxs  m-r-sm"> Basic Information </label>						
										  </form>
										  <hr class="m-t-sm m-b-sm">
										</div>
										<div class="col-md-12 no-padding">
											<form class="form-horizontal">
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-account">account</label>
													<div class="col-sm-4">
													<input type="text" placeholder="account" value="dev1" id="new-account" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-name">name</label>
													<div class="col-sm-4">
													<input type="text" placeholder="name" value="dev1" id="new-name" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-type">type</label>
													<div class="col-sm-4">
														<select class="form-control select2" id="new-type">
														<option value="LDAP"> LDAP</option>
														<option value="INLINE">IN-LINE</option>
														<option value="EXTERN">EXTERN</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-password">password</label>
													<div class="col-sm-4">
													<input type="password" placeholder="set password" value="1" id="new-password" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-password-confirm">confirm</label>
													<div class="col-sm-4">
													<input type="password" placeholder="confirm password" value="1" id="new-password-confirm" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-email">email</label>
													<div class="col-sm-4">
													<input type="text" placeholder="email" id="new-email" value="dd@123.com" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-mobile">mobile</label>
													<div class="col-sm-4">
													<input type="text" placeholder="mobile" id="new-mobile" value="13910076754" class="form-control">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-phone">phone</label>
													<div class="col-sm-4">
													<input type="text" placeholder="phone" id="new-phone" value="78653542" class="form-control">
													</div>
												</div>
											</form>
										</div>
									</div><!-- /.col-md-6 -->
									<div class="col-md-6">
										<div class="col-md-12 no-padding">
										  <form class="form-inline">
											<label class="p-t-xxs  m-r-sm"> User Store Setting </label>						
										  </form>
										  <hr class="m-t-sm m-b-sm">
										</div>
										<div class="col-md-12 no-padding">
											<form class="form-horizontal">
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-storage-sel">Storage</label>
													<div class="col-sm-4">
														<select class="form-control select2" id="new-storage-sel" style="width : 150px;">
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-pub-cap">public cabinet</label>
													<div class="col-sm-4">
														<div class="input-group">
															<input type="text" id="new-pub-cap" value="${item.pubcapacity}" class="form-control">
															<span class="input-group-addon">G</span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-pri-cap">private cabinet</label>
													<div class="col-sm-4">
														<div class="input-group">
															<input type="text" id="new-pri-cap" value="${item.pricapacity}" class="form-control">
															<span class="input-group-addon">G</span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">International</label>
													<div class="col-sm-7 ">								
														<p gpid="new-store-setting" class = "form-control-static">International support Setting</p>
													</div>
												</div>
												<hr class="m-t-sm m-b-sm">
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-language">language</label>
													<div class="col-sm-4">
														<select class="form-control select2" id="new-language">
															<option value="en_US">English</option>
															<option value="zh_CN">Chinese</option>
															<option value="fr_FR">France</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="new-timezone">time zone</label>
													<div class="col-sm-4">
														<select class="form-control select2" id="new-timezone">
															<option value="GMT+08:00">GMT+08:00</option>
															<option value="GMT+09:00">GMT+09:00</option>
															<option value="GMT+10:00">GMT+10:00</option>
														</select>
													</div>
												</div>
											</form><!-- /.form-horizontal -->
										</div>
									</div><!-- /.col-md-6 -->
								</div><!-- /.row -->
								<div class="box-footer">
									<button type="button" gpid="new-close-btn" class="btn btn-default">Close</button>
									<button type="button" gpid="new-save-btn" class="btn btn-warning pull-right">Create</button>
								</div><!-- /.box-footer -->
							</div><!-- /.tab-pane -->
						</div><!-- /.tab-content -->						
					</div><!-- nav-tabs-custom -->
				</section><!-- /.content -->
			</div><!-- /.content-wrapper -->
			<footer class="main-footer">
				<div class="pull-right hidden-xs">
				  <b>Version</b> 2.3.0
				</div>
				<strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
			</footer>
		</div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="${path_plugins}/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${path_bootstrap}/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${path_plugins}/fastclick/fastclick.min.js"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- mustache -->
    <script src="${path_plugins}/mustache/mustache.min.js"></script>
    <script src="${path_plugins}/datatables/datatables.min.js" type="text/javascript"></script>
    <script src="${path_plugins}/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
	<script src="${path_plugins}/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <!-- Select2 -->
    <script src="${path_plugins}/select2/select2.full.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/ga/err-message.js"></script>
	<script src="${path_script}/ga/account.js"></script>
  </body>
</html>
