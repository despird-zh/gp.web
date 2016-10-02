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
						  发布文档
						  <small>查看工作组的全部公开文档</small>
						</h1>
						<jsp:include page="../common/page-navs.jsp" flush="true">
							<jsp:param name="page" value="publish"/>
							<jsp:param name="module" value="workgroup"/>
						</jsp:include>
				</div>
			 </div>
          </section>
          <!-- Main content -->
          <section class="content">
		  <div class="row">
			<div class="col-md-9">
			  <div class="box box-widget">
				<div class="box-header repo-header with-border" style="border-top: 1px solid #f4f4f4;">
					<a gpid="filter-switch-btn" class="pull-left btn btn-default btn-header-circle" role="button" ><i class="fa fa-angle-double-down"></i> </a>
					<div class="m-l-lg">					
						<ol class="breadcrumb p-none m-b-none bg-white">					
						<li class=""><a href="#">Root</a></li>
						<li class="active">
							<a data-placement="top" data-toggle="tooltip" title="" class="ellipsis ellipsis-50" data-original-title="测试目录1">测试目录1</a>
						</li>
						<li class="active">
							<a data-placement="top" data-toggle="tooltip" title="" class="ellipsis ellipsis-50" data-original-title="测试目录2级信息信息">测试目录2级信息信息</a>
						</li>
						<li class="active">Dashboard</li>
					</ol>
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
										<span class="popup-marker label label-default" gpid="versionlist" data-file-id="158"><i class="fa fa-paperclip"></i></span>
										<div class="countinfo-wrapper">
											<div class="countinfo">
												<span>
												<span class="">1.3</span>
												</span>
											</div>
											<div class="countinfonub"><s></s><i></i></div>
										</div>
                                    </li>
                                    <li class="item-stat">
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
						</div><!-- toolbar -->
					</div>
					<div class="box-body box-profile">
						<%@include file="meta-sum-info.jsp" %>
					</div><!-- /.box-body -->
				</div><!-- /.box -->
				<%@include file="../dialog/clipboard.jsp" %>
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
	<script id="cabinet-item-template" type="x-tmpl-mustache">
	{{#rows}}
		<li class="list-group-item">
			<div class="media">
			  <div class="item-type">
				<div class="img-32x32-repo-item img-repo-{{itemType}}">
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
				  {{itemName}}
				  </a>     
				  <span class="badge long-badge ellipsis" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
					Owned externally
				  </span>
				</div>
				<ul class="inline-list">
					<li class="">
						{{timeElapse}}
						<a class="hoverlight profile_link" role="button">
						{{account}}
						</a>
					</li>
					{{#childStat}}
					<li class="item-stat" data-toggle="tooltip" title="" data-original-title="{{childStat.statTooltip}}">
						
						<span style="" class="label label-default v-center"><i class="fa fa-file"></i></span>
						
						<div class="countinfo-wrapper">
							<div class="countinfo">
								<span>
								<span class="">{{childStat.statText}}</span>
								</span>
							</div>
							<div class="countinfonub"><s></s><i></i></div>
						</div>
					</li>
					{{/childStat}}
					{{#favoriteStat}}
					<li class="item-stat" data-toggle="tooltip" title="" data-original-title="{{favoriteStat.statTooltip}}">
						<span style="" class="label label-default v-center"><i class="fa fa-star"></i></span>
						<div class="countinfo-wrapper">
							<div class="countinfo">
								<span>
								<span class="">{{favoriteStat.statText}}</span>
								</span>
							</div>
							<div class="countinfonub"><s></s><i></i></div>
						</div>
					</li>
					{{/favoriteStat}}
					{{#versionStat}}
					<li class="item-stat" data-toggle="tooltip" title="" data-original-title="{{versionStat.statTooltip}}">
						<span style="" class="popup-marker label label-default v-center" gpid="versionlist"><i class="fa fa-signal"></i></span>
						<div class="countinfo-wrapper">
							<div class="countinfo">
								<span>
								<span class="">{{versionStat.statText}}</span>
								</span>
							</div>
							<div class="countinfonub"><s></s><i></i></div>
						</div>
						<div class="content hide">
							<div class="panel-body popover-content">
							<ul class="list-group">
								{{#statData}}
								<li class="list-group-item ">
									<div class="version-item">
										<span class="label label-default ">{{version}}</span> 
										<span>{{author}} - </span> 
										<span style="font-style:italic;">{{description}}</span>
									</div>
								</li>        
								{{/statData}}
							</ul>
							</div>
						</div>						
					</li>										
					{{/versionStat}}
					{{#propStat}}
					<li class="item-stat" data-toggle="tooltip" title="" data-original-title="{{propStat.}}">
						<span class="popup-marker label label-default v-center" gpid="informationlist"><i class="fa fa-info-circle"></i></span>
						<div class="content hide">
							<div class="panel-body popover-content">
								<table class="table table-condensed" style="width: 250px;">
									<thead>
										<tr>
											<th>Property</th>
											<th>Value</th>
										</tr>
									</thead>
									<tbody>
										{{#statData}}
											<tr>
												<td>{{key}}</td>
												<td>{{value}}</td>
											</tr>
										{{/statData}}
									</tbody>
								</table>
							</div>
						</div>
					</li>
					{{/propStat}}
				</ul>
				<ul class="inline-list">
				  <li class="">
					<div class="description-text-container">
					  <span class="" >
					  {{description}}
					  </span>
					</div>
				  </li>
				</ul>
				{{#hasTag}}
				<div>
				   <p class="tags xsmall m-b-none">
						{{#taglist}}
						<a class="tag-default tag-point-{{tagColor}}" role="button" >{{tagName}}</a>
						{{/taglist}}
					</p>                                
				</div>		
				{{/hasTag}}
			  </div>
			</div>
		</li>
	{{/rows}}
	
	{{^rows}}
		<li class="list-group-item">
		</li>
	{{/rows}}
	</script>

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
	<script src="${path_script}/pages/workgroup/publish.js"></script>
  </body>
</html>
