;

var WorkgroupMetaContext = (function ($, window, undefined){

	"use strict";
	
	var WorkgroupMetaLet = {
		$wgroup_id : $('#meta-wgroup-id'),
		$wgroup_avatar : $('div[gpid="meta-sum"] img[gpid="wgroup-avatar"]'),
		$wgroup_name : $('div[gpid="meta-sum"] h4[gpid="wgroup-name"]'),
		$wgroup_manager : $('div[gpid="meta-sum"] a[gpid="wgroup-manager"]'),
		$wgroup_mbr_sum : $('div[gpid="meta-sum"] a[gpid="wgroup-member-sum"] '),
		$wgroup_task_sum : $('div[gpid="meta-sum"] a[gpid="wgroup-task-sum"] '),
		$wgroup_file_sum : $('div[gpid="meta-sum"] a[gpid="wgroup-file-sum"] '),
		$wgroup_post_sum : $('div[gpid="meta-sum"] a[gpid="wgroup-post-sum"] '),
		$wgroup_descr : $('div[gpid="meta-info"] p[gpid="wgroup-descr"] '),
		$wgroup_tags : $('div[gpid="meta-info"] p[gpid="wgroup-tags"] '),
		$wgroup_org_route : $('div[gpid="meta-info"] p[gpid="wgroup-org-route"] '),
	};
	
	WorkgroupMetaLet.loadMetaSum = function(){
		var _self = this;
        $.ajax({
            url: "../workgroup/meta-sum.do",
            dataType : "json",
            type: 'POST',
            data: { 
                    "wgroup_id" : _self.$wgroup_id.val()
                },
            success: function(response)
            {   
                GPContext.AppendResult(response, (response.state == "success") ? false : true);
				var data = response.data;
				_self.$wgroup_avatar.attr('src', data.imagePath);
				_self.$wgroup_name.html(data.workgroupName);
				_self.$wgroup_manager.html(data.managerName);
				_self.$wgroup_mbr_sum.html(data.memberSum);
				_self.$wgroup_task_sum.html(data.taskSum);
				_self.$wgroup_file_sum.html(data.fileSum);
				_self.$wgroup_post_sum.html(data.postSum);
				_self.$wgroup_descr.html(data.description);
				_self.$wgroup_tags.html(data.tags);
				_self.$wgroup_org_route.html(data.workgroupName);
            }
        });
    };

    WorkgroupMetaLet.loadMetaSum();

	return {
		
	}
})(jQuery, window);