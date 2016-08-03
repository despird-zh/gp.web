;
/*
 * Personal topics context 
 */
var PageContext = (function ($, window, undefined){

	"use strict";
	
	var Topics = {
		
		$new_post_btn : $('button[gpid="new-post-btn"]'),
		
		initial : function(){
			var _self = this;
			_self.$new_post_btn.on('click', function(){

				GPContext.showNewPost();
			});
		}
	};
	
	Topics.initial();
	
})(jQuery, window);