;
var PageContext = (function ($, window, undefined){

	"use strict";
	var SquareGrids = {
		
		$filter_wgroup_name : $('input[gpid="list-search-wgroup-name"]'),
		$filter_search_btn : $('a[gpid="list-search-btn"]'),
		$filter_clear_btn : $('a[gpid="list-clear-btn"]'),
		
		$filter_switch_btn : $('section.content a[gpid="filter-switch-btn"]'),		
		$filter_panel : $('section.content div[gpid="wgroup-filter"]'),
		$gallery_container : $('#gallery-container'),
		$grid_view_btn : $('a[gpid="grid-view-btn"]'),
		$list_view_btn : $('a[gpid="list-view-btn"]'),
		_waypoint : undefined,

		initial : function(){
			var _self = this;
			// bind switch filter panel button
			_self.$filter_switch_btn.on('click', function(){
				var _$self = $(this);
				SquareGrids.$filter_panel.toggleClass('hidden');
				if(SquareGrids.$filter_panel.hasClass('hidden')){
					
					_$self.find('i').removeClass('fa-angle-double-up').addClass('fa-angle-double-down');
				}else{
					_$self.find('i').removeClass('fa-angle-double-down').addClass('fa-angle-double-up');
				}
			});
			_self.$grid_view_btn.on('click', function(){
				SquareGrids.loadContent('GRID');
			});
			_self.$list_view_btn.on('click', function(){
				SquareGrids.loadContent('LIST');
			});
			// bind search button
			_self.$filter_search_btn.on('click', $.proxy(_self.search, _self));
			// bind clear button
			_self.$filter_clear_btn.on('click', $.proxy(_self.clear, _self));
			// initial the waypoint
			_self.loadContent('GRID');
		}
	};
	
	SquareGrids.loadContent = function(view_mode){
		
		var _self = this;
		_self.clear();
		var svr_url = "../square/all-grid-next.do";
		if(view_mode == 'LIST'){
			svr_url = "../square/all-list-next.do";
		}
		$.ajax({
			url: svr_url,
			dataType : "html",
			data: { 
					wgroup_name : _self.$filter_wgroup_name.val(),
					pageNumber : 1
				},
			method : 'POST',
			success: function(response)
			{	
				_self.$gallery_container.html($(response).html());
				if(view_mode == 'GRID'){
					_self.$infinite_list = $('div.infinite-container');
				}
				else{
					_self.$infinite_list = $('ul.infinite-container');
				}

				_self._waypoint = new Waypoint.Infinite({
					element: _self.$infinite_list,
					onAfterPageLoad : function($items){

					}
				});
			}
		});
	};

	SquareGrids.clear = function(){
		var _self = this;
		if(_self._waypoint != undefined){
			_self._waypoint.destroy();
		}
		_self.$gallery_container.empty();
	};
	
	SquareGrids.initial();
		
	return {
		
	};
})(jQuery, window);