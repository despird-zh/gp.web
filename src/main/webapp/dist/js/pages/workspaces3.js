/*
 * Author: Abdullah A Almsaeed
 * Date: 4 Jan 2014
 * Description:
 *      This is a demo file used only for the main dashboard (index.html)
 **/
$.AppContext = {};
// prepare the necessary data

$(document).ready(function() {
	// create scrollbar for folder hierarchy 
	$("div.inline-docs .doc-items").slimscroll({
      height: "100px",
      alwaysVisible: true,
      size: "3px"
    });
});

