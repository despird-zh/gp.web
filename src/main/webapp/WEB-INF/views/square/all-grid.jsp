<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
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
					<h1 class="page-title">
					  全部工作组
					  <small>查看全部的工作组信息</small>
					</h1>
					<jsp:include page="../common/page-navs.jsp" flush="true">
						<jsp:param name="page" value="all-grid"/>
						<jsp:param name="module" value="square"/>
					</jsp:include>
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
						<ul class="list-inline pull-right m-b-none">
						    <li><a gpid="grid-view-btn" role="button"><i class="fa fa-th"></i></a></li>
						    <li><a gpid="list-view-btn" role="button"><i class="fa fa-th-list"></i></a></li>
						</ul>
					</div><!-- /.box-header-->
					<div gpid="wgroup-filter" class="border-bottom p-xs hidden">		
						<div>		
							<form class="form-inline">
								<label class="m-r-sm">Workgroup</label><input type="text" class="form-control input-md" placeholder="storage name" gpid="list-search-wgroup-name">
								<a class="btn btn-default btn-sm" gpid="list-search-btn"><i class="fa fa-search"></i></a>
								<a class="btn btn-default btn-sm" gpid="list-clear-btn"><i class="fa fa-close"></i></a>
							</form>												
						</div>
					</div>
					<div id="gallery-container" ><!-- container for gallery -->
	
					</div>
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
	<script src="${path_script}/pages/square/all-grid.js"></script>
  </body>
</html>
