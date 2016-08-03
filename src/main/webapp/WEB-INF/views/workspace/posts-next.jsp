<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<div class="box-body repo-list">
	<ul class="infinite-container list-group list-group-unbordered">
<c:forEach var="postitem" items="${entries}">
	<li class="list-group-item infinite-item" style="border-top: none;">
		<div  class="ticket">
			<div class="pull-left avatar-info">
				<a >
					<img class="img-bordered-sm" src="${path_image}/user1-128x128.jpg" alt="user image">
				</a>
				<div class="thumbs-info" >
					<div><a style="cursor:pointer;"><i class="fa fa-thumbs-o-up"></i></a></div>
					<div><span  class="label label-success text-center">1235</span></div>
					<div class="bottom-thumb"><a style="cursor:pointer;"><i class="fa fa-thumbs-o-down"></i></a></div>
				</div>
			</div>
			<!-- PostItem -->
			<div class="post" >
				<div class="user-block">
								<span class="username">
								  <a href="#" class="margin-r-5">杜新民</a>
								  <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
								</span>
					<span  class="label label-warning text-center margin-r-5">电气工作组</span>
					<span  class="label label-warning text-center margin-r-5">企业发布</span>
					<span class="description">7:30 PM today</span>
				</div><!-- /.user-block -->
				<div class="clearfix">
					<div class="inline-docs pull-right" >
						<ul class="doc-items show-scrollbar">
							<li><!-- start message -->
								<a href="#">
											  <span><i class="fa fa-file-o margin-r-5"></i>
												关于UI设计文件.docx
											  </span>
								</a>
								<small class="pull-right"><i class="fa fa-clock-o"></i> Today</small>
							</li><!-- end message -->
							<li>
								<a class="ellipsis ellipsis-180"href="#">
											  <span><i class="fa fa-file-o margin-r-5"></i>
												总体设计文件.mov
											  </span>
								</a>
								<small class="pull-right"><i class="fa fa-clock-o"></i> 2 hours</small>
							</li>
							<li>
								<a href="#">
											  <span><i class="fa fa-file-o margin-r-5"></i>
												开发人员安排.xls
											  </span>
								</a>
								<small class="pull-right"><i class="fa fa-clock-o"></i> Today</small>
							</li>
							<li>
								<a href="#">
											  <span><i class="fa fa-file-o margin-r-5"></i>
												任务更细文件.doc
											  </span>
								</a>
								<small class="pull-right"><i class="fa fa-clock-o "></i> Yesterday</small>
							</li>
							<li>
								<a href="#">
											  <span>
												<i class="fa fa-clock-o margin-r-5"></i>
												工作制度及奖惩规定.doc
											  </span>
								</a>
								<small class="pull-right"><i class="fa fa-clock-o"></i> 2 days</small>
							</li>
						</ul>
					</div>
					评论区有人问为什么这么说……是这样的，iOS中回到主屏后App就被冻结，除音乐播放之类的进程之外不允许常驻后台，那么怎么在手机关屏后推送消息呢？是开发者在服务器上把消息先推送给苹果的服务器，然后苹果把该用户的微信、QQ、Facebook、淘宝等各种消息统一推送给用户，这样就做到了不影响消息推送的情况下、同时减少后台个数，熄屏几乎不耗。

				</div>
				<ul class="list-inline">
					<li><a href="#" class="link-black text-sm"><i class="fa fa-plug margin-r-5"></i> Join</a></li>
					<li><a href="#" class="link-black text-sm"><i class="fa fa-star-o margin-r-5"></i> Like</a></li>
					<li><a href="#" class="link-black text-sm"><i class="fa fa-paper-plane-o margin-r-5"></i> Public</a></li>
					<li><a href="#" class="link-black text-sm" data-toggle="tooltip" title="Send out post and comments as pdf"><i class="fa fa-envelope-o margin-r-5"></i> Send</a></li>
					<li class="pull-right"><a obid="users_show_btn" href="javascript:;" class="link-black text-sm"><i class="fa fa-users margin-r-5"></i> Users (13)</a></li>
					<li class="pull-right"><a obid="comments_show_btn" href="javascript:;" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments (5)</a></li>
				</ul>
				<div obid="users_list_container" style="display:none;">
					<div obid="users_list" style="" class="row clearfix user-list">
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${path_image}/user1-128x128.jpg" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">userassss</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
					</div>
				</div>
				<div obid="comment_list_container" style="display:none">
					<div obid="comment_list" class="direct-chat-messages" style="margin-top:5px;margin-bottom:0px;">
						<!-- Message. Default to the left -->
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
			</div><!-- /.post -->
		</div>
	</li>
</c:forEach>
	</ul><!-- end list -->
<c:if test="${hasMore}">
	<a class="infinite-more-link hidden" href="posts-next.do?pageNumber=${nextPage}&cabinet_id=${cabinetId}&folder_id=${folderId}">More</a>
</c:if>
</div><!-- /.box-body -->