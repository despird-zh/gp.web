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
					  Topics
					  <small> Topics issued in workgroup</small>
					</h1>
					<jsp:include page="../common/page-navs.jsp" flush="true">
						<jsp:param name="page" value="all-post"/>
						<jsp:param name="module" value="square"/>
					</jsp:include>
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
              <div class="box box-widget no-radius">
				<div class="box-header with-border border-top">
					<div class="view-toolbar clearfix" style="margin-bottom: 0px;"> <!-- toolbar -->
						<span class="pull-left" title="Create New Workgroup" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-warning btn-xs " data-toggle="modal" data-target="#new-file-modal">
							<i class="fa fa-fw fa-file-o"></i>
							</button>
						</span>
						<span class="pull-left" title="Create new ticket" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#new-file-modal">
							<i class="fa fa-fw fa-fire"></i>
							</button>
						</span>
					</div><!-- toolbar -->
				</div>
                <div class="box-body box-profile">
					<div class="board-num">
						<p class="num m-b-xs" data-docnum="143,450,822">
							<span style="background-position: 0px -116px;" class="num0" data-num="4"></span>
							<span style="background-position: 0px -145px;" class="num0" data-num="5"></span>
							<span style="background-position: 0px 0px;" class="num0" data-num="0"></span>
							<b class="spr">,</b>
							<span style="background-position: 0px -232px;" class="num0" data-num="8"></span>
							<span style="background-position: 0px -58px;" class="num0" data-num="2"></span>
							<span style="background-position: 0px -58px;" class="num0" data-num="2"></span>
						</p>
					</div>
					<hr class="m-t-sm m-b-xs">
					<ul style="padding: 0" class="tag-list">
						<li><a href="#">Close 30 </a></li>
						<li><a href="#">R/W 40</a></li>
						<li><a href="#">Readonly 20</a></li>
					</ul>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              <div class="box box-widget m-t-xs">
                <div class="box-header with-border border-top">
                  <h3 class="box-title">Hot Tags</h3>
                </div><!-- /.box-header -->
				<div class="box-body p-xxs">
					<p style="margin-bottom:0px;" class="tags xsmall">
						<a class="tag-red " href="" title="">Fashion</a>
						<a class="tag-yellow " href="" title="">测试</a>
						<a class="tag-blue " href="" title="">学习</a>
						<a class="tag-green  " href="" title="">Java</a>
						<a class="tag-default tag-point-red" href="" title="">工具</a>
						<a class="tag-default tag-point-yellow " href="" title="">专业</a>
						<a class="tag-default tag-point-green" href="" title="">电气</a>
						<a class="tag-default tag-point-blue" href="" title="">评分</a>
						<a class="tag-default  " href="" title="">投票</a>
						<a class="tag-red  " href="" title="">更新</a>
					</p>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              <!-- Hot groups Box -->
              <div class="box box-widget m-t-xs">
                <div class="box-header with-border border-top">
                  <h3 class="box-title">Hot Workgroups</h3>
                </div><!-- /.box-header -->
				<div class="box-body p-xxs">
                  <ul class="list-group clear-list m-l-xs m-t-none m-b-none m-r-xs">
					<li class="list-group-item first-item">
						<span class="label label-success">1</span> 商务问题讨论组
						<span class="pull-right m-t-xs" style="font-size: 12px;color:#444;">
							<span class="">
							  <span><i class="fa fa-database"></i></span>
							  13
							</span>
							<span class="">
							  <span><i class="fa fa-user "></i></span>
							  25
							</span>
							<span class="">
							  <span><i class="fa fa-flag "></i></span>
							  25
							</span>
						</span>
						
					</li>
					<li class="list-group-item">
						<span class="pull-right">
							10:16 am
						</span>
						<span class="label label-info">2</span> Sign a contract
					</li>
					<li class="list-group-item">
						<span class="pull-right">
							08:22 pm
						</span>
						<span class="label label-primary">3</span> Open new shop
					</li>
					<li class="list-group-item">
						<span class="pull-right">
							11:06 pm
						</span>
						<span class="label label-default">4</span> Call back to Sylvia
					</li>
					<li class="list-group-item">
						<span class="pull-right">
							12:00 am
						</span>
						<span class="label label-primary">5</span> Write a letter to Sandra
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
	<script src="${path_plugins}/waypoints/jquery.waypoints.min.js"></script>
	<script src="${path_plugins}/waypoints/shortcuts/infinite.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/message.js"></script>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/square/all-topic.js"></script>
  </body>
</html>
