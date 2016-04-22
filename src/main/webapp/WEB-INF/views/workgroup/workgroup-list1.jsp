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
	<link rel="stylesheet" href="${path_plugins}/isotope/isotope.css" rel="stylesheet" />
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
              工作区间
              <small>查看下属的工作组信息</small>
            </h1>
				<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 10px; top: 15px;">
					<li class="active"><a  href="workgroup.do" aria-expanded="false"><i class="fa fa-fw fa-cubes"></i></a></li>
					<li class=""><a  href="netdisk.do" aria-expanded="true"><i class="fa fa-fw fa-database"></i></a></li>    
					<li class=""><a  href="shares.do" aria-expanded="true"><i class="fa fa-fw fa-share-alt"></i></a></li>					
					<li class=""><a  href="topics.do" aria-expanded="false"><i class="fa fa-fw fa-commenting"></i></a></li>
					<li class="pull-right"><a class="text-muted" href="../workgroup/workgroup-list.do"><i class="fa fa-th-list"></i></a></li>
					<li class="pull-right"><a class="text-muted" href="../workgroup/workgroup-grid.do"><i class="fa fa-th"></i></a></li>
                </ul>
          </section>

          <!-- Main content -->
          <section class="content">
			<div class="row">
				<div class="col-lg-12">
				<div id="options" class="gallery-filter-container  no-radius ">
                <span class="gallery-option-set" id="filter" data-option-key="filter">
                    <a href="#show-all" class="btn btn-flat btn-xs bg-yellow active margin-r-5" data-option-value="*">
                        Show All
                    </a>
                    <a href="#gallery-group-1" class="btn btn-default btn-flat btn-xs margin-r-5" data-option-value=".gallery-group-1">
                        Gallery Group 1
                    </a>
                    <a href="#gallery-group-2" class="btn btn-default btn-xs btn-flat margin-r-5" data-option-value=".gallery-group-2">
                        Gallery Group 2
                    </a>
                    <a href="#gallery-group-3" class="btn btn-default btn-xs btn-flat margin-r-5" data-option-value=".gallery-group-3">
                        Gallery Group 3
                    </a>
                    <a href="#gallery-group-4" class="btn btn-default btn-xs btn-flat margin-r-5" data-option-value=".gallery-group-4">
                        Gallery Group 4
                    </a>
                </span>
				</div>
				</div>
			</div>
		  <div class="row">
			<div class="col-md-9">

			<div class="box box-widget list-view no-radius">
				<div class="box-header repo-header" style="">
					<div class="folder-descr">
						<span class="text">Design a nice theme Make the theme responsive 1Make the theme responsive 2Make the theme responsive</span>
					</div>
				</div><!-- /.box-header-->
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
										  <i class="fa fa-edit"></i>
										</a>
									  </li>
									<li class="action" data-toggle="tooltip" title="detail information">
									<a  href="#">
									  <i class="fa fa-info"></i>
									</a>
								  </li>
									
								</ul>
								<div class="item-name-container">
								  <a class="item-link " href="#">
									sub2 folder
								  </a>
								  <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
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
								  <li title="12 People (13) external " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span>
										<i class="fa fa-user "></i>
									  </span>
									  25
									</span>
								  </li>
								  <li title="25 done, 10 pending,3 in-prcess " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span>
										<i class="fa fa-flag text-yellow"></i>
									  </span>
									  35
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
			</div><!-- end box -->
			</div>
			<div class="col-md-3">
              <div class="box box-widget no-radius">
				<div class="box-header with-border" style="padding-bottom: 9px; padding-top: 9px;">
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
				  <h3 class="box-title">Base Information</h3>
				  <div class="box-tools">                    
                    <button data-widget="collapse" class="btn btn-box-tool" type="button"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" type="button"><i class="fa fa-edit"></i></button>
					<button class="btn btn-box-tool" type="button"><i class="fa fa-save"></i></button>
                  </div>
				</div><!-- /.box-header -->
				<div class="box-body">
					<div class=" box-form form-horizontal">
							<div class="form-group">
							  <label class="col-sm-3 control-label" for="doc-name">Name</label>
							  <div class="col-sm-9">
								<input type="text" placeholder="Email" id="doc-name" class="form-control">
							  </div>
							</div>
							<div class="form-group">
							  <label class="col-sm-3 control-label" for="doc-owner">Owner</label>
							  <div class="col-sm-9">
								<input type="text" placeholder="Password" id="doc-owner" class="form-control">
							  </div>
							</div>
							<div class="form-group">
							  <label class="col-sm-3 control-label" for="doc-subject">Subject</label>
							  <div class="col-sm-9">
								<input type="text" placeholder="Password" id="doc-subject" class="form-control">
							  </div>
							</div>
							<div class="form-group">
							  <label class="col-sm-3 control-label" for="doc-subject">Create</label>
							  <div class="col-sm-9">
								<input type="text" placeholder="Password" id="doc-create" class="form-control">
							  </div>
							</div>
							<div class="form-group">
							  <label class="col-sm-3 control-label" for="doc-subject">Modify</label>
							  <div class="col-sm-9">
								<input type="text" placeholder="Password" id="doc-modify" class="form-control">
							  </div>
							</div>
							<div class="form-group">
							  <label class="col-sm-3 control-label" for="doc-locked">Locked</label>
							  <div class="col-sm-9">
								<input type="text" placeholder="Password" id="doc-locked" class="form-control">
							  </div>
							</div>
						</div>
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
    <!-- AdminLTE App -->
    <script src="${path_script}/app.min.js"></script>
	<script src="${path_script}/pages/workspaces2.js"></script>
    <!-- AdminLTE for demo purposes 
    <script src="${path_script}/demo.js"></script>-->
  </body>
</html>
