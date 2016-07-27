<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<style>

</style>
<div class="modal fade" id="new-post-modal" tabindex="-1" data-backdrop="false" aria-labelledby="new-post-modal-label"><!-- new post modal -->
  <div class="modal-dialog" style="width:650px;">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title">New Post</h4>
	  </div>
	  <div class="modal-body" style="overflow:hidden;">
		<div class=" box-form form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label" for="doc-name">Subject</label>
				<div class="col-sm-10">
					<input type="text" placeholder="Write subject" id="post-subject" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="doc-name">Content</label>

				<div class="col-sm-10" style="padding-top: 5px;">
					<div gpid="post-content" class="" placeholder="Content" 
						style="min-height:50px;max-height:200px;background:#ecf0f5;
						height:auto;overflow:auto; margin-bottom:5px;
						padding:5px;">
						what are you doing
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Type</label>
				<div class="col-sm-10">
					<label class="radio-inline">
						<input type="radio" gpid="post-private" name="post-type" checked="checked" value="private">Private
					</label>
					<label class="radio-inline">
						<input type="radio" gpid="post-public" name="post-type" value="public">Public
					</label>
				</div>
			</div>
			<div class="form-group" gpid="private-marker">
				<label class="col-sm-2 control-label">Attendee</label>
				<div class="col-sm-10">
					<select gpid="post-attendee" class="form-control select2" multiple="multiple" style="width: 95%;">
					</select>
				</div>
			</div>
			<div class="form-group hidden" gpid="public-marker">
				<label class="col-sm-2 control-label" >Scope</label>
				<div class="col-sm-4">
					<form>
					<label class="radio-inline">
						<input type="radio" name="post-scope" id="post-square" value="square"> Square
					</label>
					<label class="radio-inline">
						<input type="radio" name="post-scope" id="post-group" value="group"> Group
					</label>
					</form>
				</div>
				<label class="col-sm-2 control-label" >Comment</label>
				<div class="col-sm-4">
					<label class="checkbox-inline">
						<input type="checkbox" gpid="post-comment" value="accept">Accept Comments
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Priority</label>
				<div class="col-sm-4">
					<select class="form-control select2 input-sm" gpid="post-priority">
					  <option>Normal</option>
					  <option>Medium</option>
					  <option>Urgent</option>
					</select>
				</div>
				<label class="col-sm-2 control-label">Classification</label>
				<div class="col-sm-4">
					<select class="form-control select2 input-sm" gpid="post-classification">
						<option>Top Secret</option>
						<option>Secret</option>
						<option>Confidential</option>
						<option>Unqualified</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Files <span class="label label-primary">5</span></label>
				<div class="col-sm-10">
					<div>
						<select gpid="files-selector" class="form-control select2" data-placeholder="Select a File" style="width: 80%;">
						</select>
						<button type="button" class="btn btn-sm btn-primary">
							<i class="fa fa-envelope-o"></i>
						</button>
						<button type="button" gpid="show-more-btn" class="btn btn-sm btn-default">
							<i class="fa fa-align-left"></i>
						</button>
					</div>
					<ul id="file-list" class="list-group m-t-xs m-b-none hidden">
						<li class="list-group-item p-xxs">Free Domain Name Registration <a class="pull-right" role="button"><i class="fa fa-times"></i></a></li>
						<li class="list-group-item p-xxs">Free Window Space hosting</li>
						<li class="list-group-item p-xxs">Number of Images</li>
						<li class="list-group-item p-xxs">24*7 support</li>
						<li class="list-group-item p-xxs">Renewal cost per year</li>
					</ul>
				</div>
			</div>
		</div>
	  </div>
	  <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		<button gpid="post-save-btn" type="button" class="btn btn-primary">Save</button>
	  </div>
	</div>
  </div>
