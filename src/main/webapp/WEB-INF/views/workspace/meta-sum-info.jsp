<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<div gpid="meta-sum" class="clearfix">
	<div class="pull-left">
		<img alt="user image" src="../img_cache/73-20160731-194951.jpg" style="
	    border-radius: 4px;cursor: pointer;height: 50px;width: 50px;padding: 5;">
	</div>
	<div style="margin-left:60px;">
		<ul class="list-unstyled">
		  <li><h5 class="m-t-none m-b-xs">Nicole Pearson <label style="vertical-align:middle;font-size:60%;" class="label label-warning margin-r-5">项目经理</label></h5></li>
		  <li class="text-muted" style="font-size:12px;">
		  	 <div style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
		  	 	<strong><i class="fa fa-fw fa-home"></i></strong>康辉中国软件开发责任有限公司天涯
  			</div>
		  </li>
		  <li class="text-muted" style="font-size:12px;">
		  	<div style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
		  		<strong><i class="fa fa-fw fa-plug"></i></strong>2016-1-2 12:23
			</div>
  			</li>
		</ul>
	</div>
	<div>
		<hr class="m-t-xs m-b-xs">
		<ul class="list-inline text-center m-b-none">
		    <li>
		    	<h5 class="m-t-none m-b-xs"><strong> 20,7K </strong></h5>                    
                <p class="m-b-none"><small>Documents</small></p>
		    </li>
		    <li>
		    	<h5 class="m-t-none m-b-xs"><strong> 300 </strong></h5>                    
                <p class="m-b-none"><small>Posts</small></p>
            </li>
		    <li>
		    	<h5 class="m-t-none m-b-xs"><strong> 20 </strong></h5>                    
                <p class="m-b-none"><small>Groups</small></p>
		    </li>
		    <li>
		    	<h5 class="m-t-none m-b-xs"><strong> 123,4 </strong></h5>                    
                <p class="m-b-none"><small>Followers</small></p>
		    </li>
		</ul>
	</div>
	<!--div class="pull-left lite-info p-xxs">
		<input id="meta-wspace-account" type="hidden" value="${account}" />
		<img gpid="wspace-avatar" class="profile-user-img img-responsive" src="${path_image}/user4-128x128.jpg" alt="User profile picture">
		<div >
			<p class="text-muted text-center"><a gpid="wspace-username">Gary </a></p>
			<p class="text-muted text-center">Reg.<span gpid="wspace-since">2015-6-7</span></p>
		</div>
	</div>							
	<ul class="stats-info list-group list-group-unbordered pull-right" >
		<li class="list-group-item p-xxs">
		  <span>任务</span> <a gpid="wspace-task-sum">1,322</a>
		</li>
		<li class="list-group-item p-xxs">
		  <span>共享</span> <a gpid="wspace-share-sum">543</a>
		</li>
		<li class="list-group-item p-xxs">
		  <span>文件</span> <a gpid="wspace-file-sum">13,287</a>
		</li>
		<li class="list-group-item p-xxs">
		  <span>讨论</span> <a gpid="wspace-post-sum">13,287</a>
		</li>
	</ul-->
</div>
<hr class="m-b-xs m-t-xs">
<div gpid="meta-info">
	<ul class="list-inline">
		<li>
			<a role="button" href="javascript:void(0);" gpid="wspace-show-more" class="text-muted">更多 <i class="fa fa-angle-double-up"></i>
			</a>
		</li>
	</ul>
	<div gpid="info-content">
		<hr class="m-b-xs m-t-xs">
		<div>
			<i class="fa fa-book"></i>
			<span class="m-l-xs">签名信息</span>
		</div>
		<p gpid="wspace-signature" class="meta-info">
			不走寻常路
		</p>
		<hr class="m-b-xs m-t-xs">
		<div>
			<i class="fa fa-map-marker"></i>
			<span class="m-l-xs">隶属组织</span>
		</div>
		<div gpid="wspace-org-route">
			
		</div>
		<hr class="m-b-xs m-t-xs">
		<div>
			<i class="fa fa-tags"></i>
			<span class="m-l-xs">个人勋章</span>
		</div>
		<p gpid="wspace-badges" class="meta-info">
		    <span class="badge badge-danger">UI Design</span>
		    <span class="label label-success">Coding</span>
		    <span class="label label-info">Javascript</span>
		    <span class="label label-warning">PHP</span>
		    <span class="label label-primary">Node.js</span>
		</p>
	</div>
</div>
<!-- /.org hier nodes -->
<script id="org-route-tmpl" type="x-tmpl-mustache">
	{{#.}}
		<p class="meta-info">
			{{#.}}
			<a href="javascript:void(0);"> {{name}} {{#children}}<i class="fa fa-angle-right" ></i>{{/children}}</a>
			{{/.}}
		</p>
	{{/.}}
</script>
<!-- /#org hier nodes -->