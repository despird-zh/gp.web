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
	$('a[obid=info-mode-btn]').on('click', function () {
		var _$listview = $('div[obid=doc-list-view]');
		var _$itemview = $('div[obid=doc-item-view]');
		if( _$listview.hasClass('col-lg-8') ){
			
			_$listview.removeClass('col-lg-8').addClass('col-lg-12');
			
			_$itemview.css( "display",'none');
		}else{
			_$listview.removeClass('col-lg-12').addClass('col-lg-8');
			
			_$itemview.css( "display",'block');
		}
	});
	
	// make click on dropdown panel works
	$('li a[obid=folder-hier-btn]').on('click', function (event) {
		$(this).parent().toggleClass("open");
	});

	$('body').on('click', function (e) {
		if (!$('li a[obid=folder-hier-btn]').is(e.target) 
			&& $('li a[obid=folder-hier-btn]').has(e.target).length === 0 
			&& $('.open').has(e.target).length === 0) {
			$('li a[obid=folder-hier-btn]').parent().removeClass('open');
		}
	});
	// create scrollbar for folder hierarchy 
	$("div[obid=folder-hier-tree]").slimscroll({
      height: "300px",
      alwaysVisible: true,
      size: "5px"
    }).css("width", "100%");
	
	// create file directory tree panel
	$("div[obid=folder-hier-tree]").jstree({
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
	$("div[obid=folder-hier-tree]").on("select_node.jstree", function(e, t) {
            var a = $("#" + t.selected).find("a");
            return "#" != a.attr("href") && "javascript:;" != a.attr("href") && "" != a.attr("href") ? ("_blank" == a.attr("target") && (a.attr("href").target = "_blank"), document.location.href = a.attr("href"), !1) : void 0
        });
	
	$('div.collapse-group-view > div.collapse').on('shown.bs.collapse', function (evt) {
		var _this = this;
       $(this).parent().find("div.group-leader > a >i ").removeClass("fa-angle-double-right").addClass("fa-angle-double-down");
    });

    $('div.collapse-group-view > div.collapse').on('hidden.bs.collapse', function () {
		var _this = this;
       $(this).parent().find("div.group-leader > a >i ").removeClass("fa-angle-double-down").addClass("fa-angle-double-right");
    });

	// checkbox actiondiv[obid=doc-list-view] 
	$('div[obid=doc-list-view] .list-view-header span.chkbox').on('click', function(){
		
		var _$header_select = $('div[obid=doc-list-view] .list-view-header span.chkbox i');
		var _$item_select = $('div[obid=doc-list-view] .list-view-item span.chkbox i');
		if( _$header_select.hasClass('fa-square-o') ){
			_$header_select.removeClass("fa-square-o").addClass("fa-check-square-o");
			_$item_select.removeClass("fa-square-o").addClass("fa-check-square-o");
		}else{
			_$header_select.removeClass("fa-check-square-o").addClass("fa-square-o");
			_$item_select.removeClass("fa-check-square-o").addClass("fa-square-o");
		}
	});
	$('div[obid=doc-list-view] .list-view-item span.chkbox').on('click', function(evt){
		var _this = this;
		var _$item_select = $(_this).find('i');
		if( _$item_select.hasClass('fa-square-o') ){
			_$item_select.removeClass("fa-square-o").addClass("fa-check-square-o");
			
			var odata = $.AppContext.PrivateRepo.getItemData($(_this).parent('div'));
			$.AppContext.PrivateRepo.checkItem(odata);
			
		}else{
			
			_$item_select.removeClass("fa-check-square-o").addClass("fa-square-o");
			var odata = $.AppContext.PrivateRepo.getItemData($(_this).parent('div'));
			$.AppContext.PrivateRepo.uncheckItem(odata.docid);
		}
	});
});
