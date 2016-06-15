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
					  工作区间
					  <small>查看下属的工作组信息</small>
					</h1>
					<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
						<li class=""><a data-toggle="tooltip" title="查看个人相关的工作空间" class="text-muted" href="../workspace/workgroup-grid.do"><i class="fa fa-lg fa-home"></i></a></li>
						<li ><span class="v-separator"></span></li>			
						<li class="pull-right"><a data-toggle="tooltip" title="图片化显示" href="../workgroup/all-grid.do" class="text-muted"><i class="fa fa-th"></i></a></li>
						<li class="pull-right"><a data-toggle="tooltip" title="清单列表化显示" href="../workgroup/all-list.do" class="text-muted"><i class="fa fa-th-list"></i></a></li>
						<li class="pull-right"><a data-toggle="tooltip" title="树形展现方式" href="../workgroup/all-hier.do" class="bg-aqua-active"><i class="fa fa-sitemap"></i></a></li>
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
						<div class="folder-descr">					
							<span class="text">Design a nice theme Make the theme responsive 1Make the theme responsive 2Make the theme responsive</span>
						</div>
					</div><!-- /.box-header-->
					<div class="row">					
					<div class="col-md-7">
						<div gpid="workspace-hier-tree" class="p-xs m-r-n-xs" >
						</div>
					</div> 
					<div class="col-md-5">
						<div class="m-r-sm">
						  <div class="col-md-12">
							<label class="m-b-none  p-t-xxs  m-r-sm"> Node Information </label><a role="button" gpid="wgroup-group-new-btn"><i class="fa fa-plus"></i> </a>
							<hr class="m-t-xs m-b-sm">
						  </div>
							<form class="form-horizontal">
							  <div style="min-height:280px;" class="box-body no-padding">
								<div class="form-group">
								  <label for="wgroup-group-name" class="col-sm-3 control-label">Group</label>
								  <div class="col-sm-8">
									<input type="text" class="hidden" value="63" id="wgroup-group-id">
									<input type="text" class="form-control" id="wgroup-group-name" value="测试科技" placeholder="Group Name">
								  </div>
								</div>
								<div class="form-group">
								  <label for="wgroup-group-descr" class="col-sm-3 control-label">Descr</label>
								  <div class="col-sm-8">
									<textarea placeholder="Enter ..." id="wgroup-group-descr" rows="3" class="form-control"></textarea>
								  </div>
								</div>
							  </div><!-- /.box-body -->
							  <div class="box-footer">
								<a class="btn btn-default" gpid="wgroup-group-cancel-btn"><i class="fa fa-hdd-o"></i> Netdisk</a>
								<a class="btn btn-default" gpid="wgroup-group-member-add-btn"><i class="fa fa-flag-o"></i> Topic</a>
								<a class="btn btn-default" gpid="wgroup-group-member-add-btn"><i class="fa fa-envelope-o"></i> Topic</a>
							  </div><!-- /.box-footer -->
							</form>
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

    <!-- jQuery 2.1.4 -->
    <script src="${path_plugins}/jQuery/jquery.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${path_bootstrap}/js/bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${path_plugins}/fastclick/fastclick.min.js"></script>
	<!-- JStree -->
	<script src="${path_plugins}/jstree/dist/jstree.min.js"></script>

    <!-- AdminLTE App -->
    <script src="${path_script}/app.ctx.js"></script>
    <!-- GPress Err Message -->
	<script src="${path_script}/ga/err-message.js"></script>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroup/all-hier.js"></script>
  </body>
</html>
