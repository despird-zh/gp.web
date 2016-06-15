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
        <div class="container">

        <section class="content-header">
            <h1>
            网盘信息
            <small>查看网盘内部</small>
            </h1>
            <ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 10px; top: 15px;">
                <li class=""><a  href="topics.do" aria-expanded="false"><i class="fa fa-commenting"></i></a></li>
                <li class="active"><a  href="netdisk.do" aria-expanded="true"><i class="fa fa-database"></i></a></li>
                <li class=""><a  href="shares.do" aria-expanded="false"><i class="fa fa-share-alt"></i></a></li>        
                <li class=""><a  href="tasks.do" aria-expanded="false"><i class="fa fa-flag"></i></a></li>                      
                <li class="pull-right"><a class="text-muted" href="#"><i class="fa fa-th-list"></i></a></li>
                <li class="pull-right"><a class="text-muted" href="#"><i class="fa fa-th"></i></a></li>
            </ul>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-lg-12">        
                <div id="options" class="gallery-filter-container">    
                    <span><a href="#show-all" class="btn btn-default btn-sm bg-yellow active" data-option-value="*">
                    <i class="fa fa-mail-reply"></i>
                    </a>
                    </span>
                    <ol class="repo-breadcrumb breadcrumb">                
                    
                    <li class=""><a href="#"><i class="fa fa-bank"></i></a></li>
                    <li class="active">
                        <a class="ellipsis ellipsis-50" title="测试目录1" data-toggle="tooltip" data-placement="top">测试目录1</a>
                    </li>
                    <li class="active">
                        <a class="ellipsis ellipsis-50" title="测试目录2级信息信息" data-toggle="tooltip" data-placement="top">测试目录2级信息信息</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ol>
                                
                </div>
                </div>
            </div>
        <div class="row">
            <div class="col-md-9">
            <div class="box box-widget">
                <div class="box-header repo-header" style="">
                    <div class="folder-descr">
                        <span class="text">Design a nice theme Make the theme responsive 1Make the theme responsive 2Make the theme responsive</span>
                    </div>
                    <div class="pull-right check-all">
                        <a title="Check all items to clipboard or not." data-toggle="tooltip"><i class="fa fa-square-o" ></i></a>
                    </div>
                </div><!-- /.box-header-->
                <div class="box-body repo-list">
                    <ul class="list-group list-group-unbordered">
                        <li class="list-group-item clearfix">
                            <div class="media">
                            <div class="item-type">
                                <div class="img-32x32-repo-item img-repo-folder">
                                </div>
                            </div>
                            <div class="repo-item bd">
                                <ul class="action-list">
                                    <li class="action" data-toggle="tooltip" title="comments information">
                                        <a  obid="btn_show_comments" href="javascript:;">
                                        <i class="fa fa-commenting"></i>
                                        </a>
                                    </li>

                                    <li class="action" data-toggle="tooltip" title="favorite file">
                                        <a  href="#" data-toggle="modal" data-target="#file-info-modal">
                                        <i class="fa fa-edit"></i>
                                        </a>
                                    </li>
                                    <li class="action" data-toggle="tooltip" title="Share file">
                                        <a  href="#">
                                        <i class="fa fa-share-alt"></i>
                                        </a>
                                    </li>                                    
                                    <li class="action">
                                        <a  href="#">
                                        <i class="fa fa-square-o" ></i>
                                        </a>
                                    </li>
                                </ul>
                                <div class="item-name-container">
                                    <a class="item-link " href="#">
                                        sub1 folder for demo testing
                                    </a>      

                                    <span class="badge long-badge ellipsis" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
                                        Owned externally
                                    </span>
                                </div>
                                <ul class="inline-list" >
                                    <li class="">
                                        Updated yesterday by 
                                        <a class="hoverlight profile_link">
                                        evilsucker
                                        </a>
                                    </li>
                                    <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
                                    <span class="label label-default" style=""><i class="fa fa-file"></i></span>
                                    <div style="display: inline-block;">
                                        <div class="countinfo">
                                            <span >
                                            <span class="">13</span>
                                            </span>
                                        </div>
                                        <div class="countinfonub"><s></s><i></i></div>
                                    </div>
                                    </li>
                                    <li title="3 People favorite this " data-toggle="tooltip" class="item-stat">
                                    <span class="label label-default" style=""><i class="fa fa-star"></i></span>
                                    <div style="display: inline-block;">
                                        <div class="countinfo">
                                            <span >
                                            <span class="">2</span>
                                            </span>
                                        </div>
                                        <div class="countinfonub"><s></s><i></i></div>
                                    </div>
                                    </li>
                                    <li title="Current version is 1.3" data-toggle="tooltip" class="item-stat">
                                    <span class="label label-default" style=""><i class="fa fa-paperclip"></i></span>
                                    <div style="display: inline-block;">
                                        <div class="countinfo">
                                            <span >
                                            <span class="">1.3</span>
                                            </span>
                                        </div>
                                        <div class="countinfonub"><s></s><i></i></div>
                                    </div>
                                    </li>
                                    <li title="Version List" data-toggle="tooltip" class="item-stat">
                                        <span id="versionlist" class=" popup-marker"><a class="label label-default " style=""><i class="fa fa-signal"></i></a>&nbsp</span>
                                        <div class="content hide" >
                                            <div class="panel-body popover-content">
                                            <ul class="list-group">
                                                <li class="list-group-item ">
                                                    <div class="version-item">
                                                        <span class="label label-default ">V1.0</span> <span>Gary - </span> <span style="font-style:italic;">this is demo description</span>
                                                    </div>
                                                </li>        
                                                <li class="list-group-item">
                                                        <div class="version-item">
                                                        <span class="label label-default ">V1.1</span> <span>Gary - </span> <span style="font-style:italic;">this is demo description</span>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                        <div class="version-item">
                                                        <span class="label label-default ">V2.0</span> <span>Gary - </span> <span style="font-style:italic;">this is demo description</span>
                                                    </div>
                                                </li>
                                            </ul>
                                            </div>
                                        </div>
                                    </li>
                                    <li title="Detail Information" data-toggle="tooltip" class="item-stat">
                                        <span id="informationlist" class=" popup-marker"><a  class="label label-default" style=""><i class="fa fa-info-circle"></i></a>&nbsp</span>
                                        <div class="content hide">
                                            <div class="panel-body popover-content">
                                                <table class="table table-condensed">
                                                    <thead>
                                                        <tr>
                                                            <th>First Name</th>
                                                            <th>Last Name</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Carter</td>
                                                            <td>johncarter@mail.com</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Parker</td>
                                                            <td>peterparker@mail.com</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Rambo</td>
                                                            <td>johnrambo@mail.com</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="inline-list">
                                    <li class="">
                                        <div class="description-text-container">
                                        <span class="" >
                                            this is for demo usage
                                        </span>
                                        </div>
                                    </li>
                                    
                                </ul>
                                <div>
                                        <p class="tags xsmall" style="margin-bottom:0px;">
                                                    <a title="" href="" class="tag-red ">Fashion</a>
                                                    <a title="" href="" class="tag-yellow ">测试</a>
                                                    <a title="" href="" class="tag-blue ">学习</a>
                                                    <a title="" href="" class="tag-green  ">Java</a>
                                                    <a title="" href="" class="tag-default tag-point-red">工具</a>
                                                    <a title="" href="" class="tag-default tag-point-yellow ">专业</a>
                                                    <a title="" href="" class="tag-default tag-point-green">电气</a>
                                                    <a title="" href="" class="tag-default tag-point-blue">评分</a>
                                                    <a title="" href="" class="tag-default  ">投票</a>
                                                    <a title="" href="" class="tag-red  ">更新</a>
                                                    </p>                                
                                </div>
                                <div obid="comment_list_container" style="display:none;">
                                    <div obid="comment_list" class="direct-chat-messages" style="margin-top:5px;margin-bottom:0px;">
                                        <!-- Message. Default to the left -->
                                        <div class="direct-chat-msg">
                                        <div class="direct-chat-info clearfix">
                                            <span class="direct-chat-name pull-left margin-r-5">Alexander Pierce</span>
                                            <span class="label label-warning text-center margin-r-5">correct</span>
                                            <a href="#" class="link-black text-sm margin-r-5"><i class="fa fa-check "></i>Correct</a>
                                            <a href="#" class="link-black text-sm margin-r-5"><i class="fa fa-hand-rock-o"></i>Ignore</a>
                                            <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                            Is this template really for free? That's unbelievable!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <div class="direct-chat-msg">
                                        <div class="direct-chat-info clearfix">
                                        <span class="direct-chat-name pull-left">Alexander Pierce</span>
                                        <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                        Is this template really for free? That's unbelievable!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <div class="direct-chat-msg">
                                        <div class="direct-chat-info clearfix">
                                            <span class="direct-chat-name pull-left">Alexander Pierce</span>
                                            <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                            Is this template really for free? That's unbelievable!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <div class="direct-chat-msg right">
                                        <div class="direct-chat-info clearfix">
                                        <span class="direct-chat-name pull-right">Sarah Bullock</span>
                                        <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                        You better believe it!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <div class="direct-chat-msg right">
                                        <div class="direct-chat-info clearfix">
                                        <span class="direct-chat-name pull-right">Sarah Bullock</span>
                                        <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                        You better believe it!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <div class="direct-chat-msg right">
                                        <div class="direct-chat-info clearfix">
                                        <span class="direct-chat-name pull-right">Sarah Bullock</span>
                                        <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                        You better believe it!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <div class="direct-chat-msg">
                                        <div class="direct-chat-info clearfix">
                                        <span class="direct-chat-name pull-left">Alexander Pierce</span>
                                        <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                        Is this template really for free? That's unbelievable!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <div class="direct-chat-msg">
                                        <div class="direct-chat-info clearfix">
                                            <span class="direct-chat-name pull-left">Alexander Pierce</span>
                                            <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                            Is this template really for free? That's unbelievable!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <!-- Message to the right -->
                                        <div class="direct-chat-msg right">
                                        <div class="direct-chat-info clearfix">
                                        <span class="direct-chat-name pull-right">Sarah Bullock</span>
                                        <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                        You better believe it!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->

                                        </div>
                                        <input class="form-control input-sm" type="text" placeholder="Type a comment" style="margin-top:5px;">
                             </div>
                                        </div>
                                        </div>
                                        </li>
                        <li class="list-group-item clearfix">
                            <div class="media">
                                <div class="item-type">
                                        <div class="img-32x32-repo-item img-repo-folder">
                                        </div>
                                        </div>
                            <div class="repo-item bd">
                                    <ul class="action-list">
                                        <li class="action" data-toggle="tooltip" title="version information">
                                        <a  href="#" data-toggle="modal" data-target="#file-version-modal">
                                        <i class="fa fa-signal"></i>
                                        </a>
                                        </li>
                                        <li class="action" data-toggle="tooltip" title="detail information">
                                        <a obid="btn_show_info" href="#" data-toggle="modal" data-target="#file-info-modal">
                                        <i class="fa fa-info"></i>
                                        </a>
                                        </li>
                                        <li class="action" data-toggle="tooltip" title="comments information">
                                        <a obid="btn_show_comments" href="javascript:;">
                                        <i class="fa fa-commenting"></i>
                                        </a>
                                        </li>
                                        <li class="action" data-toggle="tooltip" title="Share file">
                                        <a  href="#">
                                        <i class="fa fa-share-alt"></i>
                                        </a>
                                        </li>
                                        <li class="action" data-toggle="tooltip" title="favorite file">
                                        <a  href="#"><i class="fa fa-star"></i>
                                        </a>
                                        </li>
                                        <li class="action">
                                        <a  href="#"><i class="fa fa-square-o" ></i>
                                        </a>
                                        </li>
                                    </ul>
                                    <div class="item-name-container">
                                        <a class="item-link " href="#">
                                        sub2 folder
                                        </a>
                                        <span class="badge long-badge ellipsis" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
                                        Owned externally
                                        </span>
                                    </div>
                                    <ul class="inline-list" >
                                        <li class="">
                                        Updated yesterday by 
                                        <a class="hoverlight profile_link">
                                        evilsucker
                                        </a>
                                        </li>
                                        <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
                                        <span class="">
                                        <span>
                                        <i class="fa fa-file"></i>
                                        </span>
                                        13
                                        </span>
                                        </li>
                                        <li title="3 People favorite this " data-toggle="tooltip" class="item-stat">
                                        <span class="">
                                        <span>
                                        <i class="fa fa-user"></i>
                                        </span>
                                        2
                                        </span>
                                        </li>
                                    </ul>
                                    <ul class="inline-list">
                                        <li class="">
                                        <div class="description-text-container">
                                        <span class="" >
                                        this is for demo usage
                                        </span>
                                        </div>
                                        </li>
                                    </ul>
                                <div obid="comment_list_container" style="display:none;">
                                    <div obid="comment_list" class="direct-chat-messages" style="margin-top:5px;margin-bottom:0px;">
                                        <!-- Message. Default to the left -->
                                        <div class="direct-chat-msg">
                                        <div class="direct-chat-info clearfix">
                                        <span class="direct-chat-name pull-left margin-r-5">Alexander Pierce</span>
                                        <span class="label label-warning text-center margin-r-5">correct</span>
                                        <a href="#" class="link-black text-sm margin-r-5"><i class="fa fa-check "></i>Correct</a>
                                        <a href="#" class="link-black text-sm margin-r-5"><i class="fa fa-hand-rock-o"></i>Ignore</a>
                                        <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                        Is this template really for free? That's unbelievable!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <div class="direct-chat-msg">
                                        <div class="direct-chat-info clearfix">
                                            <span class="direct-chat-name pull-left">Alexander Pierce</span>
                                            <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                            Is this template really for free? That's unbelievable!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <div class="direct-chat-msg">
                                        <div class="direct-chat-info clearfix">
                                        <span class="direct-chat-name pull-left">Alexander Pierce</span>
                                        <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user1-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                        Is this template really for free? That's unbelievable!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <div class="direct-chat-msg right">
                                        <div class="direct-chat-info clearfix">
                                            <span class="direct-chat-name pull-right">Sarah Bullock</span>
                                            <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                            You better believe it!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <div class="direct-chat-msg right">
                                        <div class="direct-chat-info clearfix">
                                            <span class="direct-chat-name pull-right">Sarah Bullock</span>
                                            <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                            You better believe it!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        <!-- Message to the right -->
                                        <div class="direct-chat-msg right">
                                        <div class="direct-chat-info clearfix">
                                            <span class="direct-chat-name pull-right">Sarah Bullock</span>
                                            <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
                                        </div><!-- /.direct-chat-info -->
                                        <img alt="message user image" src="${path_image}/user3-128x128.jpg" class="direct-chat-img"><!-- /.direct-chat-img -->
                                        <div class="direct-chat-text">
                                            You better believe it!
                                        </div><!-- /.direct-chat-text -->
                                        </div><!-- /.direct-chat-msg -->
                                        
                                    </div>
                                    <input class="form-control input-sm" type="text" placeholder="Type a comment" style="margin-top:5px;">
                                </div>
                            </div>
                            </div>
                        </li>
                        <li class="list-group-item clearfix">
                            <div class="media">
                            <div class="item-type">
                                <div class="img-32x32-repo-item img-repo-folder">
                                </div>
                            </div>
                            <div class="repo-item bd">
                                <ul class="action-list">
                                <li class="action">
                                    <a  href="#">
                                    <i class="fa fa-share-alt"></i>
                                    </a>
                                </li>
                                <li class="action">
                                    <a  href="#"><i class="fa fa-star"></i>
                                    </a>
                                </li>
                                <li class="action">
                                    <a  href="#"><i class="fa fa-square-o" ></i>
                                    </a>
                                </li>
                                </ul>
                                <div class="item-name-container">
                                <a class="item-link " href="#">
                                    sub3 folder for repeated folder demo
                                </a>      

                                <span class="badge long-badge ellipsis ellipsis_180" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
                                    Owned externally
                                </span>
                                </div>
                                <ul class="inline-list" >
                                <li class="">
                                    Updated yesterday by 
                                    <a class="hoverlight profile_link">
                                    evilsucker
                                    </a>
                                </li>
                                <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
                                    <span class="">
                                    <span>
                                        <i class="fa fa-file"></i>
                                    </span>
                                    13
                                    </span>
                                </li>
                                <li title="3 People favorite this " data-toggle="tooltip" class="item-stat">
                                    <span class="">
                                    <span>
                                        <i class="fa fa-user"></i>
                                    </span>2
                                    </span>
                                </li>
                                <li title="Current version is 1.3" data-toggle="tooltip" class="item-stat">
                                    <span><span class="label label-default" style=""><i class="fa fa-paperclip"></i></span>&nbsp</span>                        
                                </li>
                                </ul>
                                <ul class="inline-list">
                                <li class="">
                                    <div class="description-text-container">
                                    <span class="" >
                                        this is for demo usage
                                    </span>
                                    </div>
                                </li>
                                </ul>
                            </div>
                            </div>

                        </li>
                        <li class="list-group-item clearfix">
                            <div class="media">
                            <div class="item-type">
                                <div class="img-32x32-repo-item img-repo-file">
                                </div>
                            </div>
                            <div class="repo-item bd">
                                <ul class="action-list">
                                <li class="action">
                                    <a  href="#">
                                    <i class="fa fa-share-alt"></i>
                                    </a>
                                </li>
                                <li class="action">
                                    <a  href="#"><i class="fa fa-star"></i>
                                    </a>
                                </li>
                                <li class="action">
                                    <a  href="#"><i class="fa fa-square-o" ></i>
                                    </a>
                                </li>
                                </ul>
                                <div class="item-name-container">
                                <a class="item-link " href="#">
                                    sub2 file
                                </a>      

                                <span class="badge long-badge ellipsis ellipsis_200" title="This folder is owned by a user in another enterprise" data-toggle="tooltip" >
                                    Owned externally
                                </span>
                                </div>
                                <ul class="inline-list" >
                                <li class="">
                                    Updated yesterday by 
                                    <a class="hoverlight profile_link">
                                    evilsucker
                                    </a>
                                </li>
                                <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
                                    <span class="">
                                    <span>
                                        <i class="fa fa-file"></i>
                                    </span>
                                    13
                                    </span>
                                </li>
                                <li title="3 People favorite this " data-toggle="tooltip" class="item-stat">
                                    <span class="">
                                    <span>
                                        <i class="fa fa-user"></i>
                                    </span>
                                    2
                                    </span>
                                </li>
                                </ul>
                                <ul class="inline-list">
                                <li class="">
                                    <div class="description-text-container">
                                    <span class="" >
                                        this is for demo usage
                                    </span>
                                    </div>
                                </li>
                                </ul>
                            </div>
                            </div>

                        </li>
                    </ul>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
            </div>
            <div class="col-md-3">
            <div class="box box-widget">
                <div class="box-header with-border" style="padding-bottom: 9px; padding-top: 9px;">
                    <div class="view-toolbar clearfix" style="margin-bottom: 0px;"> <!-- toolbar -->
                        <span class="pull-left" title="Create New File" data-toggle="tooltip" data-placement="top">
                            <button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#new-file-modal">
                            <i class="fa fa-file-o"></i>
                            </button>
                        </span>
                        <span class="pull-left" title="Create new folder" data-toggle="tooltip" data-placement="top">
                            <button class="btn btn-default btn-xs" data-toggle="modal" data-target="#new-file-modal">
                            <i class="fa fa-folder-o"></i>
                            </button>
                        </span>
                        <span class="pull-left" title="Workgroup Information" data-toggle="tooltip" data-placement="top">
                            <button class="btn btn-default btn-xs">
                            <i class="fa fa-info-circle"></i>
                            </button>
                        </span>
                    </div><!-- toolbar -->
                </div>
                <div class="box-body box-profile">
                    <div class="clearfix">
                        <div class="pull-left lite-info">
                        <img class="profile-user-img img-responsive img-circle" src="${path_image}/user4-128x128.jpg" alt="User profile picture">
                        
                        <div >
                            <p class="text-muted text-center" >owned by <a>Gary </a></p>
                            <p class="text-muted text-center" >since 2015-6-7</p>
                        </div>
                        </div>                            
                        <ul class="stats-info list-group list-group-unbordered pull-right" >
                            <li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
                            <b>任务</b> <a class="pull-right">1,322</a>
                            </li>
                            <li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
                            <b>共享</b> <a class="pull-right">543</a>
                            </li>
                            <li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
                            <b>文件</b> <a class="pull-right">13,287</a>
                            </li>
                            <li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
                            <b>讨论</b> <a class="pull-right">13,287</a>
                            </li>
                            <li class="list-group-item" style="padding-top:5px;padding-bottom:5px;">
                            <b>工作组</b> <a class="pull-right">13,287</a>
                            </li>
                        </ul>
                    </div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
            <!-- About Me Box -->
            <div class="box box-widget">
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
            <div class="box box-widget">
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
					<ul obid="docs_list" class="doc-list">
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
    <!-- Modal -->
    <!-- remove [tabindex="-1"] otherwise select2 not work-->
    <div class="modal fade" id="new-file-modal"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Create new Ticket</h4>
            </div>
            <div class="modal-body">
                <div class=" box-form form-horizontal">
                    <div class="form-group">
                    <label class="col-sm-2 control-label" for="doc-name">Subject</label>
                    <div class="col-sm-10">
                        <input type="text" placeholder="subject" id="doc-name" class="form-control">
                    </div>
                    </div>
                    <div class="form-group">
                    <label class="col-sm-2 control-label" for="doc-owner">Content</label>
                    <div class="col-sm-10">
                        <textarea style="resize:none;" placeholder="context" id="doc-owner" class="form-control" rows="3"></textarea>
                    </div>
                    </div>    
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >Attendee</label>
                        <div class="col-sm-10">
                        <select class="form-control select2" multiple="multiple" data-placeholder="Select a State" style="width:100%">
                        <option>Alabama</option>
                        <option>Alaska</option>
                        <option>California</option>
                        <option>Delaware</option>
                        <option>Tennessee</option>
                        <option>Texas</option>
                        <option>Washington</option>
                        </select>
                        </div>
                    </div><!-- /.form-group -->
                    <div class="form-group">
                            <label class="col-sm-2 control-label">                         
                            scope
                            </label>
                            <div class="col-sm-10">
                            <select class="form-control select2" style="width: 40%;">
                        <option selected="selected">Alabama</option>
                        <option>Alaska</option>
                        <option>California</option>
                        <option>Delaware</option>
                        <option>Tennessee</option>
                        <option>Texas</option>
                        <option>Washington</option>
                        </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">                         
                        comment
                        </label>
                        <div class="col-sm-10">
                            <div class="checkbox" >                  
                        
                            <label>
                            <input type="checkbox">
                            member only
                            </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-sm btn-primary">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    <!-- Modal -->
    <div class="modal fade" id="file-info-modal"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#activity" data-toggle="tab">Base Info</a></li>
                  <li><a href="#timeline" data-toggle="tab">Version</a></li>
                  <li><a href="#settings" data-toggle="tab">Privilege</a></li>
                  <li class="pull-right" style="margin-top: 10px; margin-right: 15px;"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></li>
                </ul>
                 <div class="tab-content">
                  <div class="active tab-pane" id="activity">
                  <div class="box-body" >
                    <div class=" box-form form-horizontal">
                        <div class="form-group">
                        <label class="col-sm-2 control-label" for="doc-name">Name</label>
                        <div class="col-sm-5">
                            <input type="text" placeholder="Email" id="doc-name" class="form-control">
                        </div>
                        </div>
                        <div class="form-group">
                        <label class="col-sm-2 control-label" for="doc-owner">Owner</label>
                        <div class="col-sm-5">
                            <input type="text" placeholder="Password" id="doc-owner" class="form-control">
                        </div>
                        </div>
                        <div class="form-group">
                        <label class="col-sm-2 control-label" for="doc-subject">Subject</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="Password" id="doc-subject" class="form-control">
                        </div>
                        </div>
                        <div class="form-group">
                        <label class="col-sm-2 control-label" for="doc-subject">Create</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="Password" id="doc-create" class="form-control">
                        </div>
                        </div>
                        <div class="form-group">
                        <label class="col-sm-2 control-label" for="doc-subject">Modify</label>
                        <div class="col-sm-10">
                            <input type="text" placeholder="Password" id="doc-modify" class="form-control">
                        </div>
                        </div>
                        <div class="form-group">
                        <label class="col-sm-2 control-label" for="doc-locked">Locked</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="Password" id="doc-locked" class="form-control">
                        </div>
                        </div>
                    </div>
                    </div>
                    <div class="box-footer">
                        <button class="btn btn-info" type="button">Info</button>
                    </div>
                  </div>
                  <div class="tab-pane" id="timeline">
                    <div class="box-body" >
                        <table class="table table-bordered table-condensed ">
                        <tbody><tr>
                            <th>Date</th>
                            <th>Operator</th>
                            <th>Version</th>
                            <th>Operation</th>
                            </tr>
                            <tr>      
                            <td>
                                <span class="label bg-blue margin-r-5">0.1</span><span class="badge bg-red">current</span>
                            </td>
                            <td>gdiao</td>                    
                            <td>2015-8-2 12:12:23</td>
                            <td>
                                <div class="btn-group">
                                  <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-remove-circle"></i></button>
                                </div>
                            </td>
                            </tr>
                            <tr>
                            <td>
                                <span class="label bg-blue margin-r-5">0.2</span>
                            </td>
                            <td>gdiao</td>    
                            <td>2015-8-2 12:12:23</td>

                            <td>
                                <div class="btn-group">
                                  <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-remove-circle"></i></button>
                                  <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-ok-circle"></i></button>
                                </div>
                            </td>
                            </tr>
                            <tr>
                            <td>
                                <span class="label bg-blue margin-r-5">0.3</span>
                            </td>
                            <td>gdiao</td>                        
                            <td>2015-8-2 12:12:23</td>

                            <td>
                                <div class="btn-group">
                                  <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-remove-circle"></i></button>
                                  <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-ok-circle"></i></button>
                                </div>
                            </td>
                            </tr>
                            <tr>
                            <td>
                                <span class="label bg-blue margin-r-5">0.4</span>
                            </td>
                            <td>gdiao</td>    
                            <td>2015-8-2 12:12:23</td>

                            <td>
                                <div class="btn-group">
                                  <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-remove-circle"></i></button>
                                  <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-ok-circle"></i></button>
                                </div>
                            </td>
                            </tr>
                        </tbody>
                        </table>
                    </div><!-- /.box-body -->
                  </div>
                  <div class="tab-pane" id="settings">
                    <div class="box-body" style="padding:0;">
                        <table class="table table-bordered table-condensed " style="margin-right:15px;">
                        <tbody>
                            <tr>
                                <th style="width:20%">Authority</th>
                                <th style="width:60%">Privilege</th>
                                <th style="width:20%">Operation</th>
                            </tr>
                        </tbody>
                        </table>
                        <div id="privilege-list">
                        <table class="table table-bordered table-condensed " style="margin-bottom:0;">
                        <tbody>
                            <tr>      
                                <td style="width:20%">gdiao</td>            
                                <td style="width:20%">
                                    <label>
									  <input type="checkbox" class="minimal">
									  Read
									</label>
                                </td>            
                                <td style="width:20%">
                                    <label><input type="checkbox">Write</label>
                                </td>            
                                <td style="width:20%">
                                    <label><input type="checkbox">Delete</label>
                                </td>
                                <td style="width:20%">
                                    <div class="btn-group">
                                      <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-remove-circle"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>      
                                <td>gdiao</td>            
                                <td>
                                    <label><input type="checkbox">Read</label>
                                </td>            
                                <td>
                                    <label><input type="checkbox">Write</label>
                                </td>            
                                <td>
                                    <label><input type="checkbox">Delete</label>
                                </td>
                                <td>
                                    <div class="btn-group">
                                      <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-remove-circle"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>      
                                <td>gdiao</td>            
                                <td>
                                    <label><input type="checkbox">Read</label>
                                </td>            
                                <td>
                                    <label><input type="checkbox">Write</label>
                                </td>            
                                <td>
                                    <label><input type="checkbox">Delete</label>
                                </td>
                                <td>
                                    <div class="btn-group">
                                      <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-remove-circle"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>      
                                <td>gdiao</td>            
                                <td>
                                    <label><input type="checkbox">Read</label>
                                </td>            
                                <td>
                                    <label><input type="checkbox">Write</label>
                                </td>            
                                <td>
                                    <label><input type="checkbox">Delete</label>
                                </td>
                                <td>
                                    <div class="btn-group">
                                      <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-remove-circle"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>      
                                <td>gdiao</td>            
                                <td>
                                    <label><input type="checkbox">Read</label>
                                </td>            
                                <td>
                                    <label><input type="checkbox">Write</label>
                                </td>            
                                <td>
                                    <label><input type="checkbox">Delete</label>
                                </td>
                                <td>
                                    <div class="btn-group">
                                      <button class="btn btn-default btn-xs" type="button"><i class="glyphicon glyphicon-remove-circle"></i></button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        </table>
                        </div>
                    <div class="box-footer">
						
                        <button class="btn btn-info" type="button">Info</button>
                    </div>
                    </div><!-- /.box-body -->
                  </div>
                </div>
        </div>
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    <!-- jQuery 2.1.4 -->
    <script src="${path_plugins}/jQuery/jquery.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${path_bootstrap}/js/bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="${path_plugins}/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${path_plugins}/fastclick/fastclick.min.js"></script>
    <!-- iCheck 1.0.1 -->
    <script src="${path_plugins}/iCheck/icheck.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${path_script}/app.min.js"></script>
    <script src="${path_script}/pages/personspace1.js"></script>
</body>
</html>