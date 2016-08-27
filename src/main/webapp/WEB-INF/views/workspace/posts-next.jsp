<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<div class="box-body repo-list">
	<ul class="infinite-container list-group list-group-unbordered">
<c:forEach var="postitem" items="${entries}">
	<li class="list-group-item infinite-item">
		<div  class="ticket clearfix m-t-xs">
			<div class="pull-left avatar-info p-t-xxs">
				<a >
					<img class="img-sm" src="${postitem.ownerAvatar}" alt="user image">
				</a>
				<div class="thumbs-info" >
					<div><a style="cursor:pointer;"><i class="fa fa-thumbs-o-up"></i></a></div>
					<div><span  class="label label-success text-center">1235</span></div>
					<div class="bottom-thumb"><a style="cursor:pointer;"><i class="fa fa-thumbs-o-down"></i></a></div>
				</div>
			</div>
			<!-- PostItem -->
			<div class="post" data-post-id="${postitem.postId}">
				<div class="post-head">
					<a href="#" class="margin-r-5">${postitem.ownerName}</a>
					<label class="label label-warning margin-r-5" style="vertical-align:middle;font-size:60%;">企业发布</label>
					<span class="label label-warning text-center margin-r-5">${postitem.workgroupName}</span>
					<span>${postitem.subject}</span>
					<a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
					<span class="text-muted pull-right margin-r-5"><i class="fa fa-clock-o"></i> 8:03 PM Today</span>
				</div><!-- /.user-block -->
				<div class="post-content">
					${postitem.content}
				</div>
				<ul class="list-inline">
					<li><a href="#" class="link-black text-sm"><i class="fa fa-plug margin-r-5"></i> Join</a></li>
					<li><a href="#" class="link-black text-sm"><i class="fa fa-star-o margin-r-5"></i> Like</a></li>
					<li><a href="#" class="link-black text-sm"><i class="fa fa-paper-plane-o margin-r-5"></i> Public</a></li>
					<li><a href="#" class="link-black text-sm" data-toggle="tooltip" title="Send out post and comments as pdf"><i class="fa fa-envelope-o margin-r-5"></i> Send</a></li>
					<li class="pull-right"><a obid="users_show_btn" href="javascript:;" class="link-black text-sm"><i class="fa fa-users margin-r-5"></i> Users (13)</a></li>
					<li class="pull-right"><a obid="comments_show_btn"  href="javascript:;" onclick="PageContext.ShowComments(this);" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments (5)</a></li>
				</ul>
				<div gpid="users_list_container" class="hidden">
					<div obid="users_list" style="" class="row clearfix user-list">
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