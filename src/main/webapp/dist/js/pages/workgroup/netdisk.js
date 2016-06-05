;
var PageContext = (function ($, window, undefined) {

	"use strict";
	
	var Netdisk = {

		$filter_switch_btn : $('section.content a[gpid="filter-switch-btn"]'),

		$filter_panel : $('section.content div[gpid="wgroup-filter"]'),
		$new_file : $('div.view-toolbar button[gpid=new-file-btn]'),
		$new_folder : $('div.view-toolbar button[gpid=new-folder-btn]'),
		
		$cabinet_container : $('#cabinet-container'),
		$wgroup_id : $('#workgroup-id'),
		$cabinet_id : $('#cabinet-id'),
		$folder_id : $('#folder-id'),
		$version_list : $('span[gpid="versionlist"]'),
		
		initial : function () {
			var _self = this;
			_self.$filter_switch_btn.bind('click', function () {
				var _$self = $(this);
				Netdisk.$filter_panel.toggleClass('hidden');
				if (Netdisk.$filter_panel.hasClass('hidden')) {

					_$self.find('i').removeClass('fa-angle-double-up').addClass('fa-angle-double-down');
				} else {
					_$self.find('i').removeClass('fa-angle-double-down').addClass('fa-angle-double-up');
				}
			});
						
			_self.$new_file.bind('click', function(){
			
				GPContext.showNewFile(function(){},Netdisk.$cabinet_id.val());
			});
			
			_self.$new_folder.bind('click', function(){
			
				GPContext.showNewFolder(function(){},Netdisk.$cabinet_id.val(),-98);
			});
			
			_self.loadWorkgroupMeta();
			
			_self.loadContent();
		}
	};

	Netdisk.loadWorkgroupMeta = function(){
		
		var _self = this;
		$.ajax({
			url: "../workgroup/meta-info.do",
			dataType : "json",
			type: 'POST',
			data: { 
					"wgroup_id" : _self.$wgroup_id.val()
				},
			success: function(response)
			{	
				console.log(response);
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
				
			}
		});
		$.ajax({
			url: "../workgroup/meta-summary.do",
			dataType : "json",
			type: 'POST',
			data: { 
					"wgroup_id" : _self.$wgroup_id.val()
				},
			success: function(response)
			{	
				console.log(response);
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
				
			}
		});
	};

	Netdisk.loadContent = function(){
		
		var _self = this;
		
		$.ajax({
			url: "../workgroup/netdisk-next.do",
			dataType : "html",
			type: 'POST',
			data: { 
					"cabinet_id" : _self.$cabinet_id.val(),
					"folder_id" : _self.$folder_id.val(),
					"pageNumber" : 1
				},
			success: function(response)
			{	
				_self.$cabinet_container.html($(response).html());
				_self.$infinite_list = $('ul.infinite-container');
				_self.setVersionPopover(_self.$infinite_list.find('span[gpid="versionlist"]'));
				_self._waypoint = new Waypoint.Infinite({
					element: _self.$infinite_list,
					onAfterPageLoad : function($items){
						
						_self.setVersionPopover($items.find('span[gpid="versionlist"]'));
					}
				});
			}
		});
	};
	
	$('a[gpid="show-comments-btn"]').bind('click', function(){
		var _$self_p = $(this).parent().parent().parent();
		_$self_p.find('div[gpid="comment-list-container"]').toggleClass('hidden');
	});
	

	$('#informationlist').popover({
		html : true,
		placement : 'bottom',
		content : function () {
			return $(this).parent().find('.content').html();
		},
		template : '<div class="popover "><div class="arrow"></div><div class="popover-inner"><div class="popover-content" style="padding:0px;"><p></p></div></div></div>'
	});

	$('body').on('click', function (e) {
		$('.popup-marker').each(function () {
			//the 'is' for buttons that trigger popups
			//the 'has' for icons within a button that triggers a popup
			if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
				$(this).popover('hide');
			}
		});
	});
	
	/*
	 * setup popover with property buttons
	 */
	Netdisk.setPropertyPopover = function($els){
		var _self = this;
		$els.popover({
			"html": true,
			"content": function(){
				var div_id =  "tmp-id-" + $.now(),
					_item_id = $(this).closest('div.repo-item').attr('data-item-id'),
					_item_type = $(this).closest('div.repo-item').attr('data-item-type');
				return _self.popoverContent("../cabinet/entry-properties.do?entry_id=" + _item_id + '&entry_type=' + _item_type , div_id);
			},
			placement : 'bottom',
			template : '<div class="popover "><div class="arrow"></div><div class="popover-inner"><div class="popover-content p-xs" ></div></div></div>'
		});

	};
	
	/*
	 * setup popover with version buttons
	 */
	Netdisk.setVersionPopover = function($els){
		var _self = this;
		$els.popover({
			"html": true,
			"content": function(){
				var div_id =  "tmp-id-" + $.now(),
					_file_id = $(this).closest('div.repo-item').attr('data-item-id');
				return _self.popoverContent("../cabinet/file-versions.do?file_id="+_file_id, div_id);
			},
			placement : 'bottom',
			template : '<div class="popover "><div class="arrow"></div><div class="popover-inner"><div class="popover-content p-xs" ></div></div></div>'
		});

	};
	/*
	 * Render the popover with remote content in asyc mode.
	 */
	Netdisk.popoverContent = function(content_link, div_id){
		$.ajax({
			url: content_link,
			success: function(response){
				$('#'+div_id).html(response);
			}
		});
		return '<div style="width: 250px;" id="'+ div_id +'">Loading...</div>';
	}

	Netdisk.initial();

	return {
		
	};
})(jQuery, window);
