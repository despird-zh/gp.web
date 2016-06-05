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
				<input type="hidden" gpid="entry-id">
				<input type="hidden" gpid="entry-type">
				<div class="row">
					<div class="col-md-2">									
						<span>分类一</span> 									
					</div>
					<div class="col-md-10">
						<p class="tags xsmall m-b-none">
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-yellow" data-tag-id="12"><i class="fa fa-check-square-o"></i>&nbsp;表现l3</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-green"><i class="fa fa-square-o"></i>&nbsp;表现l2</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
							<a href="javascript:void(0)" onclick="EditTagContext.checkTag(this)" class="tag-blue tag-point-red"><i class="fa fa-square-o"></i>&nbsp;表现l1</a>
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
				<button type="button" gpid="upload-clear-btn" class="btn btn-default pull-left" >Clear</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div><!-- tag edit modal -->
<script type="text/javascript">
var EditTagContext = (function ($, window, undefined) {
	
	"use strict";
	var EntryTagsModal = {
		$entry_id : $('#entry-tags-modal input[gpid="entry-id"]'),
		$entry_type : $('#entry-tags-modal input[gpid="entry-type"]'),
		$entry_tags_modal : $('#entry-tags-modal'),
		$tag_a : $('#entry-tags-modal p.tags > a'),
		initial : function(){
			
			var _self = this;
			
		}
	};
	
	EntryTagsModal.checkTag = function(tagel){
		
		var $tag_check = $(tagel).find('i');
		if($tag_check.hasClass('fa-check-square-o')){
			$tag_check.removeClass('fa-check-square-o').addClass('fa-square-o');
		}else{
			$tag_check.removeClass('fa-square-o').addClass('fa-check-square-o');
		}
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
	
	return {
		"checkTag" : EntryTagsModal.checkTag
	};
})(jQuery, window);
</script>