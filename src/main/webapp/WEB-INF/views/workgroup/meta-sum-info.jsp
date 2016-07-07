<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>

<div class="clearfix">
    <div class="pull-left lite-info">
		<input id="meta-wgroup-id" type="hidden" value="${wgroup_id}" />
      <img class="profile-user-img img-responsive img-circle" src="${path_image}/user4-128x128.jpg" alt="User profile picture">
      <h4 class="profile-username text-center" >${hasMore}</h4>
      <div >
        <p class="text-muted text-center" >admin by <a>Gary </a></p>
      </div>
    </div>                          
    <ul class="stats-info list-group list-group-unbordered pull-right" >
        <li class="list-group-item p-xxs">
          <span>成员</span> <a class="pull-right">1,322</a>
        </li>
        <li class="list-group-item p-xxs">
          <span>工作组</span> <a class="pull-right">543</a>
        </li>
        <li class="list-group-item p-xxs">
          <span>文件</span> <a class="pull-right">13,287</a>
        </li>
        <li class="list-group-item p-xxs">
          <span>讨论</span> <a class="pull-right">13,287</a>
        </li>
    </ul>
</div>
<div>
    <div>
        <span class="text-muted">More <i class="fa fa-angle-double-right"></i></span>
    </div>
    <div>
        <hr class="m-b-xs m-t-xs">
        <div>
            <i class="fa fa-book"></i>
            <span class="m-l-xs">描述信息</span>
        </div>
        <p class="text-muted">
            不走寻常路
        </p>
        <hr class="m-b-xs m-t-xs">
        <div>
            <i class="fa fa-map-marker"></i>
            <span class="m-l-xs">隶属组织</span>
        </div>
        <p class="text-muted">信息部/开发组</p>
        <hr class="m-b-xs m-t-xs">
        <div>
            <i class="fa fa-tags"></i>
            <span class="m-l-xs">标签</span>
        </div>
        <p>
            <span class="badge badge-danger">UI Design</span>
            <span class="label label-success">Coding</span>
            <span class="label label-info">Javascript</span>
            <span class="label label-warning">PHP</span>
            <span class="label label-primary">Node.js</span>
        </p>
    </div>
</div>