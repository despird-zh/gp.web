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
        <div class="container  bg-white">
          <section class="content-header clearfix">
			<div class="row ">
				<div class="col-sm-12">		
					<h1 style="font-size: 18px; margin-top: 10px; margin-bottom: 0px; margin-left: 10px;">
					  工作组设置
					  <small>查看下属的工作组信息</small>
					</h1>
					<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
						<li class=""><a aria-expanded="false" href="workgroup-grid.do"><i class="fa fa-fw fa-cubes"></i></a></li>
						<li class=""><a aria-expanded="true" href="netdisk.do"><i class="fa fa-fw fa-database"></i></a></li>    
						<li class=""><a aria-expanded="true" href="shares.do"><i class="fa fa-fw fa-share-alt"></i></a></li>					
						<li class=""><a aria-expanded="false" href="topics.do"><i class="fa fa-fw fa-commenting"></i></a></li>
					</ul>
					<hr style="margin-top: 9px;" class="m-t-none m-b-xs">
				</div>
			 </div>
          </section>
          <!-- Main content -->
          <section class="content">
		  <div class="row">
			<div class="col-md-9">
				<div class="box box-widget list-view no-radius">
					<div class="box-header repo-header with-border border-top">
						<a gpid="filter-switch-btn" class="pull-left btn btn-default btn-header-circle" role="button" ><i class="fa fa-angle-double-down"></i> </a>
						<div class="folder-descr">					
							<span class="text">Design a nice theme Make the theme responsive 1Make the theme responsive 2Make the theme responsive</span>
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
					<div id="gallery" class="gallery row">
						<div class="col-md-2 image gallery-group-1">
							<div class="image-inner">
								<a href="gallery/gallery-1.jpg" >
									<img src="${path_image}/gallery/gallery-1.jpg" alt="" />
								</a>
								<p class="image-caption">
									测试信息
								</p>
							</div>
							<div class="image-info">
								<div class="">
									<small>admin by</small> <a href="javascript:;">Sean Ngu</a>
								</div>
								<div class="desc">
									有时候 UI 上会出现一些仅供视觉识别的元素，比如说“汉堡包菜单按钮”，只有视力正常的人才能清楚辨识这些元素的作用。而残障人士，比如弱势或盲人是不可能知道这些
								</div>
							</div>
						</div>
						<div class="col-md-2 image gallery-group-1">
							<div class="image-inner">
								<a href="gallery/gallery-2.jpg" data-lightbox="gallery-group-1">
									<img src="${path_image}/gallery/gallery-2.jpg" alt="" />
								</a>
								<p class="image-caption">
									Fusce aliquet ac quam at tincidunt
								</p>
							</div>
							<div class="image-info">
								<div class="">
									<small>by</small> <a href="javascript:;">Camryn Wong</a>
								</div>
								<div class="desc">
									Fusce eu rutrum nisi, ut pretium mi. Sed mollis nisi sed auctor molestie. Vestibulum dictum pharetra leo sed euismod.
								</div>
							</div>
						</div>
						<div class="col-md-2 image gallery-group-1">
							<div class="image-inner">
								<a href="gallery/gallery-3.jpg" data-lightbox="gallery-group-1">
									<img src="${path_image}/gallery/gallery-3.jpg" alt="" />
								</a>
								<p class="image-caption">
									Etiam lobortis egestas nisl
								</p>
							</div>
							<div class="image-info">
								<div class="">
									<small>by</small> <a href="javascript:;">Lelouch Wong</a>
								</div>
								<div class="desc">
									Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vivamus eget ultricies arcu.
								</div>
							</div>
						</div>
						<div class="col-md-2 image gallery-group-2">
							<div class="image-inner">
								<a href="gallery/gallery-4.jpg" data-lightbox="gallery-group-2">
									<img src="${path_image}/gallery/gallery-4.jpg" alt="" />
								</a>
								<p class="image-caption">
									Donec mi quis volutpat ornare
								</p>
							</div>
							<div class="image-info">

								<div class="">
									<small>by</small> <a href="javascript:;">Richard Leong</a>
								</div>

								<div class="desc">
									Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut et augue luctus libero dignissim sodales, sapien consequat lacinia fringilla.
								</div>
							</div>
						</div>
						<div class="col-md-2 image gallery-group-2">
							<div class="image-inner">
								<a href="gallery/gallery-5.jpg" data-lightbox="gallery-group-2">
									<img src="${path_image}/gallery/gallery-5.jpg" alt="" />
								</a>
								<p class="image-caption">
									Donec pretium volutpat ornare
								</p>
							</div>
							<div class="image-info">
								
								<div class="">
									<small>by</small> <a href="javascript:;">Derrick Wong</a>
								</div>
								<div class="desc">
									Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut et augue luctus libero, feugiat sapien consequat lacinia fringilla.
								</div>
							</div>
						</div>
						<div class="col-md-2 image gallery-group-3">
							<div class="image-inner">
								<a href="gallery/gallery-6.jpg" data-lightbox="gallery-group-3">
									<img src="${path_image}/gallery/gallery-6.jpg" alt="" />
								</a>
								<p class="image-caption">
									Mi quis volutpat ornare sodales
								</p>
							</div>
							<div class="image-info">
								
								<div class="">
									<small>by</small> <a href="javascript:;">Apple Tong</a>
								</div>
								<div class="desc">
									Ut et augue luctus libero dignissim sodales. Fusce feugiat sapien consequat lacinia fringilla. Vivamus eget ultricies arcu.
								</div>
							</div>
						</div>
						<div class="col-md-2 image gallery-group-3">
							<div class="image-inner">
								<a href="gallery/gallery-7.jpg" data-lightbox="gallery-group-3">
									<img src="${path_image}/gallery/gallery-7.jpg" alt="" />
								</a>
								<p class="image-caption">
									Vestibulum ante ipsum primis
								</p>
							</div>
							<div class="image-info">
								
								<div class="">
									<small>by</small> <a href="javascript:;">Thomas Wong</a>
								</div>

								<div class="desc">
									Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut et augue luctus libero dignissim sodales, sapien consequat lacinia fringilla.
								</div>
							</div>
						</div>
						<div class="col-md-2 image gallery-group-4">
							<div class="image-inner">
								<a href="gallery/gallery-8.jpg" data-lightbox="gallery-group-4">
									<img src="${path_image}/gallery/gallery-8.jpg" alt="" />
								</a>
								<p class="image-caption">
								  Nunc eget hendrerit nisi sodales
								</p>
							</div>
							<div class="image-info">

								<div class="">
									<small>by</small> <a href="javascript:;">Andy Wong</a>
								</div>

								<div class="desc">
									Ut et augue nisi sodales luctus libero dignissim sodales. Fusce feugiat nisi sodales sapien consequat lacinia fringilla.
								</div>
							</div>
						</div>
						<div class="col-md-2 image gallery-group-4">
							<div class="image-inner">
								<a href="gallery/gallery-9.jpg" data-lightbox="gallery-group-4">
									<img src="${path_image}/gallery/gallery-9.jpg" alt="" />
								</a>
								<p class="image-caption">
									Nunc eget hendrerit nisi dignissim
								</p>
							</div>
							<div class="image-info">
								<div class="">
									<small>by</small> <a href="javascript:;">William Tan</a>
								</div>
								<div class="desc">
									Ut et augue luctus libero dignissim sodales. Fusce feugiat sapien consequat libero dignissim lacinia fringilla.
								</div>
							</div>
						</div>
						<div class="col-md-2 image gallery-group-4">
							<div class="image-inner">
								<a href="gallery/gallery-10.jpg" data-lightbox="gallery-group-4">
									<img src="${path_image}/gallery/gallery-10.jpg" alt="" />
								</a>
								<p class="image-caption">
									Sed mollis nisi sed auctor
								</p>
							</div>
							<div class="image-info">
								<div class="">
									<small>by</small> <a href="javascript:;">David King</a>
								</div>
								<div class="desc">
									Vestibulum dictum pharetra leo sed euismod. Lorem ipsum dolor sit amet, consectetur adipiscing feugiat sapien elit.
								</div>
							</div>
						</div>
					</div>
				</div><!-- end box -->
			</div>
			<div class="col-md-3">
              <div class="box box-widget no-radius">
				<div class="box-header with-border border-top">
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
              <div class="box box-widget m-t-xs">
                <div class="box-header with-border border-top">
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
    <script src="${path_script}/app.ctx.js"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/ga/err-message.js"></script>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroup/profile.js"></script>
  </body>
</html>
