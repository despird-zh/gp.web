;
/*
 * Personal topics context 
 */
var PageContext = (function ($, window, undefined){

	"use strict";
	
	var Topics = {

		$post_container : $('#post-container'),
		$new_post_btn : $('button[gpid="new-post-btn"]'),
		
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
			url: "../workspace/posts-next.do",
			dataType : "html",
			type: 'POST',
			data: {
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
			url: "../workspace/save-comment.do",
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
			url: "../workspace/public-post.do",
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
			url: "../workspace/like-post.do",
			dataType : "json",
			type: 'POST',
			data: {
				"post-id" : $post.attr('data-post-id')
			},
			success: function(response)
			{
				if(response.state == 'success'){
					$post.find('span[gpid="upvoteCount"]').text(response.data);
				}
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
	};
	
	Topics.doDislikePost = function(el){
		var $post = $(el).parentsUntil('.ticket','.avatar-info');
		$.ajax({
			url: "../workspace/dislike-post.do",
			dataType : "json",
			type: 'POST',
			data: {
				"post-id" : $post.attr('data-post-id')
			},
			success: function(response)
			{
				if(response.state == 'success'){
					$post.find('span[gpid="upvoteCount"]').text(response.data);
				}
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
	};
	
	Topics.doFavoritePost = function(el){
		var $post = $(el).parentsUntil('.ticket','.post');
		$.ajax({
			url: "../workspace/favorite-post.do",
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
	
	Topics.doUnfavoritePost = function(el){
		var $post = $(el).parentsUntil('.ticket','.post');
		$.ajax({
			url: "../workspace/unfavorite-post.do",
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
	
	Topics.doRemovePost = function(el){
		var $post = $(el).parentsUntil('.ticket','.post');
		$.ajax({
			url: "../workspace/remove-post.do",
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
	
	Topics.initial();
	
	return {
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