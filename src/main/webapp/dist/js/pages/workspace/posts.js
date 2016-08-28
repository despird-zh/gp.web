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
		var $comments = $('div[gpid="comment_list_container"]', $post);
		$comments.toggleClass('hidden');
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
	
	Topics.initial();
	
	return {
		"ShowComments" : $.proxy(Topics.doShowComments, Topics),
		"SaveComment" : $.proxy(Topics.doSaveComment, Topics),
		"DeleteComment" : $.proxy(Topics.doDeleteComment, Topics),
		"PublicPost" : $.proxy(Topics.doPublicPost, Topics)
	};
})(jQuery, window);