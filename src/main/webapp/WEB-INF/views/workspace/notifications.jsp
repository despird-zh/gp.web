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
        <div class="container">

          <section class="content-header">
            <h1>
              任务消息
              <small>查看相关任务及消息</small>
            </h1>
			<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 10px; top: 15px;">
				<li class=""><a  href="topics.do" data-container="body" data-toggle="tooltip" title="this is a demo tooltip."><i class="fa fa-commenting"></i></a></li>
				<li class=""><a  href="netdisk.do" aria-expanded="true"><i class="fa fa-database"></i></a></li>
				<li class=""><a  href="shares.do" aria-expanded="false"><i class="fa fa-share-alt"></i></a></li>        
				<li class="active"><a  href="tasks.do" aria-expanded="false"><i class="fa fa-flag"></i></a></li>   				  
                  <li class="pull-right"><a class="text-muted" href="#"><i class="fa fa-th-list"></i></a></li>
				  <li class="pull-right"><a class="text-muted" href="#"><i class="fa fa-th"></i></a></li>
            </ul>
          </section>

          <!-- Main content -->
          <section class="content">

			<div class="row">
				<div class="col-lg-12">		
				<div id="options" class="gallery-filter-container">	
					<span>
						<a href="tasks.do" class="btn btn-default btn-sm" data-option-value="*">
						   任务
						</a>
						<a href="messages.do" class="btn btn-default btn-sm" data-option-value="*">
						   消息
						</a>
						<a href="notifications.do" class="btn btn-default btn-sm bg-yellow active" data-option-value="*">
						   通知
						</a>
					</span>					
				  
				  </div>
				</div>
			</div>
		  <div class="row">
			<div class="col-md-9">
			  <div class="box box-widget">
					<div class="box-header" style="">
						<div class="folder-descr">
							<span class="text">Design a nice theme Make the theme responsive 1Make the theme responsive 2Make the theme responsive</span>
						</div>
					</div><!-- /.box-header-->
					<div class="box-body repo-list" style="padding:0px;">					
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
				<div class="box box-widget">
				<div class="box-header with-border" style="padding-bottom: 9px; padding-top: 9px;">
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
							<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
							  <b>工作组</b> <a class="pull-right">13,287</a>
							</li>
						 </ul>
					</div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              <!-- About Me Box -->
              <div class="box box-widget">
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
	<script src="${path_plugins}/morris/morris.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.min.js"></script>
	<script src="${path_plugins}/jstree/dist/jstree.min.js"></script>
	<script src="${path_plugins}/bootstrap-star-rating/js/star-rating.js"></script>
	<script src="${path_script}/pages/personspace4.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${path_script}/demo.js"></script>
  </body>
</html>
