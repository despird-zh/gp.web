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
	<link rel="stylesheet" href="${path_plugins}/bootstrap-star-rating/css/star-rating.css" />
	<%@include file="../common/include.jsp" %>
	<!-- Morris charts -->
	<link rel="stylesheet" href="${path_plugins}/morris/morris.css" />
	
	
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
				<li class=""><a  href="topics.do" aria-expanded="false"><i class="fa fa-commenting"></i></a></li>
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
						<a href="messages.do" class="btn btn-default btn-sm bg-yellow active" data-option-value="*">
						   消息
						</a>
						<a href="notifications.do" class="btn btn-default btn-sm" data-option-value="*">
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
							<li class="list-group-item clearfix " >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="label label-warning text-center margin-r-5">测试工作群</span>
										<span class="label label-success text-center margin-r-5">关于某某问题审批</span>
										<span class="text-muted pull-right">8:03 PM Today</span>
									  </span><!-- /.username -->
									  <blockquote style="padding:0px 5px; margin-top:5px;margin-bottom:5px;font-size:14px;">
										<p style="margin:0;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
										<small>Someone famous in <cite title="Source Title">Source Title</cite> @ 3days</small>
									  </blockquote>
									  It is a long established fact that a reader will be distracted
									  by the readable content of a page when looking at its layout.									  
									</div><!-- /.comment-text -->
									<div class="comment-text clearfix" style="display:none;">									
									  <div class="input-group margin">
										<div class="input-group-btn">
										  <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" aria-expanded="false">Opinion <span class="fa fa-caret-down"></span></button>
										  <ul class="dropdown-menu">
											<li><a href="#">Approval 1st</a></li>
											<li><a href="#">Approval 2nd</a></li>
											<li><a href="#">Approval 3rd</a></li>
											<li class="divider"></li>
											<li><a href="#">Reject 1st</a></li>
											<li class="divider"></li>
											<li><a href="#">End Flow</a></li>
										  </ul>
										</div><!-- /btn-group -->
										<input type="text" class="form-control">
										<span class="input-group-btn">
										<button class="btn btn-info btn-flat" type="button">Submit</button>
										</span>
									  </div>
									</div>
									
									<div class="comment-text">
									<form class="form-inline margin" >
									   <div class="form-group form-group-sm margin-r-5">
										  <label class="control-label">Opinion</label>
										  <input id="memory" style = "width:440px;" type="text" class="form-control ">
									  </div>
									  <div class="form-group form-group-sm margin-r-5">
										  <div class="radio">
											<label>
											  <input type="radio" checked="" value="option1" id="optionsRadios1" name="optionsRadios">
											  Approval
											</label>
										  </div>
										  <div class="radio">
											<label>
											  <input type="radio" value="option2" id="optionsRadios2" name="optionsRadios">
											  Reject
											</label>
										  </div>
										</div>
									  <div class="form-group form-group-sm margin-r-5">
												<select id="memoryType"  class="form-control">
												   <option value="GB" selected="selected">GB</option>
												   <option value="MB">MB</option>
												</select>
									   </div>
									   <a class="btn btn-primary btn-sm" type="submit"><i class="fa fa-gavel"></i></a>
									</form>
									</div>
									<div class="comment-text">
										<div class="row stage-container" style="margin-left:0px; margin-right:0px; border-bottom:0px;">

											<div class="stage tmm-current col-md-3 col-sm-3">
												<div class="stage-header "><i class="fa fa-thumbs-o-up"></i></div>
												<div class="stage-content">
													<h5 class="stage-title">Account Information</h5>
													<div class="stage-info">
														Enter your first time username
														passworddetails
													</div> 
												</div>
											</div><!--/ .stage-->

											<div class="stage col-md-3 col-sm-3">
												<div class="stage-header"><i class="fa fa-hand-o-right"></i></div>
												<div class="stage-content">
													<h5 class="stage-title">Personal Information</h5>
													<div class="stage-info">
														Enter your first time username
														passworddetails
													</div>
												</div>
											</div><!--/ .stage-->

											<div class="stage col-md-3 col-sm-3">
												<div class="stage-header "><i class="fa  fa-hand-o-right"></i></div>
												<div class="stage-content">
													<h5 class="stage-title">Payment Information</h5>
													<div class="stage-info">
														Enter your first time username
														passworddetails
													</div>
												</div>
											</div><!--/ .stage-->

											<div class="stage col-md-3 col-sm-3">
												<div class="stage-header "><i class="fa fa-hand-paper-o"></i></div>
												<div class="stage-content">
													<h5 class="stage-title">Confirm Your Details</h5>
													<div class="stage-info">
														Enter your first time username
														passworddetails
													</div> 
												</div>
											</div><!--/ .stage-->
										</div>
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
										<span class="label label-warning text-center margin-r-5">私有消息</span>
										<span class="label label-success text-center margin-r-5">关于某某询问</span>
										<span class="text-muted pull-right">
											<a class="margin-r-5" data-toggle="tooltip" title="Reply Message"><i class="fa fa-reply"></i></a>
											<a class="margin-r-5" data-toggle="tooltip" title="View More"><i class="fa fa-list-ol"></i></a>
											<a class="margin-r-5" data-toggle="tooltip" title="Ignore"><i class="fa fa-hand-paper-o"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									  </span><!-- /.username -->
									  <blockquote style="padding:0px 5px; margin-top:5px;margin-bottom:5px;font-size:14px;">
										<p style="margin:0;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
										<small>Someone famous in <cite title="Source Title">Source Title</cite> @ 3days</small>
									  </blockquote>
									  It is a long established fact that a reader will be distracted
									  by the readable content of a page when looking at its layout.
									  
									</div><!-- /.comment-text -->
									<div class="comment-text clearfix" style="">									
									  <div class="input-group input-group-sm margin">
										<span class="input-group-addon"><i class="fa fa-commenting-o"></i></span>
										<input type="text" class="form-control">
										<span class="input-group-btn">
										<button class="btn btn-info btn-flat" type="button"><i class="fa fa-paper-plane-o"></i></button>
										</span>
									  </div>
									</div>
								</div>
							</li>
							<li class="list-group-item clearfix " >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="label label-warning text-center margin-r-5">公共消息</span>
										<span class="label label-success text-center margin-r-5">关于某某问题投票</span>
										<span class="text-muted pull-right">
											<a class="margin-r-5" data-toggle="tooltip" title="Show statistics"><i class="fa fa-bar-chart"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									  </span><!-- /.username -->									  
									</div><!-- /.comment-text -->
									<div class="comment-text clearfix margin" style="margin-bottom:0px;">									
									  <dl class="dl-horizontal" style="margin-bottom:5px;">
										<dt style="width:90px;">调研打卡制度投票</dt>
										<dd style="margin-left:100px;">请根据个人意见，对打卡制度进行投票</dd>
										<dd style="margin-left:100px;"><input id="rate1" value="0" type="number"></dd>
										<dt style="width:90px;">Euismod</dt>
										<dd style="margin-left:100px;">Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
										<dd style="margin-left:100px;"><input id="rate2" value="0" type="number" class="rating" min=0 max=5 step=1 data-size="xs" ></dd>								
									  </dl>
									</div><!-- /.comment-text -->
									<div class="comment-text clearfix ">
									  <div class="chart pull-left" id="sales-chart" style="height: 150px; width:200px; "></div>
									  <div class="pull-left" style="width:400px;">
										<dl class="dl-horizontal" style="margin-top:20px;">
											<dt style="width:90px; font-size:12px;">同意</dt>
											<dd style="margin-left:100px;">9 人</dd>										
											<dt style="width:90px; font-size:12px;">不同意</dt>
											<dd style="margin-left:100px;">9 人</dd>	
										  </dl>
									  </div>
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
										<span class="label label-warning text-center margin-r-5">测试工作群</span>
										<span class="label label-success text-center margin-r-5">关于某某问题讨论</span>
										<span class="text-muted pull-right">
											<a class="margin-r-5"><i class="fa fa-bell"></i></a>
											<a class="margin-r-5"><i class="fa fa-bell"></i></a>
											<a class="margin-r-5"><i class="fa fa-bell"></i></a>
										</span>
										<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
									  </span><!-- /.username -->
									  <blockquote style="padding:0px 5px; margin-top:5px;margin-bottom:5px;font-size:14px;">
										<p style="margin:0;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
										<small>Someone famous in <cite title="Source Title">Source Title</cite> @ 3days</small>
									  </blockquote>
									  It is a long established fact that a reader will be distracted
									  by the readable content of a page when looking at its layout.
									  
									</div><!-- /.comment-text -->
									<div class="comment-text clearfix" style="">									
									  <div class="input-group input-group-sm margin">
										<span class="input-group-addon"><i class="fa fa-commenting-o"></i></span>
										<input type="text" class="form-control">
										<span class="input-group-btn">
										<button class="btn btn-info btn-flat" type="button"><i class="fa fa-paper-plane-o"></i></button>
										</span>
									  </div>
									</div><!-- /.comment-text -->
								</div>
							</li>
							<li class="list-group-item clearfix " >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="label label-warning text-center margin-r-5">测试工作群</span>
										<span class="label label-success text-center margin-r-5">关于某某文档批注</span>
										<span class="text-muted pull-right">8:03 PM Today</span>
									  </span><!-- /.username -->
									  <blockquote style="padding:0px 5px; margin-top:5px;margin-bottom:5px;font-size:14px;">
										<p style="margin:0;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
										<small>Someone famous in <cite title="Source Title">Source Title</cite> @ 3days</small>
									  </blockquote>
									  It is a long established fact that a reader will be distracted
									  by the readable content of a page when looking at its layout.
									  
									</div><!-- /.comment-text -->
									<div class="comment-text clearfix" style="">									
									  <div class="input-group input-group-sm margin">
										<span class="input-group-addon"><i class="fa fa-commenting-o"></i></span>
										<input type="text" class="form-control">
										<span class="input-group-btn">
										<button class="btn btn-info btn-flat" type="button"><i class="fa fa-paper-plane-o"></i></button>
										</span>
									  </div>
									</div>
								</div>
							</li>
							<li class="list-group-item clearfix " >
								<div class="box-comment" style="padding:4px 6px;">
									<!-- User image -->
									<img alt="User Image" src="${path_image}/user3-128x128.jpg" class="img-circle img-sm">
									<div class="comment-text">
									  <span class="username">
										Maria Gonzales
										<span class="label label-warning text-center margin-r-5">测试工作群</span>
										<span class="label label-success text-center margin-r-5">关于某某分享</span>
										<span class="text-muted pull-right">8:03 PM Today</span>
									  </span><!-- /.username -->
									  <blockquote style="padding:0px 5px; margin-top:5px;margin-bottom:5px;font-size:14px;">
										<p style="margin:0;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
										<small>Someone famous in <cite title="Source Title">Source Title</cite> @ 3days</small>
									  </blockquote>
									  It is a long established fact that a reader will be distracted
									  by the readable content of a page when looking at its layout.
									  
									</div><!-- /.comment-text -->
									<div class="comment-text clearfix" style="">									
									  <div class="input-group input-group-sm margin">
										<span class="input-group-addon"><i class="fa fa-commenting-o"></i></span>
										<span class="input-group-addon">UserXX</span>
										<input type="text" class="form-control">
										<span class="input-group-btn">
											<button class="btn btn-info btn-flat" type="button"><i class="fa fa-paper-plane-o"></i></button>
										</span>
									  </div>
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
