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
		$setting_image : $('img[gpid="setting-avatar"]'),
		$setting_signature : $('#setting-signature'),

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
			
			// load the personal information into page
			_self.loadBasic();
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
					_self.$setting_signature.val(response.data.description);
				}
				GPContext.HideLoading();
				// load the storage information			
				StorageTab.loadStorage();
			}
		});
	};
	
	BasicTab.initial();
	
	var BelongTab = {
		
		$tab : $('#tab_2'),
		$belongs_tmpl : $('#belongs-tmpl'),
		$orghier_belongs : $('#orghier-belongs'),
		$wgroup_belongs : $('#workgroup-belongs'),
		
		initial: function(){
			var _self = this;
			Mustache.parse(_self.$belongs_tmpl.html());
			_self.loadBelongs();
			
		}
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