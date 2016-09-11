<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<div class="box-body repo-list">
	<ul class="infinite-container list-group list-group-unbordered">
<c:forEach var="postitem" items="${entries}">
	<li class="list-group-item infinite-item">
		<div class="ticket clearfix m-t-xs">
			<div class="pull-left avatar-info p-t-xxs" data-post-id="${postitem.postId}">
				<a>
					<img src="${postitem.ownerAvatar}" alt="user image">
				</a>
				<div class="thumbs-info" >
					<div><span class="label label-success text-center">1235</span></div>
					<div class="bottom-thumb">
						<a style="cursor:pointer;margin-right:5px;" href="javascript:void(0);" onclick="PageContext.LikePost(this);" class="link-black"><i class="fa fa-thumbs-o-up"></i></a>
						<a style="cursor:pointer;" href="javascript:void(0);" onclick="PageContext.DislikePost(this);" class="link-black"><i class="fa fa-thumbs-o-down"></i></a>
					</div>
				</div>
			</div>
			<!-- PostItem -->
			<div class="post" data-post-id="${postitem.postId}">
				<div class="post-head">
					<a href="#" class="margin-r-5">${postitem.ownerName}</a>
					<label class="label label-warning margin-r-5" style="vertical-align:middle;font-size:60%;">企业发布</label>
					<span class="label label-warning text-center margin-r-5">${postitem.workgroupName}</span>
					<span>${postitem.subject}</span>
					<a href="javascript:void(0);" onclick="PageContext.RemovePost(this);" class="pull-right btn-box-tool" style="padding-top: 0px;"><i class="fa fa-times"></i></a>
					<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
				</div><!-- /.user-block -->
				<div class="post-content">
					${postitem.excerpt}
				</div>
				<textarea gpid="content-holder" data-type="content" class="hidden">${postitem.content}</textarea>
				<ul class="list-inline">
					<li><a href="javascript:void(0);" class="link-black text-sm margin-r-5"><i class="fa fa-plug"></i> Join</a></li>
					<li><a href="javascript:void(0);" class="link-black text-sm margin-r-5" onclick="PageContext.FavoritePost(this);" data-toggle="tooltip" title="Add or remove the post as favorite"><i class="fa fa-star-o"></i> Like</a></li>
					<li><a href="javascript:void(0);" class="link-black text-sm margin-r-5" onclick="PageContext.PublicPost(this);" data-toggle="tooltip" title="Make this post public visible"><i class="fa fa-paper-plane-o"></i> Public</a></li>
					<li><a href="javascript:void(0);" class="link-black text-sm margin-r-5" data-toggle="tooltip" title="Send out post and comments as pdf"><i class="fa fa-envelope-o"></i> Send</a></li>
					<li><a href="javascript:void(0);" class="link-black text-sm margin-r-5" onclick="PageContext.SwitchPostContent(this);" data-toggle="tooltip" title="Show full content of post"><i class="fa fa-newspaper-o"></i> Full</a></li>
					<li class="pull-right"><a obid="users_show_btn" href="javascript:void(0);" onclick="PageContext.ShowUsers(this);" class="link-black text-sm margin-r-5"><i class="fa fa-users"></i>Users(13)</a></li>
					<li class="pull-right"><a obid="comments_show_btn"  href="javascript:void(0);" onclick="PageContext.ShowComments(this);" class="link-black text-sm margin-r-5"><i class="fa fa-comments-o"></i>Comments(5)</a></li>
				</ul>
				<div gpid="users_list_container" class="hidden container-fluid">
					<div obid="users_list" style="" class="row clearfix">
					<c:forEach var="useritem" items="${postitem.attendees}">
						<div class="col-md-1 user-avatar">
							<img alt="message user image" src="${useritem.avatarLink}" ><!-- /.direct-chat-img -->
							<a class="ellipsis ellipsis-50">${useritem.userName}</a>
							<a class="remove-user"><i class="fa fa-times"></i></a>
						</div>
					</c:forEach>
					</div>
				</div>
				<div gpid="comment_list_container" class="hidden">
					<c:if test="${not empty postitem.comments}">
					<div gpid="comment_list" class="direct-chat-messages m-t-xs m-b-xs">
						<!-- Message. Default to the left -->
						<c:forEach var="commentitem" items="${postitem.comments}">
						<div class="direct-chat-msg">
							<div class="direct-chat-info clearfix">
								<span class="direct-chat-name pull-left m-r">${commentitem.author}</span>
								<a class="link-black text-sm m-r-5" href="#"><i class="fa fa-fw fa-check "></i>Accept</a>
								<a class="link-black text-sm m-r-5" href="#"><i class="fa fa-fw fa-hand-rock-o"></i>Ignore</a>
								<span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
							</div><!-- /.direct-chat-info -->
							<img alt="message user image" src="${commentitem.authorAvatar}" class="direct-chat-img"><!-- /.direct-chat-img -->
							<div class="direct-chat-text">
								${commentitem.content}
							</div><!-- /.direct-chat-text -->
						</div><!-- /.direct-chat-msg -->
						</c:forEach>
					</div>
					</c:if>
					<div class="input-group m-t-xs">
						<input gpid="comment-txt" type="text" class="form-control" placeholder="Type comments ...">
						<span class="input-group-btn">
							<button class="btn btn-primary btn-flat btn-sm" type="button" onclick="PageContext.SaveComment(this)">Send</button>
						</span>
                    </div>
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