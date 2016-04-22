;(function ($, window, undefined){

	"use strict";
	var WorkgroupsGrid = {
		
		$filter_switch_btn : $('section.content a[gpid="filter-switch-btn"]'),
		
		$filter_panel : $('section.content div[gpid="wgroup-filter"]'),
		
		initial : function(){
			var _self = this;
			_self.$filter_switch_btn.bind('click', function(){
				var _$self = $(this);
				WorkgroupsGrid.$filter_panel.toggleClass('hidden');
				if(WorkgroupsGrid.$filter_panel.hasClass('hidden')){
					
					_$self.find('i').removeClass('fa-angle-double-up').addClass('fa-angle-double-down');
				}else{
					_$self.find('i').removeClass('fa-angle-double-down').addClass('fa-angle-double-up');
				}
			});
		}
	};
	
	WorkgroupsGrid.initial();
	
})(jQuery, window);