;
var PageContext = (function ($, window, undefined){

	"use strict";
	var Topics = {
		
		$post_container : $('#post-container'),
		$new_post_btn : $('button[gpid="new-post-btn"]'),
		$workgroup_id : $('#meta-wgroup-id'),
		initial : function(){
			var _self = this;

			_self.$new_post_btn.on('click', function(){
				GPContext.showNewPost();
			});
			// load the content
			_self.loadContent();
		}
	};
	
		/*
	 * Load the content of post list
	 */
	Topics.loadContent = function(){
		var _self = this;
		$.ajax({
			url: "../workgroup/posts-next.do",
			dataType : "html",
			type: 'POST',
			data: {
				"wgroup_id" : _self.$workgroup_id.val(),
				"pageNumber" : 1
			},
			success: function(response)
			{
				_self.$post_container.html($(response).html());
				_self.$infinite_list = $('ul.infinite-container');

				_self._waypoint = new Waypoint.Infinite({
					element: _self.$infinite_list,
					onAfterPageLoad : function($items){

					}
				});
			}
		});
	};
	

	Topics.doShowComments = function(el){
		var $post = $(el).parentsUntil('.ticket','.post');
		var $users = $('div[gpid="users_list_container"]', $post);
		var $comments = $('div[gpid="comment_list_container"]', $post);
		$comments.toggleClass('hidden');
		if(!$users.hasClass('hidden'))
			$users.addClass('hidden');
	};
	
	Topics.doShowUsers = function(el){
		var $post = $(el).parentsUntil('.ticket','.post');
		var $users = $('div[gpid="users_list_container"]', $post);
		var $comments = $('div[gpid="comment_list_container"]', $post);
		$users.toggleClass('hidden');
		if(!$comments.hasClass('hidden'))
			$comments.addClass('hidden');
	};
	
	Topics.doSaveComment = function(el){
		var $post = $(el).parentsUntil('.ticket','.post');
		var $comment = $(el).parent().siblings('[gpid="comment-txt"]');
		$.ajax({
			url: "../workgroup/save-comment.do",
			dataType : "json",
			type: 'POST',
			data: {
				"post-id" : $post.attr('data-post-id'),
				"comment" : $comment.val()
			},
			success: function(response)
			{
				 GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
	};
	
	Topics.doDeleteComment = function(el){
		
	};
	
	Topics.doPublicPost = function(el){
		var $post = $(el).parentsUntil('.ticket','.post');
		$.ajax({
			url: "../workgroup/public-post.do",
			dataType : "json",
			type: 'POST',
			data: {
				"post-id" : $post.attr('data-post-id')
			},
			success: function(response)
			{
				 GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
	};
	
	Topics.doLikePost = function(el){
		var $post = $(el).parentsUntil('.ticket','.avatar-info');
		$.ajax({
			url: "../workgroup/like-post.do",
			dataType : "json",
			type: 'POST',
			data: {
				"post-id" : $post.attr('data-post-id')
			},
			success: function(response)
			{
				$(el).tooltip('hide');
				GPContext.AppendResult(response, (response.state == "success") ? false : true);

			}
		});
	};
	
	Topics.doDislikePost = function(el){
		var $post = $(el).parentsUntil('.ticket','.avatar-info');
		$.ajax({
			url: "../workgroup/dislike-post.do",
			dataType : "json",
			type: 'POST',
			data: {
				"post-id" : $post.attr('data-post-id')
			},
			success: function(response)
			{
				$(el).tooltip('hide');
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
	};
	
	Topics.doFavoritePost = function(el){
		var $post = $(el).parentsUntil('.ticket','.post');
		$.ajax({
			url: "../workgroup/favorite-post.do",
			dataType : "json",
			type: 'POST',
			data: {
				"post-id" : $post.attr('data-post-id')
			},
			success: function(response)
			{
				$(el).tooltip('hide');
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
	};
	
	Topics.doUnfavoritePost = function(el){
		var $post = $(el).parentsUntil('.ticket','.post');
		$.ajax({
			url: "../workgroup/unfavorite-post.do",
			dataType : "json",
			type: 'POST',
			data: {
				"post-id" : $post.attr('data-post-id')
			},
			success: function(response)
			{
				$(el).tooltip('hide');
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
	};
	
	Topics.doRemovePost = function(el){
		var $post = $(el).parentsUntil('.ticket','.post');
		$.ajax({
			url: "../workgroup/remove-post.do",
			dataType : "json",
			type: 'POST',
			data: {
				"post-id" : $post.attr('data-post-id')
			},
			success: function(response)
			{
				$(el).tooltip('hide');
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
	};
	
	Topics.doSwitchPostContent = function(el){
		var $post = $(el).parentsUntil('.ticket','.post');
		var $post_content = $('div.post-content', $post);
		var $content_holder = $('textarea[gpid="content-holder"]', $post);
		var holderType = $content_holder.attr('data-type'); // to be : content or excerpt .
		if(holderType == 'content'){
			var excerpt = $post_content.html();
			$post_content.html($content_holder.val());
			$content_holder.val(excerpt);// save excerpt to content dom
			$content_holder.attr('data-type','excerpt');
		}else{
			var whole = $post_content.html();
			$post_content.html($content_holder.val());
			$content_holder.val(whole);// save excerpt to content dom
			$content_holder.attr('data-type','content');
		}
		$(el).tooltip('hide');
	};

	Topics.doUserLiteShow = function(el){
		var $avatar=$(el);
	    $avatar.off('hover');
	    var popurl = "../common/user-profile-lite.do?account="+$avatar.data('account');
	    $.get(popurl,function(d) {
	        $avatar.popover({content: d,html: true}).popover('show');
	    });
	};

	Topics.doUserLiteHide = function(el){
		var $avatar=$(el);
		$avatar.popover('hide');
		
	};

	Topics.doWGroupLiteShow = function(el){
		var $grp_name=$(el);
	    $grp_name.off('hover');
	    var popurl = "../common/wgroup-profile-lite.do?wgroup_id="+$grp_name.data('wgroup-id');
	    $.get(popurl,function(d) {
	        $grp_name.popover({content: d,html: true}).popover('show');
	    });
	};

	Topics.doWGroupLiteHide = function(el){
		var $grp_name=$(el);
		$grp_name.popover('hide');
	};

	Topics.initial();
	
	return {
		"WGroupLiteShow" : $.proxy(Topics.doWGroupLiteShow, Topics),
		"WGroupLiteHide" : $.proxy(Topics.doWGroupLiteHide, Topics),
		"UserLiteShow" : $.proxy(Topics.doUserLiteShow, Topics),
		"UserLiteHide" : $.proxy(Topics.doUserLiteHide, Topics),
		"ShowComments" : $.proxy(Topics.doShowComments, Topics),
		"ShowUsers" : $.proxy(Topics.doShowUsers, Topics),
		"SaveComment" : $.proxy(Topics.doSaveComment, Topics),
		"DeleteComment" : $.proxy(Topics.doDeleteComment, Topics),
		"PublicPost" : $.proxy(Topics.doPublicPost, Topics),
		"RemovePost" : $.proxy(Topics.doRemovePost, Topics),
		"LikePost" : $.proxy(Topics.doLikePost, Topics),
		"DislikePost" : $.proxy(Topics.doDislikePost, Topics),
		"FavoritePost" : $.proxy(Topics.doFavoritePost, Topics),
		"UnfavoritePost" : $.proxy(Topics.doUnfavoritePost, Topics),
		"SwitchPostContent" : $.proxy(Topics.doSwitchPostContent, Topics)
	};
	
})(jQuery, window);