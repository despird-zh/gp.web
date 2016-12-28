/*
 * Author: Abdullah A Almsaeed
 * Date: 4 Jan 2014
 * Description:
 *      This is a demo file used only for the main dashboard (index.html)
 **/

$(function () {

  "use strict";

  	$("ul[obid=docs_list] .doc-items").slimscroll({
      height: "100px",
      alwaysVisible: true,
      size: "5px"
    });
	
	//DONUT CHART
	if($("#sales-chart").length){
        var donut = new Morris.Donut({
          element: 'sales-chart',
          resize: true,
          colors: ["#3c8dbc", "#f56954", "#00a65a"],
          data: [
            {label: "Download Sales", value: 12},
            {label: "In-Store Sales", value: 30},
            {label: "Mail-Order Sales", value: 20}
          ],
          hideHover: 'auto'
        });
	}
	$("#rate1").rating({	
		"stars" :5,
		"min":0,
		"max":5,
		"step":0.5,
		"size":"xs",
		"showClear":false,
		"starCaptions":function(val) {
			if (val <= 2) {
				return 'Low: ' + val + ' 不同意';			
			} else if (val <= 4) {
				return 'Low: ' + val + ' 同意保留意见';			
			} else {
				return 'High: ' + val + ' 完全同意';
			}
		}
	});
});
