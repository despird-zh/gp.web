;
var PersonSettingContext = (function ($, window, undefined){

	"use strict";

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
		
		$.ajax({
			url: "../personal/basic-setting.do",
			dataType : "json",
			type: 'POST',
			success: function(response)
			{	
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
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
			}
		});
	};
	BasicTab.initial();
	
	
	return {
		
	}
	
})(jQuery, window);