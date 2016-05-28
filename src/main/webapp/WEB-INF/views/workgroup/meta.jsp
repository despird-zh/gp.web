<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>

<!-- Profile Image -->
<div class="box box-widget no-radius border-top">
    <div class="box-header with-border">
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
        <div class="clearfix">
            <div class="pull-left lite-info">
              <img class="profile-user-img img-responsive img-circle" src="${path_image}/user4-128x128.jpg" alt="User profile picture">
              <h4 class="profile-username text-center" >${hasMore}</h4>
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

        <hr style="margin-bottom: 5px; margin-top: 5px;">

        <strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
    </div><!-- /.box-body -->
</div><!-- /.box -->