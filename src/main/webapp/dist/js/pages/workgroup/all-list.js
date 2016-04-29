;
var PageContext = (function ($, window, undefined){

	"use strict";
	var WorkgroupsList = {
		
		$filter_wgroup_name : $('input[gpid="list-search-wgroup-name"]'),
		$filter_search_btn : $('a[gpid="list-search-btn"]'),
		$filter_clear_btn : $('a[gpid="list-clear-btn"]'),
		
		$filter_switch_btn : $('section.content a[gpid="filter-switch-btn"]'),		
		$filter_panel : $('section.content div[gpid="wgroup-filter"]'),
		$infinite_list : $('#list-container'),
		
		_waypoint : undefined,
		
		initial : function(){
			var _self = this;
			_self.$filter_switch_btn.on('click', function(){
				var _$self = $(this);
				WorkgroupsList.$filter_panel.toggleClass('hidden');
				if(WorkgroupsList.$filter_panel.hasClass('hidden')){
					
					_$self.find('i').removeClass('fa-angle-double-up').addClass('fa-angle-double-down');
				}else{
					_$self.find('i').removeClass('fa-angle-double-down').addClass('fa-angle-double-up');
				}
			});
			// bind search button
			_self.$filter_search_btn.on('click', $.proxy(_self.search, _self));
			// bind clear button
			_self.$filter_clear_btn.on('click', $.proxy(_self.clear, _self));
			console.log(_self.$infinite_list);
			// initial the waypoint
			_self._waypoint = new Waypoint.Infinite({
				element: _self.$infinite_list
			});
		}
	};
		
	WorkgroupsList.search = function(){
		
		var _self = this;
		_self.clear();
		$.ajax({
			url: "../workgroup/all-list-next.do",
			dataType : "html",
			data: { 
					wgroup_name : encodeURI(encodeURI(_self.$filter_wgroup_name.val())),
					pageNumber : 1
				},
			method : 'GET',
			success: function(response)
			{	
				_self.$infinite_list.html(response);
				_self._waypoint = new Waypoint.Infinite({
					element: _self.$infinite_list
				});
			}
		});
	};
	
	WorkgroupsList.clear = function(){
		var _self = this;
		if(_self._waypoint != undefined){
			_self._waypoint.destroy();
		}
		_self.$infinite_list.empty();
	};
	
	WorkgroupsList.initial();
	
	return {};
})(jQuery, window);