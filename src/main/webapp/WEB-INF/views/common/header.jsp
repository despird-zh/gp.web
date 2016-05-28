<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<nav class="navbar navbar-static-top">
<div class="container">
    <div class="navbar-header">
        <a href="../main/mainpage.do" class="navbar-brand"><b>Group</b>RESS</a>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
        </button>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
        <ul class="nav navbar-nav">
            <li class=""><a href="../ga/dashboard.do"><i class="fa fa-fw fa-gear fa-lg"></i></a></li>
            <li>
                <div gpid="message-toggle-container" class="clearfix pull-left">
                    <div class="message-toggle" data-toggle="dropdown" >
                        <div gpid="message-in-header" role="button" class="text-danger message-abstract">
                            <i class="fa fa-hand-peace-o fa-fw m-r-sm"></i>Welcome to Groupress ECM !!!
                        </div>
                    </div>
                    <ul class="dropdown-menu warn-err-message">
                        <li class="header">You have <strong gpid="err-message-count">4</strong> messages <span gpid="err-message-clear-btn" class="pull-right btn p-none text-muted"><i class="fa fa-trash fa-fw"></i></span>
                        </li>
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <ul gpid="err-message-list" class="menu">
                                <li><!-- start message -->
                                    <a href="javascript:;" role="button" >
                                    <span gpid="err-message-remove-btn" class="pull-right"><i class="fa fa-close fa-fw"></i></span>
                                    <span gpid="err-message-more-btn" class="pull-right"><i class="fa fa-angle-double-down fa-fw"></i></span>
                                    <small class="text-warning"><i class="fa fa-exclamation-triangle fa-fw"></i> 18:23:43</small>
                                    <p> Why not buy a new awesome theme sadf asdf dfs sdfsadf ?</p>
                                    <ol class="text-warning hidden detail-msgs" >
                                        <li>name : can be null.</li>
                                        <li>name : can be null.</li>
                                    </ol>
                                   </a>
                                </li><!-- end message -->
                                <li>
                                    <a href="javascript:;">
                                        <span gpid="err-message-remove-btn" class="pull-right"><i class="fa fa-close fa-fw"></i></span>
                                        <small class="text-info"><i class="fa fa-flag fa-fw"></i> 5 mins</small>
                                        <p>Why not buy a new awesome theme?</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span gpid="err-message-remove-btn" class="pull-right"><i class="fa fa-close fa-fw"></i></span>
                                        <small class="text-danger"><i class="fa fa-star fa-fw"></i> 5 mins</small>
                                        <p>Why not buy a new awesome theme?</p>
                                   </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                        <span gpid="err-message-remove-btn" class="pull-right"><i class="fa fa-close fa-fw"></i></span>
                                        <small class="text-info"><i class="fa fa-flag fa-fw"></i> 5 mins</small>
                                        <p>Why not buy a new awesome theme?</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                    <span gpid="err-message-remove-btn" class="pull-right"><i class="fa fa-close fa-fw"></i></span>
                                    <small class="text-danger"><i class="fa fa-star fa-fw"></i> 5 mins</small>
                                    <p>Why not buy a new awesome theme?</p>
                                </a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                    <span gpid="err-message-remove-btn" class="pull-right"><i class="fa fa-close fa-fw"></i></span>
                                    <small class="text-info"><i class="fa fa-flag fa-fw"></i> 5 mins</small>
                                    <p>Why not buy a new awesome theme?</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                    <span gpid="err-message-remove-btn" class="pull-right"><i class="fa fa-close fa-fw"></i></span>
                                    <small class="text-danger"><i class="fa fa-star fa-fw"></i> 5 mins</small>
                                    <p>Why not buy a new awesome theme?</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </div><!-- /.navbar-collapse -->

    <!-- Navbar Right Menu -->
    <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
            <li>
                <form class="navbar-form full-width">
                    <div class="form-group">
                        <input type="text" placeholder="Enter keyword" class="form-control">
                        <button class="btn btn-search" type="submit"><i class="fa fa-search"></i></button>
                    </div>
                </form>
            </li>
            <!-- Messages: style can be found in dropdown.less-->
            <li class="dropdown messages-menu">
                <!-- Menu toggle button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-envelope-o"></i>
                    <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                    <li class="header">You have 4 messages</li>
                    <li>
                      <!-- inner menu: contains the messages -->
                      <ul class="menu">
                        <li><!-- start message -->
                          <a href="#">
                            <div class="pull-left">
                              <!-- User Image -->
                              <img src="${path_image}/user2-160x160.jpg" class="img-circle" alt="User Image">
                            </div>
                            <!-- Message title and timestamp -->
                            <h4>
                              Support Team
                              <small><i class="fa fa-clock-o"></i> 5 mins</small>
                            </h4>
                            <!-- The message -->
                            <p>Why not buy a new awesome theme?</p>
                          </a>
                        </li><!-- end message -->
                      </ul><!-- /.menu -->
                    </li>
                    <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
            </li><!-- /.messages-menu -->

            <!-- Notifications Menu -->
            <li class="dropdown notifications-menu">
              <!-- Menu toggle button -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-bell-o"></i>
                <span class="label label-warning">10</span>
              </a>
              <ul class="dropdown-menu">
                <li class="header">You have 10 notifications</li>
                <li>
                  <!-- Inner Menu: contains the notifications -->
                  <ul class="menu">
                    <li><!-- start notification -->
                      <a href="#">
                        <i class="fa fa-users text-aqua"></i> 5 new members joined today
                      </a>
                    </li><!-- end notification -->
                  </ul>
                </li>
                <li class="footer"><a href="#">View all</a></li>
              </ul>
            </li>
            <!-- Tasks Menu -->
            <li class="dropdown tasks-menu">
              <!-- Menu Toggle Button -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-flag-o"></i>
                <span class="label label-danger">9</span>
              </a>
              <ul class="dropdown-menu">
                <li class="header">You have 9 tasks</li>
                <li>
                  <!-- Inner menu: contains the tasks -->
                  <ul class="menu">
                    <li><!-- Task item -->
                      <a href="#">
                        <!-- Task title and progress text -->
                        <h3>
                          Design some buttons
                          <small class="pull-right">20%</small>
                        </h3>
                        <!-- The progress bar -->
                        <div class="progress xs">
                          <!-- Change the css width attribute to simulate progress -->
                          <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                            <span class="sr-only">20% Complete</span>
                          </div>
                        </div>
                      </a>
                    </li><!-- end task item -->
                  </ul>
                </li>
                <li class="footer">
                  <a href="#">View all tasks</a>
                </li>
              </ul>
            </li>
            <!-- User Account Menu -->
            <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <!-- The user image in the navbar-->
                <img src="${path_image}/user2-160x160.jpg" class="user-image" alt="User Image">
                <!-- hidden-xs hides the username on small devices so only the image appears. -->
                <span class="hidden-xs">&nbsp;</span>
                </a>
                <ul class="dropdown-menu">
                    <!-- The user image in the menu -->
                    <li class="user-header">
                      <img src="${path_image}/user2-160x160.jpg" class="img-circle pull-left" alt="User Image"  style="margin-top: 10px; margin-left: 10px;">
                      <div style="margin-left:85px;">
                      <p class="m-b-none">
                        Alexander Pierce
                      </p>
                      <p class="m-b-none">
                        Developer
                      </p>
                        <p class="m-b-none">
                        <small>Since : Nov. 2012</small><br>
                        <small>Last Logon : Nov. 2012</small>
                        </p>
                      </div>
                    </li>
                    <!-- Menu Body -->
                    <li class="user-body">
                      <div class="row">
                        <div class="col-xs-6 text-center">
                          <a href="../workgroup/workgroup-grid.do">Workgroups</a>
                        </div>
                        <div class="col-xs-6 text-center">
                          <a href="../workspace/netdisk.do">Workspace</a>
                        </div>
                      </div><!-- /.row -->
                    </li>
                    <!-- Menu Footer-->
                    <li class="user-footer">
                      <div class="pull-left">
                        <a href="#" class="btn btn-default btn-flat">Profile</a>
                      </div>
                      <div class="pull-right">
                        <a href="#" class="btn btn-default btn-flat">Sign out</a>
                      </div>
                    </li>
                </ul>
            </li>
        </ul>
        </div><!-- /.navbar-custom-menu -->
    </div><!-- /.container-fluid -->
