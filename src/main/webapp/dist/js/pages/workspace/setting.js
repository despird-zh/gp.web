;
var PersonSettingContext = (function ($, window, undefined){

	"use strict";
	
	var accountData = {};
	
	var BasicTab = {
		
		$tab : $('#tab_1'),
		$setting_uid : $('#setting-uid'), // the id of workgroup
		$setting_account : $('#tab_1 p[gpid="setting-account"]'),
		$setting_name : $('#setting-name'),
		$setting_type : $('#setting-type'),
		$setting_state : $('#setting-state'),
		$setting_email : $('#setting-email'),
		$setting_mobile : $('#setting-mobile'),
		$setting_phone : $('#setting-phone'),
		$setting_avatar: $('#setting-avatar'),
		$setting_signature : $('#setting-signature'),
		$setting_save_btn : $('#tab_1 a[gpid="save-basic-btn"]'),
		
		initial : function(){
			var _self = this;
			_self.$tab.find('input[type="checkbox"]').uniform();
			_self.$setting_type.select2({
				minimumResultsForSearch: -1, //hide the search box
				width : '150px'
			});
			_self.$setting_state.select2({
				minimumResultsForSearch: -1, //hide the search box
				width : '150px'
			});
			_self.$setting_avatar.on('click', function(){
				GPContext.showChangeAvatar($(this));
			});
			// load the personal information into page
			_self.loadBasic();
			_self.$setting_save_btn.on('click', $.proxy(_self.saveBasic, _self));
		}
	};
	
	BasicTab.loadBasic = function(){
		var _self = this;
		
		GPContext.ShowLoading();
		$.ajax({
			url: "../workspace/basic-setting.do",
			dataType : "json",
			type: 'POST',
			success: function(response)
			{	
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
				accountData = response.data;
				if(response.state == "success"){
					_self.$setting_uid.val(response.data.userId);
					_self.$setting_account.text(response.data.account);
					_self.$setting_name.val(response.data.name);
					_self.$setting_type.val(response.data.type);
					_self.$setting_state.val(response.data.state);
					_self.$setting_email.val(response.data.email);
					_self.$setting_mobile.val(response.data.mobile);
					_self.$setting_phone.val(response.data.phone);
					_self.$setting_signature.val(response.data.signature);
				}
				GPContext.HideLoading();
				// load the storage information			
				StorageTab.loadStorage();
			}
		});
	};
	BasicTab.saveBasic = function(){
		var _self = this;
		GPContext.ShowLoading();
		$.ajax({
			url: "../workspace/save-basic-setting.do",
			dataType : "json",
			data : {
				"userId" : _self.$setting_uid.val(),
				"name" : _self.$setting_name.val(),
				"type" : _self.$setting_type.val(),
				"state" : _self.$setting_state.val(),
				"email" : _self.$setting_email.val(),
				"mobile" : _self.$setting_mobile.val(),
				"phone" : _self.$setting_phone.val(),
				"signature" : _self.$setting_signature.val(),
				"imagePath" : _self.$setting_avatar.attr('src')
			},
			type: 'POST',
			success: function(response)
			{	
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
				GPContext.HideLoading();
			}
		});
	};
	BasicTab.initial();
	
	var BelongTab = {
		
		$tab : $('#tab_2'),
		$belongs_tmpl : $('#belongs-tmpl'),
		$orghier_belongs : $('#orghier-belongs'),
		$wgroup_belongs : $('#workgroup-belongs'),
		$save_org_belongs : $('#tab_2 a[gpid="save-org-belongs-btn"]'),
		$save_wgroup_belongs : $('#tab_2 a[gpid="save-wgroup-belongs-btn"]'),
		
		initial: function(){
			var _self = this;
			Mustache.parse(_self.$belongs_tmpl.html());
			_self.loadBelongs();
			_self.$save_org_belongs.on('click', $.proxy(_self.saveOrgBelongs, _self));
			_self.$save_wgroup_belongs.on('click', $.proxy(_self.saveWGrpBelongs, _self));
		}
	};
	// save org node notify setting
	BelongTab.saveOrgBelongs = function(){
		
		var _self = this;
		var $orgs = $('input:checkbox[data-belong-type="org"]',_self.$tab);
		var org_setting = new Array();
		$.each($orgs, function(index, curr){
			console.log();
			org_setting.push({
				"belongId" : $(curr).attr('data-belong-id'),
				"postVisible" : $(curr).prop("checked")
			});
		});
		$.ajax({
			url: "../workspace/save-belong-setting.do",
			dataType : "json",
			type : 'POST',
			data : {"setting_json" : JSON.stringify(org_setting),"belong_type" : "org"},
			success: function(response)
			{	
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
		
	};
	// save work group notify setting
	BelongTab.saveWGrpBelongs = function(){
		
		var _self = this;
		var $orgs = $('input:checkbox[data-belong-type="wgroup"]',_self.$tab);
		var org_setting = new Array();
		$.each($orgs, function(index, curr){
			console.log();
			org_setting.push({
				"belongId" : $(curr).attr('data-belong-id'),
				"postVisible" : $(curr).prop("checked")
			});
		});
		$.ajax({
			url: "../workspace/save-belong-setting.do",
			dataType : "json",
			type : 'POST',
			data : {"setting_json" : JSON.stringify(org_setting),"belong_type" : "wgroup"},
			success: function(response)
			{	
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
		
	};
	
	BelongTab.loadBelongs = function(){
		var _self = this;
		$.ajax({
			url: "../workspace/belongings.do",
			dataType : "json",
			type: 'POST',
			success: function(response)
			{	
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
				var output = Mustache.render(_self.$belongs_tmpl.html(), response.data.orghiers);
				_self.$orghier_belongs.html(output);
				output = Mustache.render(_self.$belongs_tmpl.html(), response.data.workgroups);
				_self.$wgroup_belongs.html(output);
				$(':checkbox', _self.$tab).uniform();
			}
		});
	};
	
	BelongTab.initial();
	
	var StorageTab = {
		
		$tab : $('#tab_3'),
		$storage : $('#setting-storage'),
		$publish_capacity : $('#setting-publish-capacity'),
		$netdisk_capacity : $('#setting-netdisk-capacity'),
		$language : $('#setting-language'),
		$timezone : $('#setting-timezone'),
		
		initial : function(){
			var _self = this;
			
			_self.$storage.select2({
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
			  width : 200,
			  placeholder: { id: "", text : "Select a storage"}		 
			});

			_self.$language.select2({
				minimumResultsForSearch: -1, //hide the search box
				width : 150
			});
			
			_self.$timezone.select2({
				minimumResultsForSearch: -1, //hide the search box
				width : 150
			});

		}
	};
	
	StorageTab.loadStorage = function(){
		var _self = this;
		var dft_opt = '<option value="' + accountData.storageId + '" selected>' + accountData.storageName + '</option>';
		_self.$storage.append(dft_opt).trigger('change');
		
		_self.$language.val(accountData.language);
		_self.$language.trigger('change');
		_self.$timezone.val(accountData.timezone);
		_self.$timezone.trigger('change');
		_self.$publish_capacity.val(accountData.pubcapacity);
		_self.$netdisk_capacity.val(accountData.pricapacity);
		
	};
	
	StorageTab.initial();
	
	var ChangePwdTab = {
		
		$tab : $('#tab_4'),
		$new_pwd : $('#new-pwd'),
		$confirm_pwd : $('#confirm-pwd'),
		$origin_pwd : $('#origin-pwd'),
		$save_btn : $('#tab_4 a[gpid="change-pwd-btn"]'),
		initial : function(){
			var _self = this;
			_self.$save_btn.on('click', $.proxy( _self.changePwd, _self));
		}
	};
	
	ChangePwdTab.changePwd = function(){
		var _self = this;
		
		GPContext.ShowLoading();
		$.ajax({
			url: "../workspace/change-pwd.do",
			dataType : "json",
			type: 'POST',
			data : {
				"new-password" : _self.$new_pwd.val(),
				"confirm-password" : _self.$confirm_pwd.val(),
				"origin-password" : _self.$origin_pwd.val()
			},
			success: function(response)
			{	
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
				GPContext.HideLoading();
			}
		});
	};
	ChangePwdTab.initial();
	
	return {
		
	}
	
})(jQuery, window);