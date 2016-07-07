<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>

<div gpid="meta-sum" class="clearfix">
    <div class="pull-left lite-info">
		<input id="meta-wgroup-id" type="hidden" value="${wgroup_id}" />
		<img gpid="wgroup-avatar" class="profile-user-img img-responsive img-circle" src="${path_image}/user4-128x128.jpg" alt="group logo">
		<h4 gpid="wgroup-name" class="profile-username text-center">Name</h4>
		<div>
			<p class="text-muted text-center" >admin by <a gpid="wgroup-manager">Gary </a></p>
		</div>
    </div>                          
    <ul class="stats-info list-group list-group-unbordered pull-right" >
        <li class="list-group-item p-xxs">
          <span>成员</span> <a gpid="wgroup-member-sum" class="pull-right">1,322</a>
        </li>
        <li class="list-group-item p-xxs">
          <span>任务</span> <a gpid="wgroup-task-sum" class="pull-right">543</a>
        </li>
        <li class="list-group-item p-xxs">
          <span>文件</span> <a gpid="wgroup-file-sum" class="pull-right">13,287</a>
        </li>
        <li class="list-group-item p-xxs">
          <span>讨论</span> <a gpid="wgroup-post-sum" class="pull-right">13,287</a>
        </li>
    </ul>
</div>
<div gpid="meta-info">
    <div>
        <a class="text-muted" href="javascript:void(0);">More <i class="fa fa-angle-double-right"></i></a>
    </div>
    <div>
        <hr class="m-b-xs m-t-xs">
        <div>
            <i class="fa fa-book"></i>
            <span class="m-l-xs">描述信息</span>
        </div>
        <p gpid="wgroup-descr" class="text-muted">
            不走寻常路
        </p>
        <hr class="m-b-xs m-t-xs">
        <div>
            <i class="fa fa-map-marker"></i>
            <span class="m-l-xs">隶属组织</span>
        </div>
        <p gpid="wgroup-org-route" class="text-muted">信息部/开发组</p>
        <hr class="m-b-xs m-t-xs">
        <div>
            <i class="fa fa-tags"></i>
            <span class="m-l-xs">标签</span>
        </div>
        <p gpid="wgroup-tags">
            <span class="badge badge-danger">UI Design</span>
            <span class="label label-success">Coding</span>
            <span class="label label-info">Javascript</span>
            <span class="label label-warning">PHP</span>
            <span class="label label-primary">Node.js</span>
        </p>
    </div>
</div>