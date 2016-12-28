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
	
	var pvar = $('#versionlist').popover({
		html: true,
		placement: 'bottom',
		content: function () {
			
			return $(this).parent().find('.content').html();
		},
		template:'<div class="popover "><div class="arrow"></div><div class="popover-inner"><div class="popover-content" style="padding:0px;"><p></p></div></div></div>'
	});
	
	$('#informationlist').popover({
		html: true,
		placement: 'bottom',
		content: function () {
			
			return $(this).parent().find('.content').html();
		},
		template:'<div class="popover "><div class="arrow"></div><div class="popover-inner"><div class="popover-content" style="padding:0px;"><p></p></div></div></div>'
	});

	$("#privilege-list").slimscroll({
		height: "300px",
		alwaysVisible: true,
		size: "5px"
    });
	
	//iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
          checkboxClass: 'icheckbox_minimal-blue',
          radioClass: 'iradio_minimal-blue'
        });
		
	// 使popover失去焦点自动关闭
	$('body').on('click', function (e) {
		$('.popup-marker').each(function () {
			//the 'is' for buttons that trigger popups
			//the 'has' for icons within a button that triggers a popup
			if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
				$(this).popover('hide');
			}
		});
	});
});
