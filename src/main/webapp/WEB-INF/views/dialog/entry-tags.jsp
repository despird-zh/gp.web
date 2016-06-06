<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<div class="modal fade" id="entry-tags-modal" tabindex="-1" role="dialog" aria-labelledby="new-file-modal-label"><!-- tag edit modal -->
	<div class="modal-dialog" role="document" style="width:650px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="select-user-modal-label">Entry tags edit</h4>
			</div>
			<div class="modal-body clearfix">
				<div class="row">
					<div class="col-md-2">									
						<span>分类一</span>						
					</div>
					<div class="col-md-10">
						<p class="tags xsmall m-b-none">
							<a href="javascript:void(0)" class="tag-blue tag-point-yellow" data-tag-name="表现l3">
								<i class="fa fa-check-square-o"></i>&nbsp;表现l3
							</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-green" data-tag-name="表现l2"><i class="fa fa-square-o"></i>&nbsp;表现l2</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-red" data-tag-name="表现l1"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-red" data-tag-name="表现l1"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-red" data-tag-name="表现l1"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
						</p>
					</div>
				</div>
				<hr class="m-t-xs m-b-xs">
				<div class="row">
					<div class="col-md-2">									
						<span>分类一</span> 									
					</div>
					<div class="col-md-10">
						<p class="tags xsmall m-b-none">
							<a title="" href="" class="tag-default tag-point-">表现l3</a>
							<a title="" href="" class="tag-default tag-point-green">表现l2</a>
							<a title="" href="" class="tag-default tag-point-red">表现l1</a>
							<a title="" href="" class="tag-default tag-point-red">表现l1</a>
							<a title="" href="" class="tag-default tag-point-red">表现l1</a>
							<a title="" href="" class="tag-default tag-point-red">表现l1</a>
							<a title="" href="" class="tag-default tag-point-red">表现l1</a>
							<a title="" href="" class="tag-default tag-point-red">表现l1</a>
							<a title="" href="" class="tag-default tag-point-red">表现l1</a>
							<a title="" href="" class="tag-default tag-point-red">表现l1</a>
							<a title="" href="" class="tag-default tag-point-red">表现l1</a>
							<a title="" href="" class="tag-default tag-point-red">表现l1</a>
							<a title="" href="" class="tag-default tag-point-red">表现l1</a>
						</p>
					</div>
				</div>
				<hr class="m-t-xs m-b-xs">
			</div>
			<div class="modal-footer">
				<input type="hidden" gpid="entry-id">
				<input type="hidden" gpid="entry-type">
				<button type="button" gpid="save-tags-btn" class="btn btn-primary pull-left" >Save</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div><!-- tag edit modal -->
<!-- key=category / value=set of tag -->
<script id="entry-tags-template" type="x-tmpl-mustache">
{{#data}}
	<div class="row">
		<div class="col-md-2">									
			<span>{{key}}</span>						
		</div>
		<div class="col-md-10">
			<p class="tags xsmall m-b-none">
				{{#value}}
				<a href="javascript:void(0)" class="tag-blue tag-point-{{tagColor}}" data-tag-name="{{tagName}}">
					<i class="fa fa-check-square-o"></i> &nbsp;{{tagName}}
				</a>
				{{/value}}
			</p>
		</div>
	</div>
	<hr class="m-t-xs m-b-xs">
{{/data}}
</script><!-- /#entry-tags-template-->
<script type="text/javascript">
var EditTagContext = (function ($, window, undefined) {
	
	"use strict";
	var EntryTagsModal = {
		$entry_id : $('#entry-tags-modal input[gpid="entry-id"]'),
		$entry_type : $('#entry-tags-modal input[gpid="entry-type"]'),
		$entry_tags_modal : $('#entry-tags-modal'),
		$tag_a : $('#entry-tags-modal p.tags > a'),
		$tags_save_btn : $('#entry-tags-modal button[gpid="save-tags-btn"]'),
		// tag change
		edit_tags : {},
		initial : function(){
			
			var _self = this;
			_self.$tag_a.on('click', $.proxy(_self.checkTag, _self));
			_self.$tags_save_btn.on('click', $.proxy(_self.saveTags, _self));
		}
	};
	
	/**
	 * collect the tag operations : { "tag1" : "attach", "tag2" : "detach"} 
     */
	EntryTagsModal.checkTag = function(evt){
		
		var _self = EntryTagsModal;
		// this is the elment of a
		var $tag_check = $(evt.target).find('i');
		var tagname = $(evt.target).attr('data-tag-name');
		if($tag_check.hasClass('fa-check-square-o')){
			$tag_check.removeClass('fa-check-square-o').addClass('fa-square-o');
			_self.edit_tags[tagname] = "detach";
		}else{
			$tag_check.removeClass('fa-square-o').addClass('fa-check-square-o');
			_self.edit_tags[tagname] = "attach";
		}
	};
	
	/*
	 * Save tag update 
	 */
	EntryTagsModal.saveTags = function(){
		
		$.ajax({
			url: "../cabinet/tag-update.do",
			dataType : "json",
			type: 'POST',
			data: { 
					"entry_id" : _self.$entry_id.val(),
					"entry_type" : _self.$entry_type.val(),
					"tag_ops" : JSON.stringify(_self.edit_tags)
				},
			success: function(response)
			{	
				console.log(response);
				GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
	};
	
	EntryTagsModal.showEntryTagsEdit = function(entryId, entryType){
		
		var _self = this;
		_self.$entry_id.val(entryId);
		_self.$entry_type.val(entryType);
		_self.$entry_tags_modal.modal('show');
	};
	
	EntryTagsModal.initial();

	GPContext.editEntryTags = function(entryId, entryType){
		EntryTagsModal.showEntryTagsEdit(entryId, entryType);
	};

})(jQuery, window);
</script>