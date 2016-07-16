;

var WorkspaceMetaContext = (function ($, window, undefined){

	"use strict";
	
	var WorkspaceMetaLet = {
		
		$wspace_account : $('#meta-wspace-account'),
		$wspace_avatar : $('div[gpid="meta-sum"] img[gpid="wspace-avatar"]'),
		$wspace_username : $('div[gpid="meta-sum"] a[gpid="wspace-username"]'),
		$wspace_since : $('div[gpid="meta-sum"] span[gpid="wspace-since"]'),
		
		$wspace_show_more : $('div[gpid="meta-info"] a[gpid="wspace-show-more"]'),
		$wspace_more_info : $('div[gpid="meta-info"] div[gpid="info-content"]'),
		
		$wspace_task_sum : $('div[gpid="meta-sum"] a[gpid="wspace-task-sum"] '),
		$wspace_file_sum : $('div[gpid="meta-sum"] a[gpid="wspace-file-sum"] '),
		$wspace_post_sum : $('div[gpid="meta-sum"] a[gpid="wspace-post-sum"] '),
		$wspace_share_sum : $('div[gpid="meta-sum"] a[gpid="wspace-share-sum"] '),
		$wspace_signature : $('div[gpid="meta-info"] p[gpid="wspace-signature"] '),
		$wspace_badges : $('div[gpid="meta-info"] p[gpid="wspace-badges"] '),
		$wspace_org_route : $('div[gpid="meta-info"] div[gpid="wspace-org-route"] '),
		_org_route_tmpl : $('#org-route-tmpl').html()
	};
	
	WorkspaceMetaLet.initial = function(){
		
		var _self = this;
		_self.$wspace_show_more.on('click', function(){
			var $icon = $('i', _self.$wspace_show_more);
			if($icon.hasClass('fa-angle-double-up')){
				$icon.removeClass('fa-angle-double-up')
					.addClass('fa-angle-double-down');
			}else{
				$icon.removeClass('fa-angle-double-down')
					.addClass('fa-angle-double-up');
			}
			_self.$wspace_more_info.toggleClass('hidden');
			
		});
		
		Mustache.parse(_self._org_route_tmpl);
	};
	
	WorkspaceMetaLet.loadMetaSum = function(){
		var _self = this;
        $.ajax({
            url: "../workspace/meta-sum.do",
            dataType : "json",
            type: 'POST',
            data: { 
                    "account" : _self.$wspace_account.val()
                },
            success: function(response)
            {   
                GPContext.AppendResult(response, (response.state == "success") ? false : true);
				var data = response.data;
				_self.$wspace_avatar.attr('src', data.imagePath);
				_self.$wspace_username.html(data.name);
				_self.$wspace_since.html(data.sinceDate);
				_self.$wspace_share_sum.html(data.shareSum);
				_self.$wspace_task_sum.html(data.taskSum);
				_self.$wspace_file_sum.html(data.fileSum);
				_self.$wspace_post_sum.html(data.postSum);
				_self.$wspace_signature.html(data.signature);
				_self.$wspace_badges.html(data.badges);
				
				var output = Mustache.render(_self._org_route_tmpl, response.data.treeNodes);
				_self.$wspace_org_route.html(output);
				_self.$wspace_avatar.attr('src', data.imagePath);
            }
        });
    };

	WorkspaceMetaLet.initial();
    WorkspaceMetaLet.loadMetaSum();

	return {
		
	}
})(jQuery, window);