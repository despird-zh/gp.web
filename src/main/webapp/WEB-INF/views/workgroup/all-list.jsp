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
        <div class="container bg-white">
          <section class="content-header clearfix">
			<div class="row ">
				<div class="col-sm-12">	
					<h1 class="text-muted" style="font-size: 18px; margin-top: 10px; margin-bottom: 0px; margin-left: 10px;">
					  工作区间
					  <small>查看下属的工作组信息</small>
					</h1>
					<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
						<li class=""><a data-toggle="tooltip" title="查看个人相关的工作空间" href="../workspace/workgroup-grid.do"><i class="fa fa-lg fa-home"></i></a></li>
						<li ><span class="v-separator"></span></li>
						<li class=""><a data-toggle="tooltip" title="查看全部公共话题" href="../workgroup/all-hier.do"><i class="fa fa-map-signs"></i></a></li>
						<li ><span class="v-separator"></span></li>
						<li class=""><a data-toggle="tooltip" title="按栅格方式查询全部协作组" href="../workgroup/all-grid.do"><i class="fa fa-th"></i></a></li>						
						<li class=""><a data-toggle="tooltip" title="按列表方式查询全部协作组" href="../workgroup/all-list.do" class="bg-aqua-active"><i class="fa fa-th-list"></i></a></li>	
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
				<div class="box-header repo-header with-border" style="border-top: 1px solid #f4f4f4;">
					<a gpid="filter-switch-btn" class="pull-left btn btn-default btn-header-circle" role="button" ><i class="fa fa-angle-double-down"></i> </a>
					<div class="folder-descr">					
						<span class="text">电力设计协作组</span>
					</div>
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
				<div class="box-body repo-list">
					<ul id="list-container" class="infinite-container list-group list-group-unbordered">
					<c:forEach var="wgroup" items="${wgroups}">
						<li class="list-group-item clearfix infinite-item">
							<div class="media">
							  <div class="item-type">
								<div class="img-32x32-repo-item img-repo-folder">
								</div>
							  </div>
							  <div class="repo-item bd">
								<ul class="action-list">
								  <li class="action">
									<a  href="#"><i class="fa fa-share-alt"></i></a>
								  </li>
								  <li class="action">
									<a  href="#"><i class="fa fa-star"></i></a>
								  </li>
								  <li class="action" data-toggle="tooltip" title="detail information">
									<a  href="#"><i class="fa fa-info"></i></a>
								  </li>									
								</ul>

								<ul class="inline-list" >
								  <li>
								<div class="item-name-container">
								  <a class="item-link " href="#">
										${wgroup.workgroupName}
								  </a>
								  <span class="time"><i class="fa fa-clock-o"></i> 2015-5-12 12:13:23</span>								  
								</div>
								  </li>
								  <li class="">
									managed by 
									<a class="hoverlight profile_link">
									 ${wgroup.adminName}
									</a>
								  </li>
								  <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-database"></i></span>
									  13
									</span>
								  </li>
								  <li title="12 People (13) external " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-user "></i></span>
									  25
									</span>
								  </li>
								  <li title="25 done, 10 pending,3 in-prcess " data-toggle="tooltip" class="item-stat">
									<span class="">
									  <span><i class="fa fa-flag text-yellow"></i> </span>
									  35
									</span>
								  </li>
								</ul>
								<ul class="inline-list">
								  <li class="">
									<div class="description-text-container">
									  <span class="" >
										${wgroup.description}
									  </span>
									</div>
								  </li>
								</ul>
							  </div>
							</div>
						</li>	
					</c:forEach>						
					</ul>	
					<c:if test="${hasMore}">
						<a class="infinite-more-link" href="all-list-next.do?pageNumber=${nextPage}&wgroup_name=${wgroup_name}&${tags}">More</a>
					</c:if>						
				</div><!-- /.box-body -->
			</div><!-- end box -->
			</div><!-- /col-md-9 -->
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
			   
			</div><!-- /col-md-3 -->
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
	<script src="${path_script}/message.js"></script>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroup/all-list.js"></script>
  </body>
</html>
