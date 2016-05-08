(function ($, window, undefined) {

	"use strict";
	
	var NetdiskPub = {

		$repo_list : $('div.repo-list ul.list-group'),
		$repo_item_template : $('#cabinet-item-template'),
		$filter_switch_btn : $('section.content a[gpid="filter-switch-btn"]'),
		
		$filter_panel : $('section.content div[gpid="wgroup-filter"]'),
		$show_comments_btn : $('section.content a[gpid="show-comments-btn"]'),
		$version_list_btn : $('section.content span[gpid=versionlist]'),
		$info_list_btn : $('section.content span[gpid=informationlist]'),
		$new_file : $('div.view-toolbar button[gpid=new-file-btn]'),
		$new_folder : $('div.view-toolbar button[gpid=new-folder-btn]'),
		
		initial : function () {
			var _self = this;
			_self.$filter_switch_btn.bind('click', function () {
				var _$self = $(this);
				NetdiskPub.$filter_panel.toggleClass('hidden');
				if (NetdiskPub.$filter_panel.hasClass('hidden')) {

					_$self.find('i').removeClass('fa-angle-double-up').addClass('fa-angle-double-down');
				} else {
					_$self.find('i').removeClass('fa-angle-double-down').addClass('fa-angle-double-up');
				}
			});
			
			_self.$show_comments_btn.bind('click', function(){
				var _$self_p = $(this).parent().parent().parent();
				_$self_p.find('div[gpid="comment-list-container"]').toggleClass('hidden');
			});
			
			_self.$new_file.bind('click', function(){
			
				GPContext.showNewFile();
			});
			
			_self.$new_folder.bind('click', function(){
			
				GPContext.showNewFolder();
			});
			
			_self.loadCabinetContent(3, 23);
		}
	};

	NetdiskPub.loadCabinetContent = function(cabinetid, folderid){
		
		$.ajax({
			url: "../workgroup/netdisk-pub-content.do",
			dataType : "json",
			type: 'POST',
			data: { 
					cabinet_id : cabinetid,
					folder_id : folderid
				},
			success: function(response)
			{	

				NetdiskPub.renderCabinetContent(response);
			}
		});
	};
	
	NetdiskPub.renderCabinetContent = function(rows_data){
		var _self = this;
		var template = _self.$repo_item_template.html();
		Mustache.parse(template);
		var rendered = Mustache.render(template, rows_data);
		_self.$repo_list.append(rendered);
		
		$('section.content span[gpid=versionlist]').popover({
			html : true,
			placement : 'bottom',
			content : function () {
				console.log($(this).parent().find('.content').html());
				return $(this).parent().find('.content').html();
				
			},
			template : '<div class="popover "><div class="arrow"></div><div class="popover-inner"><div class="popover-content" style="padding:0px;"><p></p></div></div></div>'
		});
			
		$('section.content span[gpid=informationlist]').popover({
			html : true,
			placement : 'bottom',
			content : function () {

				return $(this).parent().find('.content').html();
			},
			template : '<div class="popover "><div class="arrow"></div><div class="popover-inner"><div class="popover-content" style="padding:0px;"><p></p></div></div></div>'
		});
	};
	NetdiskPub.initial();

	$('body').on('click', function (e) {
		$('.popup-marker').each(function () {
			//the 'is' for buttons that trigger popups
			//the 'has' for icons within a button that triggers a popup
			if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
				$(this).popover('hide');
			}
		});
	});

})(jQuery, window);