</nav>
    
<script id="message-text-template" type="x-tmpl-mustache">
    {{#warning}}
         <li>
               <a href="javascript:;">
                 <span gpid="err-message-remove-btn" class="pull-right"><i class="fa fa-close fa-fw"></i></span>
                 {{#hasDetail}}
                 <span gpid="err-message-more-btn" class="pull-right"><i class="fa fa-angle-double-down fa-fw"></i></span>
                 {{/hasDetail}}
                 <small class="text-warning"><i class="fa fa-warning fa-fw"></i> {{timeText}}</small>
                 <p>{{messageText}}</p>
                 <ol class="text-warning hidden detail-msgs" style="">
                 {{#detailMessages}}
                      <li style="word-wrap: break-word;">{{property}} : {{message}}</li>    
                 {{/detailMessages}}
                 </ol>
               </a>
         </li>
    {{/warning}}
    {{#error}}
         <li>
               <a href="javascript:;">
                 <span gpid="err-message-remove-btn" class="pull-right"><i class="fa fa-close fa-fw"></i></span>
                  {{#hasDetail}}
                 <span gpid="err-message-more-btn" class="pull-right"><i class="fa fa-angle-double-down fa-fw"></i></span>
                 {{/hasDetail}}
                 <small class="text-danger"><i class="fa fa-exclamation-triangle fa-fw"></i> {{timeText}}</small>
                 <p>{{messageText}}</p>
                 <ol class="text-warning hidden detail-msgs" style="">
                 {{#detailMessages}}
                      <li style="word-wrap: break-word;">{{property}} : {{message}}</li>    
                 {{/detailMessages}}
                 </ol>
               </a>
         </li>
    {{/error}}
    {{#info}}
         <li>
               <a href="javascript:;">
                 <span gpid="err-message-remove-btn" class="pull-right"><i class="fa fa-close fa-fw"></i></span>
                 {{#hasDetail}}
                 <span gpid="err-message-more-btn" class="pull-right"><i class="fa fa-angle-double-down fa-fw"></i></span>
                 {{/hasDetail}}
                 <small class="text-info"><i class="fa fa-flag fa-fw"></i> {{timeText}}</small>
                 <p>{{messageText}}</p>
                 <ol class="text-warning hidden detail-msgs" style="">
                 {{#detailMessages}}
                      <li style="word-wrap: break-word;">{{property}} : {{message}}</li>    
                 {{/detailMessages}}
                 </ol>
               </a>
         </li>
    {{/info}}
</script><!-- /.template:message-text -->
<script id="message-header-template" type="x-tmpl-mustache">
    {{#warning}}
        <i class="fa fa-warning fa-fw m-r-sm"></i>{{messageText}}
    {{/warning}}
    {{#error}}
        <i class="fa fa-exclamation-triangle fa-fw m-r-sm"></i>{{messageText}}
    {{/error}}
    {{#info}}
         <i class="fa fa-flag fa-fw m-r-sm"></i>{{messageText}}
    {{/info}}
</script><!-- /.template:message-text -->

<div id="loading-dialog" class="modal hide" data-backdrop="static" data-keyboard="false">
    <div class="modal-header">
        <h1 gpid="tip-message">Processing...</h1>
    </div>
    <div class="modal-body">
        <div class="progress progress-striped active">
            <div class="bar" style="width: 100%;"></div>
        </div>
    </div>
</div><!-- /#loading-dialog -->