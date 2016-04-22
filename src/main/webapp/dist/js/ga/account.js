/*! 
 * Copyright (c) 2014-2015 Gary diao
 */
;var PageContext = (function ($, window, undefined){

	"use strict";
	// declare name space.
	var AccountList = {

		current_page : 1,
		$search_user : $('input[gpid="list-search-user"]'), 
		$search_enode : $('.select2[gpid=list-search-enode]'),
		$search_state : $('.select2[gpid=list-search-state]'),
		$search_type : $('.select2[gpid=list-search-type]'),
		
		$search_btn : $('a[gpid="list-search-btn"]'), 
		$clear_btn : $('a[gpid="list-clear-btn"]'), 
		$table : $('table[gpid="list-table"]'),  
		
		$new_account_btn : $('a[gpid="new-account-btn"]'),
		$new_extern_btn : $('a[gpid="new-extern-btn"]'),
		
		// declare initialize function, to bind event.
		initial : function(){
			var _self = this;
			_self.$search_btn.bind("click",function(event){
				AccountList.search(1);
			});
			_self.$clear_btn.bind("click",function(event){
				AccountList.clear();
			});
			
			_self.$search_type.select2({
				minimumResultsForSearch: -1, //hide the search box
				width:'100px'
			});

			_self.$search_state.select2({
				minimumResultsForSearch: -1, //hide the search box
				width:'100px'
			});
			
			// initial select2 element
			_self.$search_enode.select2({
			  ajax: {
				url: "../common/entity-list.do",
				dataType: 'json',
				delay: 250,
				data: function (params) {
				  return {
					instance_name: params.term, // search term
					pageNumber: params.page,
					pageSize : 10,
					all_option : true
				  };
				},
				processResults: function (data, params) {
				  // parse the results into the format expected by Select2
				  // since we are using custom formatting functions we do not need to
				  // alter the remote JSON data, except to indicate that infinite
				  // scrolling can be used
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
			  escapeMarkup: function (markup) { return markup; },
			  minimumInputLength: 0,
			  placeholder: { id: "", text : "Select a entity node"},
			  width : '150px'
			});
			
			_self.$new_account_btn.bind('click', function(){
				
				$('a[gpid="new-tab"]').parents('li').removeClass('hidden');
				$('a[gpid="new-tab"]').tab('show');
				AccountNew.clearAccount();
			});
			
			_self.$new_extern_btn.bind('click', function(){
				
				$('a[gpid="ext-tab"]').parents('li').removeClass('hidden');
				$('a[gpid="ext-tab"]').tab('show');
			});
			
			_self.initDataTables();
		}
	};

			
	AccountList.initDataTables = function(){
		var _self = this;
        // begin first table
        _self.$table.dataTable({			
            // Internationalisation. For more info refer to http://datatables.net/manual/i18n
            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "No data available in table",
                "info": "Showing _START_ to _END_ of _TOTAL_ records",
                "infoEmpty": "No records found",
                "infoFiltered": "(filtered1 from _MAX_ total records)",
                "lengthMenu": "Show _MENU_",
                "search": "Filter:",
                "zeroRecords": "No matching records found",
                "paginate": {
                    "previous":"Prev",
                    "next": "Next",
                    "last": "Last",
                    "first": "First"
                }
            },
            "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.
			"autoWidth" : false,
            "lengthMenu": [
                [5, 10, 20, -1],
                [5, 10, 20, "All"] // change per page values here
            ],
            // set the initial value
            "pageLength": 5,            
            "pagingType": "bootstrap_full_number",
            "order": [
                [0, "asc"]
            ], // set first column as a default sort by asc
	
            "columnDefs": [
				{
				 "targets":[3] ,
				 'searchable': false,
				 'orderable': false,
				 'className': 'dt-body-center',
				 'render': function (data, type, full, meta){
						 if(data == 'INLINE'){
							return '<span class="label label-primary">'+data+'</span>';
						 }else if(data == 'LDAP'){
							return '<span class="label label-success">'+data+'</span>';
						 }else{
							return '<span class="label label-info">'+data+'</span>';
						 }
					 }
				 },		
				{
				 "targets":[4] ,
				 'searchable': false,
				 'orderable': false,
				 'className': 'dt-body-center',
				 'render': function (data, type, full, meta){
						 if(data == 'ACTIVE'){
							return '<span class="label label-primary">'+data+'</span>';
						 }else if(data == 'DEACTIVE'){
							return '<span class="label label-success">'+data+'</span>';
						 }else{
							return '<span class="label label-warning">'+data+'</span>';
						 }
					 }
				 },					 
				{"targets":7,
				 'searchable': false,
				 'orderable': false,
				 'render': function (data, type, full, meta){
					 return '<div class="btn-group">' +
					 '<button data-user-id="'+data+'" class="btn btn-primary btn-xs" onclick="javascript:PageContext.LoadAccount(this);"><i class="fa fa-edit"></i></button>'+
					 '<button data-user-id="'+data+'" class="btn btn-primary btn-xs" onclick="javascript:PageContext.RemoveAccount(this);"><i class="fa fa-close"></i></button>'+
					 '</div>';
				 },
				 'width' : 50
				}
            ],

			"columns" : [
				{ data : 'account'},
				{ data : 'email'},
				{ data : 'mobile'},
				{ data : 'type'},
				{ data : 'state'},
				{ data : 'sourceName'},
				{ data : 'createDate'},
				{ data : 'uid'}
			]
			
        });
	};
	/*
	 * search the account list 
	 * parameter - pageindex index of expected page.
	 */
	AccountList.search = function(){
		
		var _self = this;
		
		$.ajax({
			url: "../ga/account-search.do",
			dataType : "json",
			data: { 
					uname : _self.$search_user.val(),
					instance_id : _self.$search_enode.val(),
					type : _self.$search_type.val(),
					state : _self.$search_state.val()
				},
			success: function(response)
			{					  
				_self.$table.dataTable().api().clear();
				_self.$table.dataTable().api().rows.add(response.rows).draw();				  
			}
		});
	};
	
	/*
	 * clear the content of search result
	 */
	AccountList.clear = function(){
		var _self = this;
		_self.$table.dataTable().api().clear().draw();
	};
	
	AccountList.removeAccount = function(e){
	
		var userid = $(e).attr('data-user-id');
		$.ajax({
			url: "../ga/account-delete.do",
			dataType : "json",
			data: {
				user_id : userid
			},
			success: function(response)
			{	
				GPContext.appendResult(response, true);  
			}
		});
	};
	// run initialization 
	AccountList.initial();	
	
	var AccountEdit = {
		
		$item_uid : $('#edit-uid'),
		$item_account : $('#tab_2 p[gpid="edit-account"]'),
		$item_name : $('#edit-name'),
		$item_type : $('#edit-type'),
		$item_state : $('#edit-state'),
		$item_password : $('#edit-password'),
		$item_confirm : $('#edit-password-confirm'),
		$item_email : $('#edit-email'),
		$item_mobile : $('#edit-mobile'),
		$item_phone : $('#edit-phone'),
		$item_language : $('#edit-language'),
		$item_timezone : $('#edit-timezone'),
		$item_storage_sel : $('#edit-storage-sel'),
		$item_pub_capacity : $('#edit-pub-cap'),
		$item_pri_capacity : $('#edit-pri-cap'),
		
		$item_save_btn : $('a[gpid=edit-save-btn]'),

		// declare initialize function, to bind event.
		initial : function(){
			var _self = this;
			
			_self.$item_save_btn.bind("click", function(evt){			
				AccountEdit.saveAccount();				
			});
			
			_self.$item_type.select2({
				minimumResultsForSearch: -1, //hide the search box
			});
			_self.$item_state.select2({
				minimumResultsForSearch: -1, //hide the search box
			});
			_self.$item_language.select2({
				minimumResultsForSearch: -1, //hide the search box
				width : 150
			});
			_self.$item_timezone.select2({
				minimumResultsForSearch: -1, //hide the search box
				width : 150
			});
			
			_self.$item_storage_sel.select2({
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
	
	AccountEdit.getAccount = function(){
		var _self = this;
		return {
			uid : _self.$item_uid.val(),
			account : _self.$item_account.html(),
			name : _self.$item_name.val(),
			type : _self.$item_type.val(),
			state : _self.$item_state.val(),
			password : _self.$item_password.val(),
			confirm : _self.$item_confirm.val(),
			email : _self.$item_email.val(),
			mobile : _self.$item_mobile.val(),
			language : _self.$item_language.val(),
			timezone : _self.$item_timezone.val(),
			phone : _self.$item_phone.val(),
			storage : _self.$item_storage_sel.val(),
			pubcapacity: _self.$item_pub_capacity.val(),
			pricapacity: _self.$item_pri_capacity.val()
		};
	};
	
	AccountEdit.setAccount = function(item){
		var _self = this;
		
		_self.$item_uid.val(item.uid);
		_self.$item_account.html(item.account);
		_self.$item_name.val(item.name);

		_self.$item_type.val(item.type).trigger('change');
		_self.$item_state.val(item.state).trigger('change');

		_self.$item_email.val(item.email);
		_self.$item_mobile.val(item.mobile);
		_self.$item_phone.val(item.phone);	
		_self.$item_language.val(item.language).trigger('change');
		_self.$item_timezone.val(item.timezone).trigger('change');
		_self.$item_storage_sel.val(item.storage).trigger('change');
		_self.$item_pub_capacity.val(item.pubcapacity),
		_self.$item_pri_capacity.val(item.pricapacity)
	};
	
	AccountEdit.saveAccount = function(){
		var _self = this;
		var account_data = _self.getAccount();
		
		$.ajax({
			url: "../ga/account-update.do",
			dataType : "json",
			data: account_data,
			success: function(response)
			{	
				GPContext.appendResult(response, false);    
			}
		});
	};
	
	/*
	 * load the account data by account information
	 */
	AccountEdit.loadAccount = function(e){
		var _self = this;
		$('a[gpid="edit-tab"]').tab('show');
		var uid = $(e).attr('data-user-id');
		$.ajax({
			url: "../ga/account-info.do",
			dataType : "json",
			data: {
				'user_id' : uid,
				},
			success: function(response)
			{	
				_self.setAccount(response.data);
				// show message in header
				GPContext.appendResult(response, false);  
			}
		});
	};
	
	AccountEdit.initial();
	
	var AccountExt = {
		
		$search_cond : $('#tab_3 input[gpid="ext-search-cond"]'),
		$table : $('#tab_3 table[gpid="ext-list-table"]'),
		$search_btn : $('#tab_3 a[gpid="ext-search-btn"]'),
		$clear_btn : $('#tab_3 a[gpid="ext-clear-btn"]'),
		
		$ext_entity : $('#tab_3 span[gpid="ext-entity-p"]'),
		$ext_node : $('#tab_3 span[gpid="ext-node-p"]'),
		$ext_entity_name : $('#tab_3 p[gpid="ext-entity-name-p"]'),
		$ext_account : $('#tab_3 p[gpid="ext-account-p"]'),
		$ext_gbl_account : $('#ext-global-account'),
		$ext_name : $('#ext-name'),
		$ext_mobile : $('#tab_3 p[gpid="ext-mobile-p"]'),
		$ext_email : $('#tab_3 p[gpid="ext-email-p"]'),
		
		$close_btn : $('#tab_3 button[gpid="ext-close-btn"]'),
		$save_btn : $('#tab_3 button[gpid="ext-save-btn"]'),
		
		initial : function(){
			
			var _self = this;
			_self.$close_btn.bind('click', function(){				
				$('a[gpid="list-tab"]').tab('show');
				$('a[gpid="ext-tab"]').parents('li').addClass('hidden');
			});
			
			_self.$save_btn.bind('click', function(){				
				AccountExt.saveAccountExt();
			});
			
			_self.$search_btn.bind('click', function(){				
				AccountExt.search();
			});
			
			_self.$clear_btn.bind('click', function(){				
				AccountExt.$table.dataTable().api().clear().draw();
			});
			
			_self.initDataTables();
		}
	};
	
	AccountExt.initDataTables = function(){
		
		var _self = this;
		_self.$table.dataTable({			
            // Internationalisation. For more info refer to http://datatables.net/manual/i18n
            "language": {
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                },
                "emptyTable": "No data available in table",
                "info": "Showing _START_ to _END_ of _TOTAL_ records",
                "infoEmpty": "No records found",
                "infoFiltered": "(filtered1 from _MAX_ total records)",
                "lengthMenu": "Show _MENU_",
                "search": "Filter:",
                "zeroRecords": "No matching records found",
                "paginate": {
                    "previous":"Prev",
                    "next": "Next",
                    "last": "Last",
                    "first": "First"
                }
            },
            "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.
			"autoWidth" : false,
            "lengthMenu": [
                [5, 10, 20, -1],
                [5, 10, 20, "All"] // change per page values here
            ],
            // set the initial value
            "pageLength": 5,            
            "pagingType": "bootstrap_full_number",
            "order": [
                [0, "asc"]
            ], // set first column as a default sort by asc
	
            "columnDefs": [							 
				{"targets":4,
				 'searchable': false,
				 'orderable': false,
				 'render': function (data, type, full, meta){
					 return '<div class="btn-group">' +
					 '<button data-user-id="'+data+'" class="btn btn-primary btn-xs" onclick="javascript:PageContext.LoadAccountExt(this);"><i class="fa fa-edit"></i></button>'+
					 '</div>';
				 },
				 'width' : 30
				}
            ],

			"columns" : [
				{ data : 'account'},
				{ data : 'name'},
				{ data : 'mobile'},
				{ data : 'email'},
				{ data : 'account'},
			]
			
        });
	};
	
	AccountExt.loadAccountExt = function(e){
		var _self = this;
		var rdata = _self.$table.dataTable().api().row($(e).parents('tr')[0]).data();
		_self.$ext_entity.html(rdata.entity);
		_self.$ext_node.html(rdata.node);
		_self.$ext_entity_name.html(rdata.source);
		_self.$ext_account.html(rdata.account);
		_self.$ext_gbl_account.val(rdata.globalAccount);
		_self.$ext_name.val(rdata.name);
		_self.$ext_mobile.html(rdata.mobile);
		_self.$ext_email.html(rdata.email);
	};
	
	AccountExt.saveAccountExt = function(){
		
		var _self = this;

		$.ajax({
			url: "../ga/account-ext-new.do",
			dataType : "json",
			method : "POST",
			data: {
					entity : _self.$ext_entity.html(),
					node : _self.$ext_node.html(),
					account : _self.$ext_account.html(),
					globalAccount : _self.$ext_gbl_account.val(),
					name : _self.$ext_name.val(),
					email : _self.$ext_email.html(),
					mobile : _self.$ext_mobile.html(),
				},
			success: function(response)
			{	
				GPContext.appendResult(response, true);  
			}
		});
	};
	
	AccountExt.search = function(){
		var _self = this;
		var _scond = _self.$search_cond.val();
		$.ajax({
			url: "../ga/account-ext-search.do",
			dataType : "json",
			data: { 
					search_cond : _scond,
				},
			success: function(response)
			{	
				_self.$table.dataTable().api().clear();
				_self.$table.dataTable().api().rows.add(response.rows).draw();			  
			}
		});
	};
	
	AccountExt.initial();
	
	var AccountNew = {
		
		$item_account : $('#new-account'),
		$item_name : $('#new-name'),
		$item_type : $('#new-type'),
		$item_password : $('#new-password'),
		$item_confirm : $('#new-password-confirm'),
		$item_email : $('#new-email'),
		$item_mobile : $('#new-mobile'),
		$item_phone : $('#new-phone'),
		$item_language : $('#new-language'),
		$item_timezone : $('#new-timezone'),
		$item_storage_sel : $('#new-storage-sel'),
		$item_pub_capacity : $('#new-pub-cap'),
		$item_pri_capacity : $('#new-pri-cap'),
		
		$close_btn : $('#tab_4 button[gpid="new-close-btn"]'),
		$save_btn : $('#tab_4 button[gpid="new-save-btn"]'),
		
		initial : function(){
			
			var _self = this;
			_self.$save_btn.bind("click", function(evt){
				AccountNew.saveAccount();
			});
			
			_self.$item_type.select2({
				minimumResultsForSearch: -1, //hide the search box
			});
			_self.$item_language.select2({
				minimumResultsForSearch: -1, //hide the search box
				width : 150
			});
			_self.$item_timezone.select2({
				minimumResultsForSearch: -1, //hide the search box
				width : 150
			});
			
			_self.$item_storage_sel.select2({
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
			
			_self.$close_btn.bind('click', function(){				
				$('a[gpid="list-tab"]').tab('show');
				$('a[gpid="new-tab"]').parents('li').addClass('hidden');
			});
		}
	};
	
	AccountNew.getAccount = function(){
		var _self = this;
		return {
			account : _self.$item_account.val(),
			name : _self.$item_name.val(),
			type : _self.$item_type.val(),
			password : _self.$item_password.val(),
			confirm : _self.$item_confirm.val(),
			email : _self.$item_email.val(),
			mobile : _self.$item_mobile.val(),
			language : _self.$item_language.val(),
			timezone : _self.$item_timezone.val(),
			phone : _self.$item_phone.val(),
			storage : _self.$item_storage_sel.val(),
			pubcapacity: _self.$item_pub_capacity.val(),
			pricapacity: _self.$item_pri_capacity.val()
		};
	};
	
	AccountNew.clearAccount = function(){
		var _self = this;
		_self.$item_account.val('');
		_self.$item_name.val('');
		_self.$item_type.val('INLINE').trigger('click');
		_self.$item_password.val('');
		_self.$item_confirm.val('');
		_self.$item_email.val('');
		_self.$item_mobile.val('');
		_self.$item_language.val('zh_CN').trigger('click');
		_self.$item_timezone.val('GMT+08:00').trigger('click');
		_self.$item_phone.val('');
		_self.$item_storage_sel.val('').trigger('click');
		_self.$item_pub_capacity.val('0');
		_self.$item_pri_capacity.val('0');
		
	};
	
	AccountNew.saveAccount = function(){
		var _self = this;
		var account_data = _self.getAccount();
		
		$.ajax({
			url: "../ga/account-new.do",
			dataType : "json",
			data: account_data,
			method : "POST",
			success: function(response)
			{	
				GPContext.appendResult(response, true);    
			}
		});
	};
	
	AccountNew.initial();
	
	return {
		LoadAccount : function(e){AccountEdit.loadAccount(e);},
		RemoveAccount : function(e){AccountList.removeAccount(e);},
		LoadAccountExt : function(e){AccountExt.loadAccountExt(e);}
	};
})(jQuery, window);
