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
						  分享资源
						  <small>查看相关分享资源</small>
						</h1>
						<jsp:include page="../common/page-navs.jsp" flush="true">
							<jsp:param name="page" value="notifications"/>
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
			  <div class="box box-widget">
					<div class="box-header repo-header with-border">
						<a gpid="filter-switch-btn" class="pull-left btn btn-default btn-header-circle" role="button" ><i class="fa fa-angle-double-down"></i> </a>
						<ul class="nav nav-pills m-l-xxs">
							<li><a href="tasks.do" class="filter-nav m-l-xs">任务 <span class="badge">100</span></a></li>
							<li><a href="messages.do" class="filter-nav m-l-xs">消息 <span class="badge badge-primary">50</span></a></li>
							<li class="active"><a href="notifications.do" class="filter-nav m-l-xs">通知 <span class="badge badge-warning">24</span></a></li>
						</ul>
					</div>
					<div class="box-body repo-list">					
						<ul class="list-group list-group-unbordered box-comments">
							<li class="list-group-item clearfix" >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="badge text-center margin-r-5"  style="font-size:60%;">系统通知</span>										
										<span class="text-muted pull-right">
											<a class="margin-r-5"><i class="fa fa-info-circle"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									  </span><!-- /.username -->									  
									  
									</div><!-- /.comment-text -->
									<div class="comment-text margin" style="font-size:12px;">
									<span>用户<span class="label label-danger">孙惊喜</span>被加入到工作组<span class="label label-danger">临时工作组</span>中。
									  </span>
									</div>
								</div>
							</li>
							<li class="list-group-item clearfix" >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="badge bg-green text-center margin-r-5"  style="font-size:60%;">收藏通知</span>
										<span class="text-center margin-r-5 text-blue" style="font-size:12px;"> <i class="fa fa-file-o"></i> 观察结果整理</span>
										<span class="text-muted pull-right">
											<a class="margin-r-5"><i class="fa fa-info-circle"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									  </span><!-- /.username -->
									</div><!-- /.comment-text -->		
									<div class="comment-text margin" style="font-size:12px;">
									<span>用户<span class="label label-danger">孙惊喜</span>收藏文件。
									</span>
									</div>									
								</div>
							</li>
							<li class="list-group-item clearfix" >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="badge bg-red-active text-center margin-r-5"  style="font-size:60%;">收藏通知</span>
										<span class="text-center margin-r-5 text-blue" style="font-size:12px;"> <i class="fa fa-file"></i> 观察结果整理</span>
										<span class="text-muted pull-right">
											<a class="margin-r-5"><i class="fa fa-info-circle"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									  </span><!-- /.username -->
									</div><!-- /.comment-text -->		
									<div class="comment-text margin" style="font-size:12px;">
										<span>收藏的文件被用户<span class="label label-danger">孙惊喜</span>修改。
									</span>
									</div>									
								</div>
							</li>
							<li class="list-group-item clearfix" >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="label label-default text-center margin-r-5">收藏通知</span>
										<span class="text-center margin-r-5 text-blue" style="font-size:12px;"> <i class="fa fa-folder"></i> 观察结果整理</span>
										<span class="text-muted pull-right">
											<a class="margin-r-5"><i class="fa fa-info-circle"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									  </span><!-- /.username -->
									</div><!-- /.comment-text -->		
									<div class="comment-text margin" style="font-size:12px;">
										<span>
										<span>收藏的文件被用户<span class="label label-danger">孙惊喜</span>删除。
										</span>
									</div>									
								</div>
							</li>
							<li class="list-group-item clearfix" >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="label label-default text-center margin-r-5">分享通知</span>
										<span class="text-center margin-r-5 text-blue" style="font-size:12px;"> <i class="fa fa-folder"></i> 项目电气文档集合</span>
										<span class="text-muted pull-right">
											<a class="margin-r-5"><i class="fa fa-info-circle"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									  </span><!-- /.username -->
									</div><!-- /.comment-text -->		
									<div class="comment-text margin" style="font-size:12px;">
										<span>分享的文件夹被用户<span class="label label-danger">孙惊喜</span>访问。
									</span>
									</div>									
								</div>
							</li>
							<li class="list-group-item clearfix" >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="label label-default text-center margin-r-5">分享通知</span>
										<span class="text-center margin-r-5 text-blue" style="font-size:12px;"> <i class="fa fa-folder"></i> 项目电气文档集合</span>
										<span class="text-muted pull-right">
											<a class="margin-r-5"><i class="fa fa-info-circle"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									  </span><!-- /.username -->
									</div><!-- /.comment-text -->		
									<div class="comment-text margin" style="font-size:12px;">
										<span>用户<span class="label label-danger">孙惊喜</span>提交文件 2015设计标准.doc。
									</span>
									</div>									
								</div>
							</li>
							<li class="list-group-item clearfix" >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="label label-default text-center margin-r-5">分享通知</span>
										<span class="text-center margin-r-5 text-blue" style="font-size:12px;"> <i class="fa fa-folder"></i> 项目电气文档集合</span>
										<span class="text-muted pull-right">
											<a class="margin-r-5"><i class="fa fa-info-circle"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									  </span><!-- /.username -->
									</div><!-- /.comment-text -->		
									<div class="comment-text margin" style="font-size:12px;">
										<span>用户<span class="label label-danger">孙惊喜</span>下载文件 2015设计标准.doc。阅后即焚，分享失效。
									</span>
									</div>									
								</div>
							</li>
							<li class="list-group-item clearfix" >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="label label-default text-center margin-r-5">工作组通知</span>
										<span class="text-center margin-r-5 text-blue" style="font-size:12px;"> <i class="fa fa-folder"></i> 北京项目工作组</span>
										<span class="text-muted pull-right">
											<a class="margin-r-5"><i class="fa fa-info-circle"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									  </span><!-- /.username -->
									</div><!-- /.comment-text -->		
									<div class="comment-text margin" style="font-size:12px;">
										<span>
										用户<span class="label label-danger">孙惊喜</span>从工作组中移除
										</span>
									</div>									
								</div>
							</li>
						<ul> <!-- /.list-group -->
					</div><!-- /.box-body -->
				</div><!-- /.box -->
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
			  <div class="box box-widget">
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
    <script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${path_plugins}/fastclick/fastclick.min.js"></script>
	<!-- mustache -->
	<script src="${path_plugins}/mustache/mustache.min.js" type="text/javascript"></script>
	<!-- Sparkline -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="${path_plugins}/morris/morris.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${path_script}/app.ctx.js" type="text/javascript"></script>
	<!-- GPress Err Message -->
	<script src="${path_script}/message.js" type="text/javascript"></script>

	<script src="${path_plugins}/bootstrap-star-rating/js/star-rating.js"></script>
	<script src="${path_script}/pages/personspace4.js"></script>
    <!-- AdminLTE for demo purposes -->
	<script src="${path_script}/pages/workspace/meta.js" type="text/javascript"></script>
  </body>
</html>
