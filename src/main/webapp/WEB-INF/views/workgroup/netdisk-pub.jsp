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
						<li class="" data-toggle="tooltip" title="workgroup"><a  href="workgroup-grid.do" aria-expanded="false"><i class="fa fa-fw fa-cubes"></i></a></li>
						<li class="active" data-toggle="tooltip" title="netdisk"><a  href="netdisk-pub.do" aria-expanded="true"><i class="fa fa-fw fa-database"></i></a></li>    
						<li class="" data-toggle="tooltip" title="Share"><a  href="shares.do" aria-expanded="true"><i class="fa fa-fw fa-share-alt"></i></a></li>					
						<li class="" data-toggle="tooltip" title="Topics"><a  href="topics.do" aria-expanded="false"><i class="fa fa-fw fa-commenting"></i></a></li>
						<li ><span class="v-separator"></span></li>	
						<li class="pull-right active" data-toggle="tooltip" title="Public disk"><a class="text-primary" href="../workgroup/netdisk-pub.do"><i class="fa fa-sun-o"></i></a></li>
						<li class="pull-right" data-toggle="tooltip" title="private disk"><a class="text-muted" href="../workgroup/netdisk-pri.do"><i class="fa fa-moon-o"></i></a></li>
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
						
					</ul>
				</div><!-- /.box-body -->
			  </div><!-- /.box -->
			</div>
			<div class="col-md-3">
              <div class="box box-widget no-radius border-top">
				<div class="box-header with-border">
					<div class="view-toolbar clearfix" style="margin-bottom: 0px;"> <!-- toolbar -->
						<span class="pull-left" title="Create New Doc" data-toggle="tooltip" data-placement="top">
							<button gpid="new-file-btn" class="btn btn-warning btn-xs ">
								<i class="fa fa-file-o"></i>
							</button>
						</span>
						<span class="pull-left" title="Create new ticket" data-toggle="tooltip" data-placement="top">
							<button gpid="new-folder-btn" class="btn btn-default btn-xs ">
							<i class="fa fa-fire"></i>
							</button>
						</span>
						<span class="pull-left" title="Show clipboard content" data-toggle="tooltip" data-placement="top">
							<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#new-file-modal">
							<i class="fa fa-clipboard"></i>
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
						<span style="" class="label label-default"><i class="fa fa-file"></i></span>
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
						<span style="" class="label label-default"><i class="fa fa-star"></i></span>
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
						<span style="" class="popup-marker label label-default" gpid="versionlist"><i class="fa fa-signal"></i></span>
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
						<span class="popup-marker label label-default" gpid="informationlist"><i class="fa fa-info-circle"></i></span>
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
	<script src="${path_script}/ga/err-message.js"></script>
	<%@include file="../dialog/new-file.jsp" %>
	<%@include file="../dialog/new-folder.jsp" %>
	<!-- GPress Page scripts -->
	<script src="${path_script}/pages/workgroup/netdisk-pub.js"></script>
  </body>
</html>
