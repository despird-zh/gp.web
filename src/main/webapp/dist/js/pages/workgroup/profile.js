;

var WorkgroupProfileContext = (function ($, window, undefined){

	"use strict";
	var BasicTab = {
		
		$tab : $('#tab_1'),
		$workgroup_name : $('#workgroup-name'),
		$workgroup_state : $('#workgroup-state-sel'),
		$workgroup_admin : $('#workgroup-admin'),
		$workgroup_org_id : $('#workgroup-org-id'),
		$workgroup_org_name : $('#workgroup-org-name'),
		$workgroup_descr : $('#workgroup-description'),
		$workgroup_storage : $('#workgroup-storage-id'),
		$workgroup_image : $('img[gpid="workgroup-avatar"]'),
		
		$workgroup_publish : $('#workgroup-publish-enable'),
		$workgroup_publish_capacity : $('#workgroup-publish-capacity'),
		
		$workgroup_netdisk : $('#workgroup-netdisk-enable'),
		$workgroup_netdisk_capacity : $('#workgroup-netdisk-capacity'),
		
		$workgroup_topic : $('#workgroup-topic-enable'),
		$workgroup_share : $('#workgroup-share-enable'),
		$workgroup_link : $('#workgroup-link-enable'),
		$workgroup_task : $('#workgroup-task-enable'),
		$workgroup_weight : $('#workgroup-task-weight'),

		initial : function(){
			var _self = this;
			_self.$tab.find('input[type="checkbox"]').uniform();
_self.$workgroup_state.select2({
				minimumResultsForSearch: -1, //hide the search box
				width : '150px'
			});
			
			_self.$workgroup_storage.select2({
			  ajax: {
				url: "../common/storage-list.do",
				dataType: 'json',
				delay: 250,
				data: function (params) {
				  return {
					storage_name: params.term, // search term
					pageNumber: params.page,
					pageSize : 10
				  };
				},
				processResults: function (data, params) {
				  params.page = params.page || 1;
				   
				   for(var i = 0; i < data.items.length; i++){
					   data.items[i].id= data.items[i].key;
					   data.items[i].text = data.items[i].value;
				   }
				  return {
					results: data.items,
					pagination: {
					  more: (params.page * 10) < data.total_count
					}
				  };
				},
				cache: true
			  },
			  minimumInputLength: 0,
			  placeholder: { id: "", text : "Select a storage"}
			});
		}
	};
	
	BasicTab.initial();
	
	return {
		
	}
})(jQuery, window);