;(function ($, window, undefined){

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
			url: "../workgroup/posts-next.do",
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
	
	Topics.initial();
	
	return {

	};
	
})(jQuery, window);