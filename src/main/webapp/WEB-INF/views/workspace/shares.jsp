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
						  分享资源
						  <small>查看相关分享资源</small>
						</h1>
						<jsp:include page="../common/page-navs.jsp" flush="true">
							<jsp:param name="page" value="shares"/>
							<jsp:param name="module" value="workspace"/>
						</jsp:include>
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
						<li><a href="tasks.do" class="filter-nav m-l-xs">发布资源 <span class="badge">100</span></a></li>
						<li class="active"><a href="messages.do" class="filter-nav m-l-xs">已分享 <span class="badge badge-primary">50</span></a></li>
						<li><a href="notifications.do" class="filter-nav m-l-xs">接收分享 <span class="badge badge-warning">24</span></a></li>
					</ul>
				</div>
				<div class="box-body repo-list">
					<ul class="list-group list-group-unbordered">
						<li class="list-group-item clearfix">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-repo-folder">
                                </div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
									<li class="action" data-toggle="tooltip" title="version information">
										<a  href="#">
										  <i class="fa fa-signal"></i>
										</a>
									  </li>
									<li class="action" data-toggle="tooltip" title="detail information">
									<a  href="#">
									  <i class="fa fa-info"></i>
									</a>
								  </li>
									<li class="action" data-toggle="tooltip" title="comments information">
									<a  href="#">
									  <i class="fa fa-commenting"></i>
									</a>
								  </li>
								  <li class="action" data-toggle="tooltip" title="Share file">
									<a  href="#">
									  <i class="fa fa-share-alt"></i>
									</a>
								  </li>
								  <li class="action" data-toggle="tooltip" title="favorite file">
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
	<!-- mustache -->
	<script src="${path_plugins}/mustache/mustache.min.js" type="text/javascript"></script>
	<!-- jstree -->
	<script src="${path_plugins}/jstree/dist/jstree.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${path_script}/app.ctx.js" type="text/javascript"></script>
	<!-- GPress Err Message -->
	<script src="${path_script}/message.js" type="text/javascript"></script>

	<script src="${path_script}/pages/personspace3.js"></script>
    <!-- AdminLTE for demo purposes -->
	<script src="${path_script}/pages/workspace/meta.js" type="text/javascript"></script>
  </body>
</html>
