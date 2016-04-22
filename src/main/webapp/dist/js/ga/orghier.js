;(function ($, window, undefined){
	"use strict";
	
	var OrgHierarchy = {
	
		operationmode : 'edit', // screen operation mode:new/edit
		$orghier_tree : $('#tab_1 div[gpid=org-hier-tree]'),
		$node_type : $('#node-type'),
		$node_parent_id : $('#node-parent-id'),
		$node_id : $('#node-id'),
		$node_name : $('#node-name'),
		$node_admin : $('#node-admin'),
		$node_manager : $('#node-manager'),
		$node_email : $('#node-email'),
		$node_description : $('#node-description'),
		$curr_node_name : $('#current-node-name'),
		
		$node_new_btn : $('a[gpid="new-node-btn"]'),
		$add_member_btn : $('a[gpid="add-member-btn"]'),
		$node_save_btn : $('#tab_1 a[gpid="node-save-btn"]'),
		$node_cancel_btn : $('#tab_1 a[gpid="node-cancel-btn"]'),
		
		$tab_switcher_btn : $('#page-tabs > ul a[data-toggle="tab"]'),
		
		initial : function(){
			var _self = this;
			_self.$node_type.select2({
				minimumResultsForSearch: -1, //hide the search box
			});
			// create scrollbar for folder hierarchy 
			_self.$orghier_tree.slimscroll({
				height: "350px",
				alwaysVisible: true,
				size: "5px"
			}).css("width", "100%");
			// create file directory tree panel
			_self.$orghier_tree.jstree({
					'core': {
						'themes': {
							responsive: !1
						},
						'data' : {
							'url' : '../common/org-nodes.do',
							'data' : function (node) {
							  return { 'org_id' : node.id };
							}
						}
					},
					'types': {
						"default": {
							'icon': "fa fa-folder text-warning fa-md"
						},
						'file': {
							'icon': "fa fa-file text-inverse fa-md"
						}
					},
					'plugins': ["types"]
				}).on('loaded.jstree', function() {
					// find the first node to be selected
					var nid = OrgHierarchy.$orghier_tree.find("ul li:first-child").attr('id');
					OrgHierarchy.$orghier_tree.jstree('select_node', nid);
			  });
				
			_self.$orghier_tree.on("select_node.jstree", function(e, treenode) {					
					OrgHierarchy.setOrgNode(treenode.node.original);
			});		
			
			
			_self.$node_save_btn.bind('click', function(){
				var nodedata = OrgHierarchy.getOrgNode();
				OrgHierarchy.saveOrgNode(nodedata);
			});
			
			_self.$node_new_btn.bind('click', function(){
				OrgHierarchy.operationmode = 'new';
				OrgHierarchy.$node_name.val('');
				OrgHierarchy.$node_admin.val('');
				OrgHierarchy.$node_manager.val('');
				OrgHierarchy.$node_email.val('');
				OrgHierarchy.$node_description.val('');
				OrgHierarchy.$node_type.prop('disabled', false);
				OrgHierarchy.$node_cancel_btn.attr('disabled', false);
			});
			
			_self.$node_cancel_btn.bind('click', function(){
				OrgHierarchy.operationmode = 'edit';
				var node = OrgHierarchy.$orghier_tree.jstree().get_top_selected(true);
				OrgHierarchy.$node_type.prop('disabled', true);
				OrgHierarchy.setOrgNode(node[0].original);
				OrgHierarchy.$node_cancel_btn.attr('disabled', true);
			});

			_self.$node_cancel_btn.attr('disabled', true);
			// control the button visibility
			_self.$tab_switcher_btn.on('shown.bs.tab', function (e) {

				OrgHierarchy.$add_member_btn.toggleClass('hide');
				OrgHierarchy.$node_new_btn.toggleClass('hide');
			});
		}
	};
				
	OrgHierarchy.setOrgNode = function(nodedata){
		var _self = this;
		if(_self.operationmode == 'edit'){
			_self.$node_name.val(nodedata.text);
			_self.$node_admin.val(nodedata.admin);
			_self.$node_manager.val(nodedata.manager);
			_self.$node_email.val(nodedata.email);
			_self.$node_description.val(nodedata.description);
		}
		_self.$node_parent_id.val(nodedata.parent);
		_self.$node_id.val(nodedata.id);
		OrgMembers.$org_node_id.val(nodedata.id);
		_self.$curr_node_name.html(nodedata.text);
		OrgMembers.$org_node_name.val(nodedata.text);
	}; 
	
	OrgHierarchy.getOrgNode = function(){
		var _self = this;
		var nodedata = {
			parent : _self.$node_parent_id.val(),
			id : _self.$node_id.val(),
			text : _self.$node_name.val(),
			admin : _self.$node_admin.val(),
			manager : _self.$node_manager.val(),
			email : _self.$node_email.val(),
			description : _self.$node_description.val(),
			nodetype : _self.$node_type.val()
		};
		if(_self.operationmode == 'new' && nodedata.nodetype == 'SIBLING'){
			nodedata.id = '';
		}else if(_self.operationmode == 'new' && nodedata.nodetype == 'CHILDREN'){			
			nodedata.parent = nodedata.id;
			nodedata.id = '';
		}
		return nodedata;
	}; 
	
	OrgHierarchy.saveOrgNode = function(nodedata){
		
		var svr_url, _self = this;
		if(_self.operationmode == 'edit'){
			svr_url = '../ga/orghier-save.do';
		}else{
			svr_url = '../ga/orghier-add.do';
		}
		
		$.ajax({
			url: svr_url,
			dataType : "json",
			data: nodedata,
			success: function(response)
			{	
				var currDate = new Date();
				var msgdata = {
						info : true,
						timeText : currDate.toLocaleTimeString(),
						messageText : response.message,
						detailMessages : response.detailmsgs
					};
					
				if(response.state != 'success'){
					msgdata.info = false;
					msgdata.error = true;
				}
				// show message
				$.GPContext.ErrMessage.append(msgdata, true);
				  
			}
		});
	};
	
	var OrgMembers = {
	
		$org_node_refresh_btn : $('#tab_2 a[gpid="orgmember-node-refresh-btn"]'),
		$org_node_id : $('#orgmember-node-id'),
		$org_node_name : $('#orgmember-node-name'),
		$table_body : $('#tab_2 table[gpid="orgmember-list"] > tbody'),
		$pagination : $('#tab_2 ul[gpid="orgmember-list-pagination"]'),
		
		$member_list_template : $('#member-list-template'),
		$add_member_btn : $('a[gpid="add-member-btn"]'),
		
		initial : function(){
			var _self = this;
			_self.$add_member_btn.bind('click', function(){
				$.GPContext.showSelectUser(
					OrgMembers.addMembers, 
					false
				);
			});
			
			_self.$org_node_refresh_btn.bind('click', function(){
				
				OrgMembers.search(1);
			});
		}
	};
	
	OrgMembers.search = function(pageindex){
		
		var _self = this;
		
		$.ajax({
			url: "../ga/orghier-member-search.do",
			dataType : "json",
			data: { 
					org_id : _self.$org_node_id.val(),
					pageNumber : pageindex,
					pageSize : 5
				},
			success: function(response)
			{	
				// rendering the pagination info
				$.GPContext.pagination(OrgMembers.$pagination, response.pagination, function(pageindex){
					OrgMembers.search(pageindex);
				});							  
				// rendering the table info
				OrgMembers.renderTable(response);				  
			}
		});
	};
	
	/*
	 * Render the table tr row information:{"rows" : [{},{}...]}
	 */
	OrgMembers.renderTable = function(rows_data){
		var _self = this;
		var template = _self.$member_list_template.html();
		Mustache.parse(template);
		var rendered = Mustache.render(template, rows_data);
		// console.log(rendered);
		_self.$table_body.html(rendered);
		// bind remove button
		_self.$table_body.find("button[gpid=member-remove-btn]").bind("click", function(){
			var $self = $(this);
			var account = $self.attr('user-account');
			OrgMembers.removeMembers(account);
		});
	};
	
	OrgMembers.addMembers = function(users_data){
		var _self = OrgMembers;
		$.ajax({
			url: '../ga/orghier-member-add.do',
			dataType : "json",
			data: { 
				org_id : _self.$org_node_id.val(),
				users : JSON.stringify(users_data)
				},
			success: function(response)
			{	
				var currDate = new Date();
				var msgdata = {
						info : true,
						timeText : currDate.toLocaleTimeString(),
						messageText : response.message,
						detailMessages : response.detailmsgs
					};
					
				if(response.state != 'success'){
					msgdata.info = false;
					msgdata.error = true;
				}
				// show message
				$.GPContext.ErrMessage.append(msgdata, true);
			}
		});
	};
	
	OrgMembers.removeMembers = function(user_account){
		var _self = OrgMembers;
		$.ajax({
			url: '../ga/orghier-member-remove.do',
			dataType : "json",
			data: { 
				'org_id' : _self.$org_node_id.val(),
				'account' : user_account
				},
			success: function(response)
			{	
				var currDate = new Date();
				var msgdata = {
						info : true,
						timeText : currDate.toLocaleTimeString(),
						messageText : response.message,
						detailMessages : response.detailmsgs
					};
					
				if(response.state != 'success'){
					msgdata.info = false;
					msgdata.error = true;
				}
				// show message
				$.GPContext.ErrMessage.append(msgdata, true);
			}
		});
	};
	OrgHierarchy.initial();
	OrgMembers.initial();
})(jQuery, window);