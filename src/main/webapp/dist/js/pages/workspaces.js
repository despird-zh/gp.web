/*
 * Author: Abdullah A Almsaeed
 * Date: 4 Jan 2014
 * Description:
 *      This is a demo file used only for the main dashboard (index.html)
 **/
$.AppContext = {};
// prepare the necessary data
$(function () {
	
	var _pageContext = $.AppContext.PrivateRepo = {		
		checked_items : { count : 0},
		curr_path : "/"
	};
	
	_pageContext.checkItem = function(itemdata){
		_pageContext.checked_items[itemdata.docid] = itemdata;
		_pageContext.checked_items.count++;
	};
	
	_pageContext.uncheckItem = function(docid){
		delete _pageContext.checked_items[docid]; 
		_pageContext.checked_items.count--;
	};
	
	_pageContext.getItemData = function(_$el){
		var oid = _$el.attr('odata-id');
		var ofolder = _$el.attr('odata-isfoler') == 'true' ? true:false;
		var opath = _$el.attr('odata-path');
		return {"docid":oid, "isfolder":ofolder, "path": opath};
	}
});
$(function () {

  "use strict";
	
	// create scrollbar for folder hierarchy 
	$("div[obid=workspace-hier-tree]").slimscroll({
      height: "300px",
      alwaysVisible: true,
      size: "5px"
    }).css("width", "100%");
	// create file directory tree panel
	$("div[obid=workspace-hier-tree]").jstree({
            core: {
                themes: {
                    responsive: !1
                }
            },
            types: {
                "default": {
                    icon: "fa fa-folder text-warning fa-lg"
                },
                file: {
                    icon: "fa fa-file text-inverse fa-lg"
                }
            },
            plugins: ["types"]
        });
	$("div[obid=workspace-hier-tree]").on("select_node.jstree", function(e, t) {
            var a = $("#" + t.selected).find("a");
            return "#" != a.attr("href") && "javascript:;" != a.attr("href") && "" != a.attr("href") ? ("_blank" == a.attr("target") && (a.attr("href").target = "_blank"), document.location.href = a.attr("href"), !1) : void 0
        });
	


});
