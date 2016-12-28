;(function ($, window, undefined){

	"use strict";
	var WorkgroupsHier = {
		
		$filter_switch_btn : $('section.content a[gpid="filter-switch-btn"]'),
		
		$filter_panel : $('section.content div[gpid="wgroup-filter"]'),
		$orghier_tree : $('div[gpid="workspace-hier-tree"]'),
		initial : function(){
			var _self = this;
			_self.$orghier_tree.jstree({
			'core' : {
			  'data' : {
				'url' : function (node) {
				  return node.id === '#' ?
					'../views/tree-roots.json' :
					'../views/tree-childs.json';
				},
				'data' : function (node) {
				  return { 'id' : node.id };
				}
			  }
			  },
			  "types" : {
				"default" : {
				  "icon" : "fa fa-briefcase"
				},
				"workgroup" : {
				  "icon" : "fa fa-group"
				}
			  },
			  "plugins" : ["types"]
			});
		}
	};
	
	WorkgroupsHier.initial();

})(jQuery, window);