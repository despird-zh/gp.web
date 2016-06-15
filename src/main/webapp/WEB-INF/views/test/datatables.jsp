<%@ page language="java" errorPage="/WEB-INF/view/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>

<!DOCTYPE html>
<html lang="zh_CN">
	<head>
		<meta name="generator"
		content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<title>AdminLTE 2 | Top Navigation</title>
		<!-- Tell the browser to be responsive to screen width -->
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
		<link rel="stylesheet" href="${path_plugins}/datatables/datatables.min.css" />
		<link rel="stylesheet" href="${path_plugins}/datatables/plugins/bootstrap/datatables.bootstrap.css"/>
		<link rel="stylesheet" href="${path_plugins}/uniform/themes/default/css/uniform.default.min.css" />
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
			<div class="container" style="min-height: 400px;">
				<div class="row">
					<div class="col-md-12">
						<div class="portlet-body" style="background-color:#fff;padding:20px;">
							<div class="table-toolbar">
								<div class="row">
									<div class="col-md-6">
										<div class="btn-group">
											<button id="sample_editable_1_new" class="btn sbold green"> Add New
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
									<div class="col-md-6">
										<div class="btn-group pull-right">
											<button class="btn green  btn-outline dropdown-toggle" data-toggle="dropdown">Tools
												<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right">
												<li>
													<a href="javascript:;">
														<i class="fa fa-print"></i> Print </a>
												</li>
												<li>
													<a href="javascript:;">
														<i class="fa fa-file-pdf-o"></i> Save as PDF </a>
												</li>
												<li>
													<a href="javascript:;">
														<i class="fa fa-file-excel-o"></i> Export to Excel </a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<table class="table table-striped table-bordered table-condensed table-hover table-checkable" id="sample_1">
								<thead>
									<tr>
										<th>
											<input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /> </th>
										<th> Username </th>
										<th> Email </th>
										<th> Status </th>
										<th> Joined </th>
										<th> Actions </th>
									</tr>
								</thead>
								<tbody>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> shuxer </td>
										<td>
											<a href="mailto:shuxer@gmail.com"> shuxer@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-success"> Approved </span>
										</td>
										<td class="center"> 12 Jan 2012 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> looper </td>
										<td>
											<a href="mailto:looper90@gmail.com"> looper90@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> userwow </td>
										<td>
											<a href="mailto:userwow@yahoo.com"> userwow@yahoo.com </a>
										</td>
										<td>
											<span class="label label-sm label-success"> Approved </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> user1wow </td>
										<td>
											<a href="mailto:userwow@gmail.com"> userwow@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-danger"> Blocked </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> restest </td>
										<td>
											<a href="mailto:userwow@gmail.com"> test@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-success"> Approved </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> foopl </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-info"> Info </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> weep </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-danger"> Rejected </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> coop </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-info"> Info </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> pppol </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-danger"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> test </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> userwow </td>
										<td>
											<a href="mailto:userwow@gmail.com"> userwow@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> test </td>
										<td>
											<a href="mailto:userwow@gmail.com"> test@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> goop </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> weep </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> toopl </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> userwow </td>
										<td>
											<a href="mailto:userwow@gmail.com"> userwow@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> tes21t </td>
										<td>
											<a href="mailto:userwow@gmail.com"> test@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> fop </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> kop </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> vopl </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> userwow </td>
										<td>
											<a href="mailto:userwow@gmail.com"> userwow@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> wap </td>
										<td>
											<a href="mailto:userwow@gmail.com"> test@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> test </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> toop </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
									<tr class="odd gradeX">
										<td>
											<input type="checkbox" class="checkboxes" value="1" /> </td>
										<td> weep </td>
										<td>
											<a href="mailto:userwow@gmail.com"> good@gmail.com </a>
										</td>
										<td>
											<span class="label label-sm label-warning"> Suspended </span>
										</td>
										<td class="center"> 12.12.2011 </td>
										<td>
											<div class="btn-group">
												<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions
													<i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a href="javascript:;">
															<i class="icon-docs"></i> New Post </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-tag"></i> New Comment </a>
													</li>
													<li>
														<a href="javascript:;">
															<i class="icon-user"></i> New User </a>
													</li>
													<li class="divider"> </li>
													<li>
														<a href="javascript:;">
															<i class="icon-flag"></i> Comments
															<span class="badge badge-success">4</span>
														</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					<!-- END EXAMPLE TABLE PORTLET-->
					</div>
				</div>
			</div>
			<!-- /.container -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<%@include file="../common/footer.jsp" %>
		</footer>
	</div>
	<!-- ./wrapper -->
	<!-- jQuery 2.1.4 -->
	<script src="${path_plugins}/jQuery/jquery.min.js"></script> 
	<!-- Bootstrap 3.3.5 -->	
	<script src="${path_bootstrap}/js/bootstrap.min.js"></script> 
	<!-- SlimScroll -->	
	<script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script> 
	<!-- FastClick -->	
	<script src="${path_plugins}/fastclick/fastclick.min.js"></script> 
	<!-- Sparkline -->	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script> 
    <script src="${path_plugins}/datatables/datatables.min.js" type="text/javascript"></script>
    <script src="${path_plugins}/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
	<script src="${path_plugins}/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
			
			var table = $('#sample_1');

			// begin first table
			table.dataTable({

				// Internationalisation. For more info refer to http://datatables.net/manual/i18n
				"language": {
					"aria": {
						"sortAscending": ": activate to sort column ascending",
						"sortDescending": ": activate to sort column descending"
					},
					"emptyTable": "No data available in table",
					"info": "Showing _START_ to _END_ of _TOTAL_ records",
					"infoEmpty": "No records found",
					"infoFiltered": "(filtered1 from _MAX_ total records)",
					"lengthMenu": "Show _MENU_",
					"search": "Search:",
					"zeroRecords": "No matching records found",
					"paginate": {
						"previous":"Prev",
						"next": "Next",
						"last": "Last",
						"first": "First"
					}
				},

				// Or you can use remote translation file
				//"language": {
				//   url: '//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Portuguese.json'
				//},

				// Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
				// setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
				// So when dropdowns used the scrollable div should be removed. 
				//"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

				"bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

				"columnDefs": [ {
					"targets": 0,
					"orderable": false,
					"searchable": false
				}],

				"lengthMenu": [
					[5, 15, 20, -1],
					[5, 15, 20, "All"] // change per page values here
				],
				// set the initial value
				"pageLength": 5,            
				"pagingType": "bootstrap_full_number",
				"columnDefs": [{  // set default column settings
					'orderable': false,
					'targets': [0]
				}, {
					"searchable": false,
					"targets": [0]
				}],
				drawCallback : function(){
					
					$('input[type="checkbox"]').uniform();
				},
				"order": [
					[1, "asc"]
				] // set first column as a default sort by asc
			});

			
			var tableWrapper = jQuery('#sample_1_wrapper');

			table.find('.group-checkable').change(function () {
				var set = jQuery(this).attr("data-set");
				var checked = jQuery(this).is(":checked");
				jQuery(set).each(function () {
					if (checked) {
						$(this).prop("checked", true);
						$(this).parents('tr').addClass("active");
					} else {
						$(this).prop("checked", false);
						$(this).parents('tr').removeClass("active");
					}
				});
				jQuery.uniform.update(set);
			});

			table.on('change', 'tbody tr .checkboxes', function () {
				$(this).parents('tr').toggleClass("active");
			});
			
        });		  
		 
    </script>
</html>
