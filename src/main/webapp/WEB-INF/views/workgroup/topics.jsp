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
					  Topics
					  <small> Topics issued in workgroup</small>
					</h1>
					<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
						<li class=""><a  href="workgroup-grid.do" aria-expanded="false"><i class="fa fa-fw fa-cubes"></i></a></li>
						<li class=""><a  href="netdisk-pub.do" aria-expanded="true"><i class="fa fa-fw fa-database"></i></a></li>    
						<li class=""><a  href="shares.do" aria-expanded="true"><i class="fa fa-fw fa-share-alt"></i></a></li>					
						<li class="active"><a  href="topics.do" aria-expanded="false"><i class="fa fa-fw fa-commenting"></i></a></li>
						<li ><span class="v-separator"></span></li>	
						<li class="pull-right"><a class="text-muted" href="../workgroup/workgroup-list.do"><i class="fa fa-th-list"></i></a></li>
						<li class="pull-right"><a class="text-muted" href="../workgroup/workgroup-grid.do"><i class="fa fa-th"></i></a></li>
					</ul>
					<hr style="margin-top: 9px;" class="m-t-none m-b-xs">
				</div>
			 </div>
          </section>

          <!-- Main content -->
          <section class="content">
		<div class="row">
			<div class="col-md-9">
				<div class="box box-widget ">
				<div class="box-header repo-header with-border" style="border-top: 1px solid #f4f4f4;">
					<a gpid="filter-switch-btn" class="pull-left btn btn-default btn-header-circle" role="button" ><i class="fa fa-angle-double-down"></i> </a>
					<div class="folder-descr">					
						<span class="text">电力设计协作组</span>
					</div>
				</div><!-- /.box-header-->
				<div gpid="wgroup-filter" class="border-bottom p-xs hidden">
					<div>		
						<form class="form-inline">
							<label class="m-r-sm">Workgroup</label><input type="text" class="form-control input-md" placeholder="storage name" gpid="list-search-sname">
							<a class="btn btn-default btn-sm" gpid="list-search-btn"><i class="fa fa-search"></i></a>
							<a class="btn btn-default btn-sm" gpid="list-clear-btn"><i class="fa fa-close"></i></a>
						</form>												
					</div>
				</div>
				<ul class="list-group list-group-unbordered">
				   <li class="list-group-item" style="border-top: none;">
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
				</div><!-- end box -->
			</div>
			<div class="col-md-3">
				<!-- Profile Image -->
              <div class="box box-widget no-radius border-top">
				<div class="box-header with-border">
					<div class="view-toolbar clearfix" style="margin-bottom: 0px;"> <!-- toolbar -->
						<span class="pull-left" title="Create New Workgroup" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-warning btn-xs " data-toggle="modal" data-target="#new-file-modal">
							<i class="fa fa-file-o"></i>
							</button>
						</span>
						<span class="pull-left" title="Create new ticket" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#new-file-modal">
							<i class="fa fa-fire"></i>
							</button>
						</span>
					</div><!-- toolbar -->
				</div>
                <div class="box-body box-profile">
					<div class="clearfix">
						<div class="pull-left lite-info">
						  <img class="profile-user-img img-responsive img-circle" src="${path_image}/user4-128x128.jpg" alt="User profile picture">
						  <h4 class="profile-username text-center" >沙特项目群</h4>
						  <div >
							<p class="text-muted text-center" >admin by <a>Gary </a></p>
						  </div>
						</div>							
						<ul class="stats-info list-group list-group-unbordered pull-right" >
							<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
							  <b>成员</b> <a class="pull-right">1,322</a>
							</li>
							<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
							  <b>工作组</b> <a class="pull-right">543</a>
							</li>
							<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
							  <b>文件</b> <a class="pull-right">13,287</a>
							</li>
							<li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
							  <b>讨论</b> <a class="pull-right">13,287</a>
							</li>
						 </ul>
					</div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

              <!-- About Me Box -->
              <div class="box box-widget border-top">
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
    <script src="${path_plugins}/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${path_bootstrap}/js/bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${path_plugins}/fastclick/fastclick.min.js"></script>
	 <script src="${path_plugins}/waypoints/jquery.waypoints.min.js"></script>
	 <script src="${path_plugins}/waypoints/shortcuts/infinite.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/ga/err-message.js"></script>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroup/all-topics.js"></script>
  </body>
</html>
