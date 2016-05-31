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
					  Netdisk (Public Repository)
					  <small>Browse and manage the workgroup documents</small>
					</h1>
					<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
						<li><a data-toggle="tooltip" title="查看个人相关的工作空间" href="../workspace/workgroup-grid.do"><i class="fa fa-lg fa-home"></i></a></li>
						<li><span class="v-separator"></span></li>	
						<li><a data-toggle="tooltip" title="查看工作组发布文档" href="publish.do?wgroup_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-database"></i></a></li>    
						<li><a data-toggle="tooltip" title="查看工作组网盘内容" href="netdisk.do?wgroup_id=${wgroup_id}" aria-expanded="true" class="bg-aqua-active"><i class="fa fa-fw fa-suitcase"></i></a></li>
						<li><a data-toggle="tooltip" title="查看工作组分享" href="share.do?wgroup_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-link"></i></a></li>	
						<li><a data-toggle="tooltip" title="查看工作组任务内容" href="tasks.do?wgroup_id=${wgroup_id}" aria-expanded="true"><i class="fa fa-fw fa-flag"></i></a></li>							
						<li><a data-toggle="tooltip" title="查看工作组话题" href="topics.do?wgroup_id=${wgroup_id}" aria-expanded="false"><i class="fa fa-fw fa-commenting"></i></a></li>
						<li><a data-toggle="tooltip" title="查看工作组信息" href="profile.do?wgroup_id=${wgroup_id}" aria-expanded="false" ><i class="fa fa-fw fa-info-circle"></i></a></li>
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
				<div class="box-header repo-header with-border" style="border-top: 1px solid #f4f4f4;">
					<a gpid="back-parent-btn" class="pull-left btn btn-default btn-header-circle" role="button" ><i class="fa fa-level-up"></i> </a>
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
				<div class="box-body repo-list">
					<ul class="list-group list-group-unbordered">
						<li class="list-group-item">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-repo-folder">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
									<li class="action" data-toggle="tooltip" title="Edit tags">
										<a href="#"><i class="fa fa-tags"></i></a>
									</li>
									<li class="action" data-toggle="tooltip" title="Add to clipboard">
										<a  href="#"><i class="fa fa-clipboard"></i></a>
									</li>
									<li class="action" data-toggle="tooltip" title="comments information">
										<a  href="#" gpid="show-comments-btn" ><i class="fa fa-commenting"></i></a>
									</li>
									<li class="action" data-toggle="tooltip" title="Share file">
										<a  href="#"><i class="fa fa-share-alt"></i></a>
									</li>
									<li class="action" data-toggle="tooltip" title="favorite file">
										<a  href="#"><i class="fa fa-star"></i></a>
									</li>
									<li class="action">
										<a  href="#"><i class="fa fa-square-o" ></i></a>
									</li>
								</ul>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									sub2 folder
								  </a>     

								  <span class="badge long-badge ellipsis" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
									Owned externally
								  </span>
								</div>
								<ul class="inline-list">
                                    <li class="">
                                        Updated yesterday by 
                                        <a class="hoverlight profile_link">
                                        evilsucker
                                        </a>
                                    </li>
                                    <li class="item-stat" data-toggle="tooltip" title="" data-original-title="13 Files, 8.4 MB">
										
										<span style="" class="label label-default v-center"><i class="fa fa-file"></i></span>
										
										<div class="countinfo-wrapper">
											<div class="countinfo">
												<span>
												<span class="">13</span>
												</span>
											</div>
											<div class="countinfonub"><s></s><i></i></div>
										</div>
                                    </li>
                                    <li class="item-stat" data-toggle="tooltip" title="" data-original-title="3 People favorite this ">
										<span style="" class="label label-default"><i class="fa fa-star"></i></span>
										<div class="countinfo-wrapper">
											<div class="countinfo">
												<span>
												<span class="">2</span>
												</span>
											</div>
											<div class="countinfonub"><s></s><i></i></div>
										</div>
                                    </li>
                                    <li class="item-stat" data-toggle="tooltip" title="" data-original-title="Current version is 1.3">
										<span style="" class="popup-marker label label-default"><i class="fa fa-paperclip"></i></span>
										<div class="countinfo-wrapper">
											<div class="countinfo">
												<span>
												<span class="">1.3</span>
												</span>
											</div>
											<div class="countinfonub"><s></s><i></i></div>
										</div>
                                    </li>
                                    <li class="item-stat" data-toggle="tooltip" title="" data-original-title="Version List">
                                        <span class="popup-marker label label-default " id="versionlist"><i class="fa fa-signal"></i></span>
                                        <div class="content hide">
                                            <div class="panel-body popover-content">
                                            <ul class="list-group">
                                                <li class="list-group-item ">
                                                    <div class="version-item">
                                                        <span class="label label-default ">V1.0</span> <span>Gary - </span> <span style="font-style:italic;">this is demo description</span>
                                                    </div>
                                                </li>        
                                                <li class="list-group-item">
                                                        <div class="version-item">
                                                        <span class="label label-default ">V1.1</span> <span>Gary - </span> <span style="font-style:italic;">this is demo description</span>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                        <div class="version-item">
                                                        <span class="label label-default ">V2.0</span> <span>Gary - </span> <span style="font-style:italic;">this is demo description</span>
                                                    </div>
                                                </li>
                                            </ul>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="item-stat" data-toggle="tooltip" title="" data-original-title="Detail Information">
                                        <span class="popup-marker label label-default" id="informationlist"><i class="fa fa-info-circle"></i></span>
                                        <div class="content hide">
                                            <div class="panel-body popover-content">
                                                <table class="table table-condensed">
                                                    <thead>
                                                        <tr>
                                                            <th>First Name</th>
                                                            <th>Last Name</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Carter</td>
                                                            <td>johncarter@mail.com</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Parker</td>
                                                            <td>peterparker@mail.com</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Rambo</td>
                                                            <td>johnrambo@mail.com</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
								<ul class="inline-list">
								  <li class="">
									<div class="description-text-container">
									  <span class="" >
										this is for demo usage
									  </span>
									</div>
								  </li>
								</ul>
								<div>
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
                                </div>
                                <div gpid="comment-list-container" class="hidden">
                                    <div obid="comment_list" class="direct-chat-messages" style="margin-top:5px;margin-bottom:0px;">
                                        <!-- Message. Default to the left -->
                                        <div class="direct-chat-msg">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name pull-left margin-r-5">Alexander Pierce</span>
												<span class="label label-warning text-center margin-r-5">correct</span>
												<a href="#" class="link-black text-sm margin-r-5"><i class="fa fa-check "></i>Correct</a>
												<a href="#" class="link-black text-sm margin-r-5"><i class="fa fa-hand-rock-o"></i>Ignore</a>
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
									<div class="input-group input-group-sm">
										<input type="text" class="form-control">
										<span class="input-group-btn">
										  <button class="btn btn-info btn-flat" type="button"><i class="fa fa-paper-plane-o"></i></button>
										</span>
									</div>
								</div>
							  </div>
							</div>
						</li>
						<li class="list-group-item clearfix">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-repo-folder">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
									<li class="action">
									<a  href="#">
									  <i class="fa fa-share-alt"></i>
									</a>
								  </li>
								  <li class="action">
									<a  href="#"><i class="fa fa-star"></i>
									</a>
								  </li>
								  <li class="action">
									<a  href="#"><i class="fa fa-square-o" ></i>
									</a>
								  </li>
								
								</ul>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									sub2 folder
								  </a>      

								  <span class="badge long-badge ellipsis" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
									Owned externally
								  </span>
								</div>
								<ul class="inline-list" >
								  <li class="">
									Updated yesterday by 
									<a class="hoverlight profile_link">
									  evilsucker
									</a>
								  </li>
								  <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span>
										<i class="fa fa-file"></i>
									  </span>
									  13
									</span>
								  </li>
								  <li title="3 People favorite this " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span>
										<i class="fa fa-user"></i>
									  </span>
									  2
									</span>
								  </li>
								</ul>
								<ul class="inline-list">
								  <li class="">
									<div class="description-text-container">
									  <span class="" >
										this is for demo usage
									  </span>
									</div>
								  </li>
								</ul>
							  </div>
							</div>
						</li>
						<li class="list-group-item clearfix">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-repo-folder">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
								  <li class="action">
									<a  href="#">
									  <i class="fa fa-share-alt"></i>
									</a>
								  </li>
								  <li class="action">
									<a  href="#"><i class="fa fa-star"></i>
									</a>
								  </li>
								  <li class="action">
									<a  href="#"><i class="fa fa-square-o" ></i>
									</a>
								  </li>
								</ul>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									sub2 folder
								  </a>      

								  <span class="badge long-badge ellipsis ellipsis_180" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
									Owned externally
								  </span>
								</div>
								<ul class="inline-list" >
								  <li class="">
									Updated yesterday by 
									<a class="hoverlight profile_link">
									  evilsucker
									</a>
								  </li>
								  <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span>
										<i class="fa fa-file"></i>
									  </span>
									  13
									</span>
								  </li>
								  <li title="3 People favorite this " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span>
										<i class="fa fa-user"></i>
									  </span>
									  2
									</span>
								  </li>
								</ul>
								<ul class="inline-list">
								  <li class="">
									<div class="description-text-container">
									  <span class="" >
										this is for demo usage
									  </span>
									</div>
								  </li>
								</ul>
							  </div>
							</div>

						</li>
						<li class="list-group-item clearfix">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-repo-file">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
								  <li class="action">
									<a  href="#">
									  <i class="fa fa-share-alt"></i>
									</a>
								  </li>
								  <li class="action">
									<a  href="#"><i class="fa fa-star"></i>
									</a>
								  </li>
								  <li class="action">
									<a  href="#"><i class="fa fa-square-o" ></i>
									</a>
								  </li>
								</ul>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									sub2 file
								  </a>      

								  <span class="badge long-badge ellipsis ellipsis_200" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
									Owned externally
								  </span>
								</div>
								<ul class="inline-list" >
								  <li class="">
									Updated yesterday by 
									<a class="hoverlight profile_link">
									  evilsucker
									</a>
								  </li>
								  <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span>
										<i class="fa fa-file"></i>
									  </span>
									  13
									</span>
								  </li>
								  <li title="3 People favorite this " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span>
										<i class="fa fa-user"></i>
									  </span>
									  2
									</span>
								  </li>
								</ul>
								<ul class="inline-list">
								  <li class="">
									<div class="description-text-container">
									  <span class="" >
										this is for demo usage
									  </span>
									</div>
								  </li>
								</ul>
							  </div>
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
						<span class="pull-left" title="Create New Doc" data-toggle="tooltip" data-placement="top">
							<button gpid="new-file-btn" class="btn btn-warning btn-xs " >
							<i class="fa fa-fw fa-file-o"></i>
							</button>
						</span>
						<span class="pull-left" title="Create new folder" data-toggle="tooltip" data-placement="top">
							<button gpid="new-folder-btn" class="btn btn-default btn-xs" >
							<i class="fa fa-fw fa-folder-o"></i>
							</button>
						</span>
						<span class="pull-left" title="Show clipboard content" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-default btn-xs" >
							<i class="fa fa-fw fa-clipboard"></i>
							</button>
						</span>
						<span class="pull-left" title="Test" data-toggle="tooltip" data-placement="top">
							<button gpid="test-btn" class="btn btn-default btn-xs" >
							<i class="fa fa-fw fa-gear"></i>
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
                </div><!-- /.box-body -->
              </div><!-- /.box -->	
			  <div class="box box-widget border-top">
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

				<ul class="doc-list">
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
			<div class="hidden">
				<input id="cabinet-id" type="hidden" value="${cabinet_id}" />
				<input id="workgroup-id" type="hidden" value="${wgroup_id}" />
			</div>
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
	<!-- mustache -->
    <script src="${path_plugins}/mustache/mustache.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/message.js"></script>
	<%@include file="../dialog/new-file.jsp" %>
	<%@include file="../dialog/new-folder.jsp" %>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroup/netdisk.js"></script>
  </body>
</html>
