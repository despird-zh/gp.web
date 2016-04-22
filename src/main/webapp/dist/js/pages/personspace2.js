/*
 * Author: Abdullah A Almsaeed
 * Date: 4 Jan 2014
 * Description:
 *      This is a demo file used only for the main dashboard (index.html)
 **/
$.AppContext = {};
// prepare the necessary data
$(document).ready(function() {
	//Initialize Select2 Elements
    $(".select2").select2();
	// create scrollbar for comment_list
	$("div[obid=comment_list]").slimscroll({
      height: "200px",
      alwaysVisible: true,
      size: "5px"
    });
		// create scrollbar for comment_list
	$("div[obid=users_list]").slimscroll({
      height: "150px",
      alwaysVisible: true,
      size: "5px"
    });
	// comments bind action
	$("a[obid=comments_show_btn]").bind("click",function(event){
		
		var _$this = $(this);
		var _$commentlistcontainer = _$this.parents(".ticket").find("div[obid=comment_list_container]");
		_$commentlistcontainer.toggle();
		/*var _$commentlist = _$this.parents(".ticket").find("div[obid=comment_list]");
		if(_$commentlist.parent("div.slimScrollDiv")){
			_$commentlist.parent("div.slimScrollDiv").toggle();
		} else {
			_$commentlist.toggle();
		}*/
		
	});
	
		// comments bind action
	$("a[obid=users_show_btn]").bind("click",function(event){
		
		var _$this = $(this);
		var _$userslistcontainer = _$this.parents(".ticket").find("div[obid=users_list_container]");
		_$userslistcontainer.toggle();
		/*var _$commentlist = _$this.parents(".ticket").find("div[obid=comment_list]");
		if(_$commentlist.parent("div.slimScrollDiv")){
			_$commentlist.parent("div.slimScrollDiv").toggle();
		} else {
			_$commentlist.toggle();
		}*/
		
	});
	
	// create scrollbar for ticket inline doc list
	$("div.inline-docs .doc-items").slimscroll({
      height: "100px",
      alwaysVisible: true,
      size: "5px"
    });
	
	$("ul[obid=docs_list] .doc-items").slimscroll({
      height: "100px",
      alwaysVisible: true,
      size: "5px"
    });
	
	/** user info button */
	$("button[obid=user_info_btn]").bind("click",function(event){
		
		$("div[obid=user_about_info]").toggle();
	});
	// 使popover失去焦点自动关闭
	$('body').on('click', function (e) {
		$('[data-toggle=popover]').each(function () {
			// hide any open popovers when the anywhere else in the body is clicked
			if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
				$(this).popover('hide');
			}
		});
	});
});
