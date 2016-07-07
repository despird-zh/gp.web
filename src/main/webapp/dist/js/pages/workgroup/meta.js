;

var WorkgroupMetaContext = (function ($, window, undefined){

	"use strict";
	
	var WorkgroupMetaLet = {
		$wgroup_id : $('#meta-wgroup-id')
	};
	
	WorkgroupMetaLet.loadMetaSum = function(){
		var _self = this;
        $.ajax({
            url: "../workgroup/meta-sum.do",
            dataType : "json",
            type: 'POST',
            data: { 
                    "wgroup_id" : _self.$wgroup_id.val()
                },
            success: function(response)
            {   
                console.log(response);
                GPContext.AppendResult(response, (response.state == "success") ? false : true);
            }
        });
    };

    WorkgroupMetaLet.loadMetaSum();

	return {
		
	}
})(jQuery, window);