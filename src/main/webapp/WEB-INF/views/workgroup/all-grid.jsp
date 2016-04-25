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
					  全部工作组
					  <small>查看全部的工作组信息</small>
					</h1>
					<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
						<li class=""><a data-toggle="tooltip" title="查看个人相关的工作空间" class="text-muted" href="../workspace/workgroup-grid.do"><i class="fa fa-lg fa-home"></i></a></li>
						<li ><span class="v-separator"></span></li>						
						<li class="pull-right"><a href="../workgroup/all-grid.do" class="bg-aqua-active"><i class="fa fa-th"></i></a></li>						
						<li class="pull-right"><a href="../workgroup/all-list.do" class="text-muted"><i class="fa fa-th-list"></i></a></li>
						<li class="pull-right"><a href="../workgroup/all-hier.do" class="text-muted"><i class="fa fa-sitemap"></i></a></li>
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
						<a gpid="filter-switch-btn" data-toggle="tooltip" title="展开检索条件设置" class="pull-left btn btn-default btn-header-circle" role="button" ><i class="fa fa-angle-double-down"></i> </a>
						<div class="folder-descr">					
							<span class="text">Below is the available workgroups</span>
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
					<div id="gallery" class="infinite-container gallery row">
						<div class="col-md-2 image infinite-item">
							<div class="image-inner">
								<a href="../workgroup/workgroup-grid.do" >
									<img src="${path_image}/gallery/gallery-1.jpg" alt="" />
								</a>
								<p class="image-caption">
									测试信息
								</p>
							</div>
							<div class="image-info">
								<div class="m-b-xs">
									<a class="label label-success" href="javascript:;"><i class="fa fa-flag"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-database"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-files-o"></i></a>
								</div>
								<div class="desc">
									有时候 UI 上会出现一些仅供视觉识别的元素，比如说“汉堡包菜单按钮”，只有视力正常的人才能清楚辨识这些元素的作用。而残障人士，比如弱势或盲人是不可能知道这些
								</div>
							</div>
						</div>
						<div class="col-md-2 image infinite-item">
							<div class="image-inner">
								<a href="gallery/gallery-2.jpg" data-lightbox="gallery-group-1">
									<img src="${path_image}/gallery/gallery-2.jpg" alt="" />
								</a>
								<p class="image-caption">
									Fusce aliquet ac quam at
								</p>
							</div>
							<div class="image-info">
								<div class="m-b-xs">
									<a class="label label-success" href="javascript:;"><i class="fa fa-flag"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-database"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-files-o"></i></a>
								</div>
								<div class="desc">
									Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vivamus eget ultricies arcu.
								</div>
							</div>
						</div>
						<div class="col-md-2 image infinite-item">
							<div class="image-inner">
								<a href="gallery/gallery-3.jpg" data-lightbox="gallery-group-1">
									<img src="${path_image}/gallery/gallery-3.jpg" alt="" />
								</a>
								<p class="image-caption">
									Etiam lobortis egestas nisl
								</p>
							</div>
							<div class="image-info">
								<div class="m-b-xs">
									<a class="label label-success" href="javascript:;"><i class="fa fa-flag"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-database"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-files-o"></i></a>
								</div>
								<div class="desc">
									Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vivamus eget ultricies arcu.
								</div>
							</div>
						</div>
						<div class="col-md-2 image infinite-item">
							<div class="image-inner">
								<a href="gallery/gallery-4.jpg" data-lightbox="gallery-group-2">
									<img src="${path_image}/gallery/gallery-4.jpg" alt="" />
								</a>
								<p class="image-caption">
									Donec mi quis volutpat ornare
								</p>
							</div>
							<div class="image-info">
								<div class="m-b-xs">
									<a class="label label-success" href="javascript:;"><i class="fa fa-flag"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-database"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-files-o"></i></a>
								</div>

								<div class="desc">
									Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut et augue luctus libero dignissim sodales, sapien consequat lacinia fringilla.
								</div>
							</div>
						</div>
						<div class="col-md-2 image infinite-item">
							<div class="image-inner">
								<a href="gallery/gallery-5.jpg" data-lightbox="gallery-group-2">
									<img src="${path_image}/gallery/gallery-5.jpg" alt="" />
								</a>
								<p class="image-caption">
									Donec pretium volutpat ornare
								</p>
							</div>
							<div class="image-info">
								<div class="m-b-xs">
									<a class="label label-success" href="javascript:;"><i class="fa fa-flag"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-database"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-files-o"></i></a>
								</div>
								<div class="desc">
									Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut et augue luctus libero, feugiat sapien consequat lacinia fringilla.
								</div>
							</div>
						</div>
						<div class="col-md-2 image infinite-item">
							<div class="image-inner">
								<a href="gallery/gallery-6.jpg" data-lightbox="gallery-group-3">
									<img src="${path_image}/gallery/gallery-6.jpg" alt="" />
								</a>
								<p class="image-caption">
									Mi quis volutpat ornare sodales
								</p>
							</div>
							<div class="image-info">
								<div class="m-b-xs">
									<a class="label label-success" href="javascript:;"><i class="fa fa-flag"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-database"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-files-o"></i></a>
								</div>
								<div class="desc">
									Ut et augue luctus libero dignissim sodales. Fusce feugiat sapien consequat lacinia fringilla. Vivamus eget ultricies arcu.
								</div>
							</div>
						</div>
						<div class="col-md-2 image infinite-item">
							<div class="image-inner">
								<a href="gallery/gallery-7.jpg" data-lightbox="gallery-group-3">
									<img src="${path_image}/gallery/gallery-7.jpg" alt="" />
								</a>
								<p class="image-caption">
									Vestibulum ante ipsum primis
								</p>
							</div>
							<div class="image-info">
								<div class="m-b-xs">
									<a class="label label-success" href="javascript:;"><i class="fa fa-flag"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-database"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-files-o"></i></a>
								</div>
								<div class="desc">
									Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut et augue luctus libero dignissim sodales, sapien consequat lacinia fringilla.
								</div>
							</div>
						</div>
						<div class="col-md-2 image infinite-item">
							<div class="image-inner">
								<a href="gallery/gallery-8.jpg" data-lightbox="gallery-group-4">
									<img src="${path_image}/gallery/gallery-8.jpg" alt="" />
								</a>
								<p class="image-caption">
								  Nunc eget hendrerit nisi sodales
								</p>
							</div>
							<div class="image-info">
								<div class="m-b-xs">
									<a class="label label-success" href="javascript:;"><i class="fa fa-flag"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-database"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-files-o"></i></a>
								</div>
								<div class="desc">
									Ut et augue nisi sodales luctus libero dignissim sodales. Fusce feugiat nisi sodales sapien consequat lacinia fringilla.
								</div>
							</div>
						</div>
						<div class="col-md-2 image infinite-item">
							<div class="image-inner">
								<a href="gallery/gallery-9.jpg" data-lightbox="gallery-group-4">
									<img src="${path_image}/gallery/gallery-9.jpg" alt="" />
								</a>
								<p class="image-caption">
									Nunc eget hendrerit nisi dignissim
								</p>
							</div>
							<div class="image-info">
								<div class="m-b-xs">
									<a class="label label-success" href="javascript:;"><i class="fa fa-flag"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-database"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-files-o"></i></a>
								</div>
								<div class="desc">
									Ut et augue luctus libero dignissim sodales. Fusce feugiat sapien consequat libero dignissim lacinia fringilla.
								</div>
							</div>
						</div>
						<div class="col-md-2 image infinite-item">
							<div class="image-inner">
								<a href="gallery/gallery-10.jpg" data-lightbox="gallery-group-4">
									<img src="${path_image}/gallery/gallery-10.jpg" alt="" />
								</a>
								<p class="image-caption">
									Sed mollis nisi sed auctor
								</p>
							</div>
							<div class="image-info">
								<div class="m-b-xs">
									<a class="label label-success" href="javascript:;"><i class="fa fa-flag"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-database"></i></a>
									<a class="label label-success" href="javascript:;"><i class="fa fa-files-o"></i></a>
								</div>
								<div class="desc">
									Vestibulum dictum pharetra leo sed euismod. Lorem ipsum dolor sit amet, consectetur adipiscing feugiat sapien elit.
								</div>
							</div>
						</div>						
					</div>
					<a class="infinite-more-link" href="all-grid-next.do?pageindex=2">More</a>
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
			   
			</div><!-- /.col-md-3 -->
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
	<script src="${path_script}/pages/workgroup/all-grid.js"></script>
  </body>
</html>