</div><!-- new post modal -->
<script src="${path_plugins}/summernote/summernote.js"></script>
<script type="text/javascript">
$(function (){
	"use strict";
	/*
	 * Common dialog to new post
	 */	
	var $modal = $('#new-post-modal');
	var NewPostModal = {

		$post_subject : $('#post-public', $modal),
		$post_pub_rdo : $('input[gpid="post-public"]', $modal),
		$post_pri_rdo : $('input[gpid="post-private"]', $modal),
		$post_content : $('div[gpid="post-content"]',$modal),
		$post_attendee : $('select[gpid="post-attendee"]', $modal),
		$post_square : $('#post-square', $modal),
		$post_group : $('#post-group', $modal),
		$post_comment : $('input[gpid="post-comment"]', $modal),
		$post_priority : $('select[gpid="post-priority"]', $modal),
		$post_classification : $('select[gpid="post-classification"]', $modal),
		$post_file_list : $('#file-list', $modal),
		$post_file_more : $('button[gpid="show-more-btn"]', $modal),
		$post_file_sel : $('select[gpid="files-selector"]', $modal),
		$save_btn : $('button[gpid="post-save-btn"]', $modal),
		
		/** summernote editor toolbar */
		_snote_bar : [
			//['style', ['style']],
			['font', ['bold', 'italic',  'underline', 'clear']],
			//['fontsize', ['fontsize']],
			//['fontname', ['fontname']],
			['para', ['ul', 'ol', 'paragraph']],
			['insert', ['picture']]
			//['view', ['fullscreen', 'codeview']]
			
		],
		initial : function(){
			var _self = this;
			_self.$post_content.summernote({
				"height" : 200,
				"focus" : true,
				"toolbar" : _self._snote_bar
			});

			_self.$post_pub_rdo.on('click', function(){
				$('div[gpid="public-marker"]').removeClass('hidden');
				$('div[gpid="private-marker"]').addClass('hidden');
			});

			_self.$post_pri_rdo.on('click', function(){
				$('div[gpid="public-marker"]').addClass('hidden');
				$('div[gpid="private-marker"]').removeClass('hidden');
			});

			_self.$post_priority.select2({
				minimumResultsForSearch: -1,
				dropdownParent: $modal
			});

			_self.$post_classification.select2({
				minimumResultsForSearch: -1,
				dropdownParent: $modal
			});

			_self.$post_attendee.select2({
				ajax: {
					url: "../common/workgroup-member-list.do",
					dataType: 'json',
					delay: 250,
					data: function (params) {
					  return {
					  	"wgroup_id" : 2,
						"user_name": params.term
					  };
					},
					processResults: function (data, params) {
				  		var _result = new Array();
					   	for(var i = 0; i < data.data.length; i++){
						   _result[i].id= data.data[i].account;
						   _result[i].text = data.data[i].name;
					   	}
					  	return {
							results: _result
					  	};
					},
					cache: true
			  	},
			  	minimumInputLength: 0,
			  	placeholder: { id: "", text : "Select Work group member"},
				dropdownParent: $modal
			});
				
			_self.$post_file_sel.select2({
				ajax: {
					url: "../common/workgroup-files.do",
					dataType: 'json',
					delay: 250,
					data: function (params) {
					  return {
					  	"wgroup_id" : 2,
						"file_name": params.term,
						"pageSize" : 10
					  };
					},
					processResults: function (data, params) {
						params.page = params.page || 1;
				  		var _result = new Array();
					   	for(var i = 0; i < data.data.length; i++){
						   _result[i].id= data.data[i].account;
						   _result[i].text = data.data[i].name;
					   	}
					  	return {
							results: _result,
							pagination: {
								more: (params.page * 10) < data.total_count
							}
					  	};
					},
					cache: true
			  	},
			  	minimumInputLength: 0,
			  	placeholder: { id: "", text : "Select Work group file"},
				dropdownParent: $modal
			});
			_self.$post_file_more.on('click', function(){
				_self.$post_file_list.toggleClass('hidden');
			});

			_self.$save_btn.on('click', $.proxy(_self.savePost, _self));
		}
	};
	
	NewPostModal.savePost = function(){
		var _self = this, _scope = "";

		if(_self.$post_pri_rdo.prop("checked")){
			_scope = "PRIVATE";
		}else{
			_scope = _self.$post_group.prop("checked")? "WGROUP" : "SQUARE";
		}
		$.ajax({
			url: "../workspace/post-save.do",
            dataType : "json",
            type: 'POST',
			data : {
				"content" : _self.$post_content.html(),
				"subject" : _self.$post_subject.val(),
				"scope" : _scope,
				"commentOn" : _self.$post_comment.prop('checked'),
				"type" : "DISCUSSION",
				"priority" : _self.$post_priority.val(),
				"classification" : _self.$post_classification.val(),
				"attachments" : []
			},
			success : function(response){

				GPContext.AppendResult(response, (response.state == "success") ? false : true);
			}
		});
	};


	NewPostModal.initial();
});
</script>