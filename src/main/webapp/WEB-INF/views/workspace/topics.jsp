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
						  讨论信息
						  <small>查看个人相关讨论</small>
						</h1>
						<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
							<li><a data-toggle="tooltip" title="查看全部工作组空间" href="../workgroup/all-grid.do"><i class="fa fa-lg fa-home"></i></a></li>
							<li><span class="v-separator"></span></li>	
							<li><a class="bg-aqua-active" data-toggle="tooltip" title="查看全部个人话题" href="topics.do?user_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-map-signs"></i></a></li>    
							<li><a data-toggle="tooltip" title="查看个人网盘" href="netdisk.do?user_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-suitcase"></i></a></li>
							<li><a data-toggle="tooltip" title="查看个人分享" href="shares.do?user_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-link"></i></a></li>	
							<li><a data-toggle="tooltip" title="查看个人任务内容" href="tasks.do?user_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-flag"></i></a></li>	
							
							<li><a data-toggle="tooltip" title="查看个人设置" href="profile.do?user_id=${wgroup_id}" aria-expanded="false"><i class="fa fa-fw fa-info-circle"></i></a></li>
						</ul>
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
						<li><a href="tasks.do" class="filter-nav m-l-xs">全部 <span class="badge">100</span></a></li>
						<li class="active"><a href="messages.do" class="filter-nav m-l-xs">草稿 <span class="badge badge-primary">50</span></a></li>
						<li><a href="notifications.do" class="filter-nav m-l-xs">电气小组 <span class="badge badge-warning">24</span></a></li>
						<li><a href="notifications.do" class="filter-nav m-l-xs">设计小组 <span class="badge badge-warning">24</span></a></li>
					</ul>
				</div>
				<div class="box-body repo-list">
				<ul class="list-group list-group-unbordered">
				   <li class="list-group-item">
				   <div  class="ticket">
						<div class="pull-left avatar-info">
							<a >
								<img class="img-circle img-bordered-sm" src="${path_image}/user1-128x128.jpg" alt="user image">
							</a>
							<div class="thumbs-info" >
								<div><a style="cursor:pointer;"><i class="fa fa-thumbs-o-up"></i></a></div>
								<div><span  class="label label-success text-center">1235</span></div>
								<div class="bottom-thumb"><a style="cursor:pointer;"><i class="fa fa-thumbs-o-down"></i></a></div>			
							</div>
						</div>
						<!-- Post -->
						<div class="post" >
							<div class="user-block">                        
								<span class="username">
								  <a href="#" class="margin-r-5">杜新民</a>				  
								  <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
								</span>
								<span  class="label label-warning text-center margin-r-5">电气工作组</span>
								<span  class="label label-warning text-center margin-r-5">企业发布</span>
								<span class="description">7:30 PM today</span>
							</div><!-- /.user-block -->
							<div class="clearfix">
							<div class="inline-docs pull-right" >
								<!--<ul class="doc-list">
								  <li>
									 inner menu: contains the actual data -->
									<ul class="doc-items show-scrollbar">
									  <li><!-- start message -->
										<a href="#">
										  <span><i class="fa fa-file-o margin-r-5"></i>
											关于UI设计文件.docx						
										  </span>                          
										</a>
										<small class="pull-right"><i class="fa fa-clock-o"></i> Today</small>
									  </li><!-- end message -->
									  <li>
										<a class="ellipsis ellipsis-180"href="#">
										  <span><i class="fa fa-file-o margin-r-5"></i>
											总体设计文件.mov                          
										  </span>                         
										</a>
										 <small class="pull-right"><i class="fa fa-clock-o"></i> 2 hours</small>
									  </li>
									  <li>
										<a href="#">
										  <span><i class="fa fa-file-o margin-r-5"></i>
											开发人员安排.xls
										  </span>                          
										</a>
										<small class="pull-right"><i class="fa fa-clock-o"></i> Today</small>
									  </li>
									  <li>
										<a href="#">
										  <span><i class="fa fa-file-o margin-r-5"></i>
											任务更细文件.doc                            
										  </span>                          
										</a>
										<small class="pull-right"><i class="fa fa-clock-o "></i> Yesterday</small>
									  </li>
									  <li>
										<a href="#">                            
										  <span>
											<i class="fa fa-clock-o margin-r-5"></i>
											工作制度及奖惩规定.doc                            
										  </span>                          
										</a>
										<small class="pull-right"><i class="fa fa-clock-o"></i> 2 days</small>
									  </li>
									</ul>
								  <!--/li>
								</ul-->
							</div>
							评论区有人问为什么这么说……是这样的，iOS中回到主屏后App就被冻结，除音乐播放之类的进程之外不允许常驻后台，那么怎么在手机关屏后推送消息呢？是开发者在服务器上把消息先推送给苹果的服务器，然后苹果把该用户的微信、QQ、Facebook、淘宝等各种消息统一推送给用户，这样就做到了不影响消息推送的情况下、同时减少后台个数，熄屏几乎不耗。
							
							</div>
							<ul class="list-inline">
								<li><a href="#" class="link-black text-sm"><i class="fa fa-plug margin-r-5"></i> Join</a></li>
								<li><a href="#" class="link-black text-sm"><i class="fa fa-star-o margin-r-5"></i> Like</a></li>
								<li><a href="#" class="link-black text-sm"><i class="fa fa-paper-plane-o margin-r-5"></i> Public</a></li>				
								<li><a href="#" class="link-black text-sm" data-toggle="tooltip" title="Send out post and comments as pdf"><i class="fa fa-envelope-o margin-r-5"></i> Send</a></li>
								<li class="pull-right"><a obid="users_show_btn" href="javascript:;" class="link-black text-sm"><i class="fa fa-users margin-r-5"></i> Users (13)</a></li>
								<li class="pull-right"><a obid="comments_show_btn" href="javascript:;" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments (5)</a></li>
							</ul>
							<div obid="users_list_container" style="display:none;">
							<div obid="users_list" style="" class="row clearfix user-list">
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
								<div class="col-md-1 user-avatar">
									<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
									<a class="ellipsis ellipsis-50">userassss</a>
									<a class="remove-user"><i class="fa fa-times"></i></a>
								</div>
							</div>
							</div>
							<div obid="comment_list_container" style="display:none">
							<div obid="comment_list" class="direct-chat-messages" style="margin-top:5px;margin-bottom:0px;">
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
								</div><!-- /.direct-chat-msg -->
								<div class="direct-chat-msg">
								  <div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-left">Alexander Pierce</span>
									<span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
								  </div><!-- /.direct-chat-info -->
								  <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
								  <div class="direct-chat-text">
									Is this template really for free? That's unbelievable!
								  </div><!-- /.direct-chat-text -->
								</div><!-- /.direct-chat-msg -->
								<div class="direct-chat-msg">
								  <div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-left">Alexander Pierce</span>
									<span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
								  </div><!-- /.direct-chat-info -->
								  <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
								  <div class="direct-chat-text">
									Is this template really for free? That's unbelievable!
								  </div><!-- /.direct-chat-text -->
								</div><!-- /.direct-chat-msg -->
								<div class="direct-chat-msg right">
								  <div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-right">Sarah Bullock</span>
									<span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
								  </div><!-- /.direct-chat-info -->
								  <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
								  <div class="direct-chat-text">
									You better believe it!
								  </div><!-- /.direct-chat-text -->
								</div><!-- /.direct-chat-msg -->
								<div class="direct-chat-msg right">
								  <div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-right">Sarah Bullock</span>
									<span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
								  </div><!-- /.direct-chat-info -->
								  <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
								  <div class="direct-chat-text">
									You better believe it!
								  </div><!-- /.direct-chat-text -->
								</div><!-- /.direct-chat-msg -->
								<div class="direct-chat-msg right">
								  <div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-right">Sarah Bullock</span>
									<span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
								  </div><!-- /.direct-chat-info -->
								  <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
								  <div class="direct-chat-text">
									You better believe it!
								  </div><!-- /.direct-chat-text -->
								</div><!-- /.direct-chat-msg -->
								<div class="direct-chat-msg">
								  <div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-left">Alexander Pierce</span>
									<span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
								  </div><!-- /.direct-chat-info -->
								  <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
								  <div class="direct-chat-text">
									Is this template really for free? That's unbelievable!
								  </div><!-- /.direct-chat-text -->
								</div><!-- /.direct-chat-msg -->
								<div class="direct-chat-msg">
								  <div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-left">Alexander Pierce</span>
									<span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
								  </div><!-- /.direct-chat-info -->
								  <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
								  <div class="direct-chat-text">
									Is this template really for free? That's unbelievable!
								  </div><!-- /.direct-chat-text -->
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
								</div><!-- /.direct-chat-msg -->
								
							</div>
								<input class="form-control input-sm" type="text" placeholder="Type a comment" style="margin-top:5px;">
							</div>
						</div><!-- /.post -->
					</div>
				   </li>
				   <li class="list-group-item">
				   <div  class="ticket">
						<div class="pull-left avatar-info">
							<a >
								<img class="img-circle img-bordered-sm" src="${path_image}/user1-128x128.jpg" alt="user image">
							</a>
							<div class="thumbs-info" >
								<div><a style="cursor:pointer;"><i class="fa fa-thumbs-o-up"></i></a></div>
								<div><span  class="label label-success text-center">1235</span></div>
								<div class="bottom-thumb"><a style="cursor:pointer;"><i class="fa fa-thumbs-o-down"></i></a></div>			
							</div>
						</div>
						<!-- Post -->
						<div class="post" >
							<div class="user-block">                        
								<span class="username">
								  <a href="#">Jonathan Burke Jr.</a>
								  <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
								</span>
								<span class="description">Shared publicly - 7:30 PM today</span>
							</div><!-- /.user-block -->
							<div class="clearfix">
							<img class="inline-img pull-left" src="${path_image}/user1-128x128.jpg"></img>
							默认ticket仅在工作组内可见，public后全局可见，一旦可见用户都可以添加评论。仅成员用户收到消息提醒。<br>
							因此Join的功能可以不要
							</div>
							<ul class="list-inline">
								<li><a href="#" class="link-black text-sm"><i class="fa fa-plug margin-r-5"></i> Join</a></li>
								<li><a href="#" class="link-black text-sm"><i class="fa fa-star-o margin-r-5"></i> Like</a></li>
								<li><a href="#" class="link-black text-sm"><i class="fa fa-paper-plane-o margin-r-5"></i> Public</a></li>
								<li><a obid="users_show_btn" href="javascript:;" class="link-black text-sm"><i class="fa fa-users margin-r-5"></i> Users</a></li>
								<li><a href="#" class="link-black text-sm" data-toggle="tooltip" title="Send out post and comments as pdf"><i class="fa fa-envelope-o margin-r-5"></i> Send</a></li>
								<li class="pull-right"><a obid="comments_show_btn" href="javascript:;" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments (5)</a></li>
							</ul>
							<div class="direct-chat-messages">
								<!-- Message. Default to the left -->
								<div class="direct-chat-msg">
								  <div class="direct-chat-info clearfix">
									<span class="direct-chat-name margin-r-5">Alexander Pierce</span>
									<span class="label label-warning text-center margin-r-5">correct</span>
									<a href="#" class="link-black text-sm margin-r-5"><i class="fa fa-check "></i>Correct</a>
									<a href="#" class="link-black text-sm margin-r-5"><i class="fa fa-hand-rock-o"></i>Ignore</a>
									<span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
								  </div><!-- /.direct-chat-info -->
								  <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
								  <div class="direct-chat-text bg-yellow">
									Is this template really for free? That's unbelievable!
								  </div><!-- /.direct-chat-text -->
								</div><!-- /.direct-chat-msg -->

								<!-- Message to the right -->
								<div class="direct-chat-msg right">
								  <div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-right">Sarah Bullock</span>
									<span class="label label-warning text-center margin-r-5 pull-right">correct</span>
									<a href="#" class="link-black text-sm margin-r-5 pull-right"><i class="fa fa-check "></i>Correct</a>
									<a href="#" class="link-black text-sm margin-r-5 pull-right"><i class="fa fa-hand-rock-o"></i>Ignore</a>
									<span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
								  </div><!-- /.direct-chat-info -->
								  <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
								  <div class="direct-chat-text">
									You better believe it!
								  </div><!-- /.direct-chat-text -->
								</div><!-- /.direct-chat-msg -->
							</div>
							<input class="form-control input-sm" type="text" placeholder="Type a comment">
						</div><!-- /.post -->
					</div>
				   </li>
				</ul>
				</div><!-- /.box-body -->
			  </div><!-- /.box -->
			</div>
			<div class="col-md-3">
              <div class="box box-widget no-radius border-top">
				<div class="box-header with-border">
					<div class="view-toolbar clearfix" style="margin-bottom: 0px;"> <!-- toolbar -->
						<span class="pull-left" title="Create New File" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#new-ticket-modal">
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
              <div obid="user_about_info" class="box box-widget" style="display:none;">
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
                          <span><i class="fa fa-file-o margin-r-5"></i>
                            关于UI设计文件.docx						
                          </span> 
							<small ><i class="fa fa-clock-o"></i> Today</small>						  
                        </a>
						<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
                      </li><!-- end message -->
                      <li>
                        <a href="#">
                          <span><i class="fa fa-file-o margin-r-5"></i>
                            关于UI设计文件.docx						
                          </span> 
							<small ><i class="fa fa-clock-o"></i> Today</small>						  
                        </a>
						<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                        <a href="#">
                          <span><i class="fa fa-file-o margin-r-5"></i>
                            关于UI设计文件.docx						
                          </span> 
							<small ><i class="fa fa-clock-o"></i> Today</small>						  
                        </a>
						<a  obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                        <a href="#">
                          <span><i class="fa fa-file-o margin-r-5"></i>
                            关于UI设计文件.docx						
                          </span> 
							<small ><i class="fa fa-clock-o"></i> Today</small>						  
                        </a>						
						<a obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
                      </li>
                      <li>
                        <a href="#">
                          <span><i class="fa fa-file-o margin-r-5"></i>
                            关于UI设计文件.docx						
                          </span> 
							<small ><i class="fa fa-clock-o"></i> Today</small>						  
                        </a>
						<a obid="remove_btn" class="pull-right"><i class="fa fa-times"></i></a>
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
<!-- Modal -->
  <!-- remove [tabindex="-1"] otherwise select2 not work-->
  <div class="modal fade" id="new-ticket-modal"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Create new Ticket</h4>
        </div>
        <div class="modal-body">
			<div class=" box-form form-horizontal">
				<div class="form-group">
				  <label class="col-sm-2 control-label" for="doc-name">Subject</label>
				  <div class="col-sm-10">
					<input type="text" placeholder="subject" id="doc-name" class="form-control">
				  </div>
				</div>
				<div class="form-group">
				  <label class="col-sm-2 control-label" for="doc-owner">Content</label>
				  <div class="col-sm-10">
					<textarea style="resize:none;" placeholder="context" id="doc-owner" class="form-control" rows="3"></textarea>
				  </div>
				</div>	
				<div class="form-group">
					<label class="col-sm-2 control-label" >Attendee</label>
					<div class="col-sm-10">
					<select class="form-control select2" multiple="multiple" data-placeholder="Select a State" style="width:100%">
					  <option>Alabama</option>
					  <option>Alaska</option>
					  <option>California</option>
					  <option>Delaware</option>
					  <option>Tennessee</option>
					  <option>Texas</option>
					  <option>Washington</option>
					</select>
					</div>
                </div><!-- /.form-group -->
				<div class="form-group">
                        <label class="col-sm-2 control-label">                         
                          scope
                        </label>
						<div class="col-sm-10">
						<select class="form-control select2" style="width: 40%;">
                      <option selected="selected">Alabama</option>
                      <option>Alaska</option>
                      <option>California</option>
                      <option>Delaware</option>
                      <option>Tennessee</option>
                      <option>Texas</option>
                      <option>Washington</option>
                    </select>
					  </div>
                </div>
				<div class="form-group">
                    <label class="col-sm-2 control-label">                         
                      comment
                    </label>
					<div class="col-sm-10">
						<div class="checkbox" >                  
                     
						<label>
                          <input type="checkbox">
                          member only
                        </label>
						 </div>
					</div>
                </div>
			</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-sm btn-primary">Save changes</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
    <!-- jQuery 2.1.4 -->
    <script src="${path_plugins}/jQuery/jquery.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${path_bootstrap}/js/bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script>
	    <!-- Select2 -->
    <script src="${path_plugins}/select2/select2.full.min.js"></script>
    <!-- FastClick -->
    <script src="${path_plugins}/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.min.js"></script>
	<script src="${path_plugins}/jstree/dist/jstree.min.js"></script>
	<script src="${path_script}/pages/personspace2.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${path_script}/demo.js"></script>
  </body>
</html>
