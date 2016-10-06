;
var PageContext = (function ($, window, undefined) {

	"use strict";
	
	var Flows = {

		$filter_switch_btn : $('section.content a[gpid="filter-switch-btn"]'),
		$filter_panel : $('section.content div[gpid="wgroup-filter"]'),
		$flow_tree_panel : $('section.content div[gpid="flow-tree-container"]'),

		initial : function () {
			var _self = this;
			_self.$filter_switch_btn.bind('click', function () {
				var _$self = $(this);
				Flows.$filter_panel.toggleClass('hidden');
				if (Flows.$filter_panel.hasClass('hidden')) {

					_$self.find('i').removeClass('fa-angle-double-up').addClass('fa-angle-double-down');
				} else {
					_$self.find('i').removeClass('fa-angle-double-down').addClass('fa-angle-double-up');
				}
			});

			/*_self.$flow_tree_panel.slimscroll({
				height: 200,
				width: 300,
			    axis: 'both'
			});*/
		}
	};

	Flows.initial();

	
})(jQuery, window);
