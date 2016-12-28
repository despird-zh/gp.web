/*
 * Author: Abdullah A Almsaeed
 * Date: 4 Jan 2014
 * Description:
 *      This is a demo file used only for the main dashboard (index.html)
 **/
$.AppContext = {};
// prepare the necessary data

$(function () {

	"use strict";
	$("ul[obid=docs_list] .doc-items").slimscroll({
		height: "100px",
		alwaysVisible: true,
		size: "5px"
    });
	
	$("div[obid=comment_list]").slimscroll({
      height: "200px",
      alwaysVisible: true,
      size: "5px"
    });
	
	$("a[obid=btn_show_comments]").click(function(){
		
		var _$this = $(this);
		var _$commentlistcontainer = _$this.parents(".repo-item").find("div[obid=comment_list_container]");
		_$commentlistcontainer.toggle();
	});

	$('#newsticker').newsTicker({
		row_height: 30,
		max_rows : 6,
		speed: 800,
		prevButton:  $('#prev-button'),
		nextButton:  $('#next-button'),
		stopButton:  $('#stop-button'),
		startButton: $('#start-button')
	});
	
});
