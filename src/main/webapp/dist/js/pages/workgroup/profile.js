;

var WorkgroupProfileContext = (function ($, window, undefined){

	"use strict";

	var BasicTab = {
		
		$tab : $('#tab_1'),
		$workgroup_id : $('#wrokgroup-id'), // the id of workgroup
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
			// load the workgroup information into page
			_self.loadWorkgroup();
		}
	};
	
	BasicTab.loadWorkgroup = function(){
		var _self = this;
		$.ajax({
			url: '../workgroup/workgroup-info.do',
			dataType : "json",
			data: { "wgroup_id" : _self.$workgroup_id.val()} ,
			method : "POST",
			success: function(response)
			{	
				if('success' != response.state)
					GPContext.appendResult(response, true);
				else{
					GPContext.appendResult(response, false);
					var wg_data = response.data;
					_self.$workgroup_id.val(wg_data.workgroupId);
					_self.$workgroup_name.val(wg_data.workgroupName);				
					_self.$workgroup_state.val(wg_data.state).trigger('change');
					_self.$workgroup_admin.val(wg_data.admin);
					_self.$workgroup_org_id.val(wg_data.orgId);
					_self.$workgroup_org_name.val(wg_data.orgName);
					_self.$workgroup_descr.val(wg_data.description);				
					var dft_opt = '<option value="' + wg_data.storageId + '" selected>' + wg_data.storageName + '</option>';
					_self.$workgroup_storage.append(dft_opt).trigger('change');
					_self.$workgroup_publish.prop("checked",wg_data.publishOn).uniform.update();
					_self.$workgroup_netdisk.prop("checked",wg_data.netdiskOn).uniform.update();
					_self.$workgroup_publish_capacity.val(wg_data.publishCapacity);
					_self.$workgroup_netdisk_capacity.val(wg_data.netdiskCapacity);
					_self.$workgroup_topic.prop("checked",wg_data.topicOn).uniform.update();
					_self.$workgroup_share.prop("checked",wg_data.shareOn).uniform.update();
					_self.$workgroup_link.prop("checked",wg_data.linkOn).uniform.update();
					_self.$workgroup_task.prop("checked",wg_data.taskOn).uniform.update();
					_self.$workgroup_weight.val(wg_data.taskWeight);
					_self.$workgroup_image[0].src=wg_data.imagePath;
				}
			}
		});
	};
	
	BasicTab.initial();
	
	var HierTab = {
		$topic_in_parent : $('input[gpid="topic-in-parent"]'),
		initial : function(){
			var _self = this;
			_self.$topic_in_parent.uniform();
		}
	};
	
	HierTab.initial();
	
	var MembersTab = {
		$workgroup_id : $('#wrokgroup-id'), // the id of workgroup
		$infinite_list : $('#members-container'),
		
		initial : function(){
			var _self = this;
			//_self.search();
		}
	};
	
	MembersTab.search = function(force){
		
		var _self = this;
		if( !force && _self._waypoint != undefined){
			// the inifinite scroll initialized. 
			return;
		}
		$.ajax({
			url: "../workgroup/members-next.do",
			dataType : "html",
			data: { 
					wgroup_id : _self.$workgroup_id.val(),
					pageNumber : 1
				},
			method : 'GET',
			success: function(response)
			{	
				$('#member-row').html(response);
				
				_self.$infinite_list = $('#members-container');
				
				_self._waypoint = new Waypoint.Infinite({
					element: _self.$infinite_list
				});
			}
		});
	};
	
	MembersTab.initial();
	
	var ActLogTab = {
		$workgroup_id : $('#wrokgroup-id'), // the id of workgroup
		$infinite_list : $('#actlogs-container'),
		initial : function(){
			var _self = this;
			//_self.search(false);
		}
	};
	
	ActLogTab.search = function(force){

		var _self = this;
		if( !force && _self._waypoint != undefined){
			// the inifinite scroll initialized. 
			return;
		}
		$.ajax({
			url: "../workgroup/actlogs-next.do",
			dataType : "html",
			data: { 
					wgroup_id : _self.$workgroup_id.val(),
					pageNumber : 1
				},
			method : 'GET',
			success: function(response)
			{	
				
				$('#actlog-row').html(response);
				
				_self.$infinite_list = $('#actlogs-container');
				_self._waypoint = new Waypoint.Infinite({
					element: _self.$infinite_list,
					items : '.infinite-actlog-item',
					more : '.infinite-more-actlog-link'
				});
			}
		});
	};
	
	ActLogTab.initial();
	
	
	$('a.tab-marker').on('shown.bs.tab', function (e) {
		
		if($(e.target).attr('href') == '#tab_4'){
			// let the act log tab waypoint.infinite initialized only once.
			ActLogTab.search(false);
		}
		if($(e.target).attr('href') == '#tab_3'){
			// let the act log tab waypoint.infinite initialized only once.
			MembersTab.search(false);
		}
	});
	
	return {
		
	}
})(jQuery, window);