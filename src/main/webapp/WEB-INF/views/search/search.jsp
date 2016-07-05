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
			<div class="container">
				<section class="content-header">
					<h1>检索结果 
					<small>展示检索内容</small></h1>
					<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 10px; top: 15px;">
						<li class="active">
							<a href="personspace2.html" aria-expanded="false">讨论</a>
						</li>
						<li class="">
							<a href="personspace1.html" aria-expanded="true">文件</a>
						</li>
						<li class="">
							<a href="personspace3.html" aria-expanded="false">分享</a>
						</li>
						<li class="">
							<a href="personspace3.html" aria-expanded="false">工作组</a>
						</li>
					</ul>
				</section>
				<!-- Main content -->
				<section class="content">
					<div class="row">
						<div class="col-lg-12">
							<div id="options" class="gallery-filter-container">
								<span>
								<a href="personspace4.html" class="btn btn-default btn-sm" data-option-value="*">Word</a> 
								<a href="personspace4.1.html" class="btn btn-default btn-sm" data-option-value="*">PDF</a> 
								<a href="personspace4.1.html" class="btn btn-default btn-sm" data-option-value="*">PPT</a></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-9">
							<div class="box box-widget">
								<div class="box-header" style="">
									<div class="folder-descr">
										<span class="text">Search Hit <strong>4</strong> files is founded in <strong>12</strong> minutes.</span>
									</div>
								</div>
								<!-- /.box-header-->
								<div class="box-body repo-list" style="padding:0px;">
									<ul class="list-group list-group-unbordered box-comments">
										<li class="list-group-item clearfix">
											<div class="box-comment" style="padding:4px 6px;">
												<!-- User image -->
												<img alt="User Image" src="${path_image}/user3-128x128.jpg"
												class="img-circle img-sm" />
												<div class="comment-text">												
												<span class="username">
													<span class="label label-default margin-r-5">某某工作组</span> 
													/临时目录1/目录2/临时设计文件.doc owned by 刘琪琪 
													<span class="text-muted pull-right" style="font-size:1.1em;">
														<a class="margin-r-5"><i class="fa fa-download"></i></a>
														<a class="margin-r-5"><i class="fa fa-eye"></i></a>
														<a class="margin-r-5"><i class="fa fa-info"></i></a>
													</span>												
												</span>
												<ul class="list-inline" style="margin-top:5px;">
													<li><span class="label label-default" style=""><i class="fa fa-share-alt"></i></span></li>
													<li><span class="label label-default bg-red" style="font-size:10px;">C</span></li>
													<li><span class="label label-default" style="">Ver</span>
													<div style="display: inline-block;">
														<div class="countinfo">
															<span >
															<span class="">1.2</span>
															</span>
														</div>
														<div class="countinfonub"><s></s><i></i></div>
													</div>
													</li>
													<li><span class="label label-default" style="">Size</span>
													<div style="display: inline-block;">
														<div class="countinfo">
															<span >
															<span class="">56 K</span>
															</span>
														</div>
														<div class="countinfonub"><s></s><i></i></div>
													</div>
													</li>
												</ul>								
												</div>
												<!-- /.comment-text -->
												<div class="comment-text " style="font-size:14px;margin-bottom:0px;margin-top:5px;">
													<p style="margin-bottom:3px;">苹果的环保措施不只是“种树”或“处理污水”这个层次。<font class="text-yellow">库克的想法是</font>，不仅自己要用上清洁能源，还要逐步帮助自己的供应链(例如富士康)也用上清洁能源，自己供应链企业未来也要达到碳中和的目标。
													</p>
													
													<p class="tags xsmall" style="margin-bottom:0px;">
													<a title="" href="" class="tag-red ">Fashion</a>
													<a title="" href="" class="tag-yellow ">测试</a>
													<a title="" href="" class="tag-blue ">学习</a>
													<a title="" href="" class="tag-green  ">Java</a>
													<a title="" href="" class="tag-default ">工具</a>
													<a title="" href="" class="tag-red  ">专业</a>
													<a title="" href="" class="tag-red ">电气</a>
													<a title="" href="" class="tag-red ">评分</a>
													<a title="" href="" class="tag-red  ">投票</a>
													<a title="" href="" class="tag-red  ">更新</a>
													</p>
													<span class="text-muted pull-right margin-r-5">8:03 PM Today created / 8:03 PM Today modified</span>
												</div>
											</div>
										</li>
										<li class="list-group-item clearfix">
											<div class="box-comment" style="padding:4px 6px;">
												<!-- User image -->
												<img alt="User Image" src="${path_image}/user3-128x128.jpg"
												class="img-circle img-sm" />
												<div class="comment-text">												
												<span class="username">
													<span class="label label-default margin-r-5">某某工作组</span> 
													/临时目录1/目录2/临时设计文件.doc owned by 刘琪琪 
													<span class="text-muted pull-right">
														<a class="margin-r-5"><i class="fa fa-download"></i></a>
														<a class="margin-r-5"><i class="fa fa-eye"></i></a>
													</span> 
													<span class="text-muted pull-right margin-r-5">8:03 PM Today created / 8:03 PM Today modified</span>
												</span>
												<ul class="list-inline" style="margin-top:5px;">
													<li><span class="label label-default" style=""><i class="fa fa-share-alt"></i></span></li>
													<li><span class="label label-default bg-red" style="font-size:10px;">C</span></li>
													<li><span class="label label-default" style="">Ver</span>
													<div style="display: inline-block;">
														<div class="countinfo">
															<span >1.2</span>
														</div>
														<div class="countinfonub"><s></s><i></i></div>
													</div>
													</li>
													<li><span class="label label-default" style="">Size</span>
													<div style="display: inline-block;">
														<div class="countinfo">
															<span class="">56 K</span>															
														</div>
														<div class="countinfonub"><s></s><i></i></div>
													</div>
													</li>
												</ul>								
												</div>
												<!-- /.comment-text -->
												<div class="comment-text " style="font-size:14px;margin-bottom:0px;margin-top:5px;">
													<p style="margin-bottom:3px;">苹果的环保措施不只是“种树”或“处理污水”这个层次。<font class="text-yellow">库克的想法是</font>，不仅自己要用上清洁能源，还要逐步帮助自己的供应链(例如富士康)也用上清洁能源，自己供应链企业未来也要达到碳中和的目标。
													</p>
													<p class="tags xsmall" style="margin-bottom:0px;">
													<a title="" href="" class="tag-red text-muted ">Fashion</a>
													<a title="" href="" class="tag-red text-muted ">My Movies</a>
													</p>
												</div>
											</div>
										</li>
									</ul>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>
						<div class="col-md-3">
							<div class="box box-widget">
								<div class="box-header with-border" style="padding-bottom: 9px; padding-top: 9px;">
									<div class="view-toolbar clearfix" style="margin-bottom: 0px;">
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
									</div><!-- toolbar -->
								</div>
								<div class="box-body box-profile">
									<div class="clearfix">
										<div class="pull-left lite-info">
											<img class="profile-user-img img-responsive img-circle"
											src="${path_image}/user4-128x128.jpg" alt="User profile picture" />
											<div>
												<p class="text-muted text-center">owned by 
												<a>Gary</a></p>
												<p class="text-muted text-center">since 2015-6-7</p>
											</div>
										</div>
										<ul class="stats-info list-group list-group-unbordered pull-right">
											<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
											<b>任务</b> 
											<a class="pull-right">1,322</a></li>
											<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
											<b>共享</b> 
											<a class="pull-right">543</a></li>
											<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
											<b>文件</b> 
											<a class="pull-right">13,287</a></li>
											<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
											<b>讨论</b> 
											<a class="pull-right">13,287</a></li>
											<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
											<b>工作组</b> 
											<a class="pull-right">13,287</a></li>
										</ul>
									</div>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
							<!-- About Me Box -->
							<div class="box box-widget">
								<div class="box-header with-border">
									<h3 class="box-title">About</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<strong>Description</strong>
									<p class="text-muted">B.S. in Computer Science from the University of Tennessee at
									Knoxville</p>
									<hr style="margin-bottom: 5px; margin-top: 5px;" />
									<strong>Organization</strong>
									<p class="text-muted">Branch 华东 co.</p>
									<hr style="margin-bottom: 5px; margin-top: 5px;" />
									<strong>Tags</strong>
									<p>
									<span class="label label-danger">UI Design</span> 
									<span class="label label-success">Coding</span> 
									<span class="label label-info">Javascript</span> 
									<span class="label label-warning">PHP</span> 
									<span class="label label-primary">Node.js</span></p>
									<hr style="margin-bottom: 5px; margin-top: 5px;" />
									<strong>Notes</strong>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
							<div class="box box-widget">
								<div class="box-header with-border">
									<h3 class="box-title">Clipboard Information</h3>
									<div class="box-tools">
										<small class="label label-success">5</small>
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<ul obid="docs_list" class="doc-list">
										<li>
											<!-- inner menu: contains the actual data -->
											<ul class="doc-items">
												<li>
												<!-- start message -->
												
												<a href="#">
												<span class="ellipsis ellipsis-140" style="line-height:16px;">Support Team</span> 
												<small>5 mins</small></a> 
												<a obid="remove_btn" class="pull-right"></a></li>
												<!-- end message -->
												<li>
												<a href="#">
												<span class="ellipsis ellipsis-140" style="line-height:16px;">AdminLTE Design
												Team</span> 
												<small>2 hours</small></a> 
												<a obid="remove_btn" class="pull-right"></a></li>
												<li>
												<a href="#">
												<span class="ellipsis ellipsis-140" style="line-height:16px;">Developers</span> 
												<small>Today</small></a> 
												<a obid="remove_btn" class="pull-right"></a></li>
												<li>
												<a href="#">
												<span class="ellipsis ellipsis-140" style="line-height:16px;">Sales
												Department</span> 
												<small>Yesterday</small></a> 
												<a obid="remove_btn" class="pull-right"></a></li>
												<li>
												<a href="#">
												<span class="ellipsis ellipsis-140" style="line-height:16px;">Reviewers</span> 
												<small>2 days</small></a> 
												<a obid="remove_btn" class="pull-right"></a></li>
											</ul>
										</li>
									</ul>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>
						<div class="clearfix"></div>
					</div>
				</section>
				<!-- /.content -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<%@include file="../common/footer.jsp" %>
		</footer>
	</div>
	<!-- ./wrapper -->

	<!-- SlimScroll -->	
	<script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script> 
	<!-- FastClick -->	
	<script src="${path_plugins}/fastclick/fastclick.min.js"></script> 
	<!-- Sparkline -->	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script> 
	<script src="${path_plugins}/morris/morris.min.js"></script> 
	<!-- AdminLTE App -->
	
	<script src="${path_script}/app.min.js"></script> 
	<script src="${path_plugins}/jstree/dist/jstree.min.js"></script> 
	<script src="${path_plugins}/bootstrap-star-rating/js/star-rating.js"></script> 
	<script src="${path_script}/pages/search.js"></script> 
	<!-- AdminLTE for demo purposes -->
	
	<script src="${path_script}/demo.js"></script></body>
</html>
