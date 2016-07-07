;

var WorkgroupMetaContext = (function ($, window, undefined){

	"use strict";
	
	var WorkgroupMetaLet = {
		$wgroup_admin : $('')
	};
	
	WorkgroupMetaLet.loadMetaSum = function(){
        $.ajax({
            url: "../workgroup/meta-sum.do",
            dataType : "json",
            type: 'POST',
            data: { 
                    "wgroup_id" : "${wgroup_id}"
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