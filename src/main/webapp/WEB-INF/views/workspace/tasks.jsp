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
						<h1 style="font-size: 18px; margin-top: 10px; margin-bottom: 0px; margin-left: 10px;">
						  分享资源
						  <small>查看相关分享资源</small>
						</h1>
						<jsp:include page="../workspace/page-navs.jsp" flush="true">
							<jsp:param name="currPage" value="tasks"/>
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
						<li class="active"><a href="tasks.do" class="filter-nav m-l-xs">任务 <span class="badge">100</span></a></li>
						<li><a href="messages.do" class="filter-nav m-l-xs">消息 <span class="badge badge-primary">50</span></a></li>
						<li><a href="notifications.do" class="filter-nav m-l-xs">通知 <span class="badge badge-warning">24</span></a></li>
					</ul>
				</div>
				<div class="box-body">
					<div class="col-md-4" style="padding-right:2px;padding-left:2px;">
					  <!-- DIRECT CHAT PRIMARY -->
					  <div class="box box-primary direct-chat direct-chat-primary">
						<div class="box-header with-border">
						  <h3 class="box-title">Pending Tasks</h3>
						  <div class="box-tools pull-right">
							<span class="badge bg-light-blue" title="" data-toggle="tooltip" data-original-title="3 New Messages">3</span>
							<button data-widget="chat-pane-toggle" title="" data-toggle="tooltip" class="btn btn-box-tool" data-original-title="Urgent"><i class="fa fa-bolt"></i></button>
							<button data-widget="chat-pane-toggle" title="" data-toggle="tooltip" class="btn btn-box-tool" data-original-title="Bookmark"><i class="fa fa-star"></i></button>
						  </div>
						</div><!-- /.box-header -->
						<div class="box-body">
						  <!-- Conversations are loaded here -->
						  <div class="direct-chat-messages" style="padding:5px; height:auto;">
							<!-- Message. Default to the left -->
							<div class="direct-chat-msg" style="margin-bottom:0px;">
							  <div class="direct-chat-info clearfix">
								<span class="direct-chat-name pull-left">Alexander Pierce</span>
								<span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
							  </div><!-- /.direct-chat-info -->
							  <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
							  <div class="direct-chat-text" style="font-size:12px;">
								机锋是中国最大的Android安卓平台，也是国内唯一 一家定位在手机机友玩家、手机发烧友的服务平台。作为安卓手机玩家基地，机锋坚持为中国对手机最热爱、最发烧的机友们提供最专业、最人性化、最全面的手机玩机服务。
							  </div><!-- /.direct-chat-text -->
							  <hr style="margin-bottom: 5px; margin-top: 5px;">
							</div><!-- /.direct-chat-msg -->

							<!-- Message to the right -->
							<div class="direct-chat-msg" style="padding-bottom:5px;margin-bottom:0px;">
							  <div class="direct-chat-info clearfix">
								<span class="direct-chat-name pull-right">Sarah Bullock</span>
								<span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
							  </div><!-- /.direct-chat-info -->
							  <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
							  <div class="direct-chat-text" style="min-height:35px;">
								You better believe it!
							  </div><!-- /.direct-chat-text -->
							  <hr style="margin-bottom: 5px; margin-top: 5px;">
							</div><!-- /.direct-chat-msg -->
						  </div><!--/.direct-chat-messages-->
						</div><!-- /.box-body -->
					  </div><!--/.direct-chat -->
					</div>
					<div class="col-md-4" style="padding-right:2px;padding-left:2px;">
					  <!-- DIRECT CHAT SUCCESS -->
					  <div class="box box-success direct-chat direct-chat-success">
						<div class="box-header with-border">
						  <h3 class="box-title">In Process</h3>
						  <div class="box-tools pull-right">
							<span class="badge bg-green" title="" data-toggle="tooltip" data-original-title="3 New Messages">3</span>
							<button data-widget="collapse" class="btn btn-box-tool"><i class="fa fa-minus"></i></button>
							<button data-widget="chat-pane-toggle" title="" data-toggle="tooltip" class="btn btn-box-tool" data-original-title="Contacts"><i class="fa fa-comments"></i></button>
							<button data-widget="remove" class="btn btn-box-tool"><i class="fa fa-times"></i></button>
						  </div>
						</div><!-- /.box-header -->
						<div class="box-body" >
						  <!-- Conversations are loaded here -->
						  <div class="direct-chat-messages" style="padding:5px; height:auto;">
							<!-- Message. Default to the left -->
							<div class="direct-chat-msg">
							  <div class="direct-chat-info clearfix">
								<span class="direct-chat-name pull-left">Alexander Pierce</span>
								<span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
							  </div><!-- /.direct-chat-info -->
							  <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
							  <div class="direct-chat-text">
								Is this template really for free? That's unbelievable!
							  </div><!-- /.direct-chat-text -->
							  <hr style="margin-bottom: 5px; margin-top: 5px;">
							</div><!-- /.direct-chat-msg -->

							<!-- Message to the right -->
							<div class="direct-chat-msg">
							  <div class="direct-chat-info clearfix">
								<span class="direct-chat-name pull-right">Sarah Bullock</span>
								<span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
							  </div><!-- /.direct-chat-info -->
							  <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
							  <div class="direct-chat-text" style="min-height:35px;">
								You better believe it!
							  </div><!-- /.direct-chat-text -->
							  <hr style="margin-bottom: 5px; margin-top: 5px;">
							</div><!-- /.direct-chat-msg -->
						  </div><!--/.direct-chat-messages-->

						</div><!-- /.box-body -->
					  </div><!--/.direct-chat -->
					</div>
					<div class="col-md-4" style="padding-right:2px;padding-left:2px;">
					  <!-- DIRECT CHAT WARNING -->
					  <div class="box box-warning direct-chat direct-chat-warning">
						<div class="box-header with-border">
						  <h3 class="box-title">Complete</h3>
						  <div class="box-tools pull-right">
							<span class="badge bg-yellow" title="3 New Messages" data-toggle="tooltip">3</span>
							<button data-widget="collapse" class="btn btn-box-tool"><i class="fa fa-minus"></i></button>
							<button data-widget="chat-pane-toggle" title="Contacts" data-toggle="tooltip" class="btn btn-box-tool"><i class="fa fa-comments"></i></button>
							<button data-widget="remove" class="btn btn-box-tool"><i class="fa fa-times"></i></button>
						  </div>
						</div><!-- /.box-header -->
						<div class="box-body">
						  <!-- Conversations are loaded here -->
						  <div class="direct-chat-messages" style="padding:5px; height:auto;">
							<!-- Message. Default to the left -->
							<div class="direct-chat-msg">
							  <div class="direct-chat-info clearfix">
								<span class="direct-chat-name pull-left">Alexander Pierce</span>
								<span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
							  </div><!-- /.direct-chat-info -->
							  <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
							  <div class="direct-chat-text">
								Is this template really for free? That's unbelievable!
							  </div><!-- /.direct-chat-text -->
							  <hr style="margin-bottom: 5px; margin-top: 5px;">
							</div><!-- /.direct-chat-msg -->

							<!-- Message to the right -->
							<div class="direct-chat-msg right">
							  <div class="direct-chat-info clearfix">
								<span class="direct-chat-name pull-right">Sarah Bullock</span>
								<span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
							  </div><!-- /.direct-chat-info -->
							  <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
							  <div class="direct-chat-text">
								You better believe it!
							  </div><!-- /.direct-chat-text -->
							  <hr style="margin-bottom: 5px; margin-top: 5px;">
							</div><!-- /.direct-chat-msg -->
						  </div><!--/.direct-chat-messages-->

						</div><!-- /.box-body -->
					  </div><!--/.direct-chat -->
					</div>
				</div><!-- /.box-body -->
			  </div><!-- /.box -->
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
							<span><i class="fa fa-file-o margin-r-5"></i>
                            Support Team
							</span>
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                        </a>
						<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
                      </li><!-- end message -->
                      <li>
                        <a href="#">

                         <span><i class="fa fa-file-o margin-r-5"></i>
                            AdminLTE Design Team
						</span>
                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                        </a>
						<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                        <a href="#">
                          <span><i class="fa fa-file-o margin-r-5"></i>
                            Developers
							</span>
                            <small><i class="fa fa-clock-o"></i> Today</small>                          
                        </a>
						<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                        <a href="#">
                          <span><i class="fa fa-file-o margin-r-5"></i>
                            Sales Department
							</span>
                            <small><i class="fa fa-clock-o "></i> Yesterday</small>
                        
                          
                        </a>
						<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                        <a href="#">
                            
                           <span><i class="fa fa-file-o margin-r-5"></i>
						
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
	<!-- jstree -->
	<script src="${path_plugins}/jstree/dist/jstree.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${path_script}/app.ctx.js" type="text/javascript"></script>
	<!-- GPress Err Message -->
	<script src="${path_script}/message.js" type="text/javascript"></script>

	<script src="${path_script}/pages/personspace4.js"></script>
    <!-- AdminLTE for demo purposes -->
	<script src="${path_script}/pages/workspace/meta.js" type="text/javascript"></script>
  </body>
</html>
