<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<style>

</style>
<div class="modal fade" id="new-post-modal" tabindex="-1" role="dialog" aria-labelledby="new-post-modal-label"><!-- new post modal -->
  <div class="modal-dialog" role="document" style="width:650px;">
	<div class="modal-content">
	  <!--div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="new-post-modal-label">New Post</h4>
	  </div>
	  <div class="modal-body clearfix"-->
		<div class="nav-tabs-custom">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#post-base-info" data-toggle="tab">Post Info</a></li>							 
				<li ><a href="#post-ext-info" data-toggle="tab">Extra Info</a></li>		
				<li class="pull-right" style="margin-top: 10px; margin-right: 15px;"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="post-base-info">
				</div>
				<div class="tab-pane" id="post-ext-info">
				</div>
			</div>
		</div>
		<div class=" box-form form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label" for="doc-locked">documents</label>
				<div class="col-sm-9">
					<p class="form-control-static" style="padding-bottom: 7px;">Attached 3 files and 4 folders <span id="btn_more" class="label bg-blue">List <i class="fa  fa-angle-double-right"></i></span></p>
					<ul id="attachment-list" class="list-group" style="display:none;">
					  <li class="list-group-item">
							<span><i class="fa fa-fw fa-file"></i>First item</span>
							<a class="text-muted pull-right"><i class="fa fa-fw fa-times"></i></a>
					  </li>
					  <li class="list-group-item">Second item</li>
					  <li class="list-group-item">Third item</li>
					</ul>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="doc-name">Subject</label>
				<div class="col-sm-10">
					<input type="text" placeholder="Write subject" id="doc-name" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="doc-subject">public</label>
				<div class="col-sm-9" style="padding-top: 6px; padding-bottom: 2px;">
				  <label class="margin-r-5">
				  <input type="checkbox" class="minimal"> 公开
				  </label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="doc-subject">Comment</label>
				<div class="col-sm-9" style="padding-top: 6px; padding-bottom: 2px;">
				  <label class="margin-r-5">
				  <input type="radio" name="r1" class="minimal"> public and team
				  </label>
				  <label class="margin-r-5">
				  <input type="radio" name="r1" class="minimal"> team only
				  </label>
				  <label class="margin-r-5">
				  <input type="radio" name="r1" class="minimal"> disable comment
				  </label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="doc-subject">Content</label>
				<div class="col-sm-10">
					<div gpid="post-content" class="" placeholder="Content" 
						style="min-height:50px;max-height:200px;background:#ecf0f5;
						height:auto;overflow:auto; margin-bottom:5px;
						padding:5px;">
						what are you doing
						</div>
					<div>
						<a gpid="content-edit-btn" class="btn btn-default btn-sm"><i class="fa fa-fw fa-pencil"></i></a>
						<a gpid="content-exit-btn" class="btn btn-default btn-sm"><i class="fa fa-fw fa-file-text-o"></i></a>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="doc-subject">Priority</label>
				<div class="col-sm-3">
					<select class="form-control select2 input-sm" >														
					  <option>Normal</option>
					  <option>Medium</option>
					  <option>Urgent</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="doc-owner">Assign to</label>
				<div class="col-sm-10">
					<select class="form-control select2" multiple="multiple" data-placeholder="Select a State" style="width: 95%;">
					  <option>Zhangsan</option>
					  <option>Li si</option>
					  <option>Wang wu</option>
					  <option>Zhou liu</option>
					  <option>Dong qi</option>
					  <option>Ma yun</option>
					  <option>Cliton</option>
					</select>
				</div>
			</div>
		</div>
	  <!--/div-->
	  <div class="modal-footer">
		<button type="button" gpid="upload-clear-btn" class="btn btn-default pull-left" >Clear</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button gpid="btn_exec" type="button" class="btn btn-primary">start</button>
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
		
		$edit_content_btn : $('a[gpid="content-edit-btn"]', $modal),
		$exit_content_btn : $('a[gpid="content-exit-btn"]', $modal),
		$post_content : $('div[gpid="post-content"]',$modal),
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
			_self.$edit_content_btn.on('click', function(){
				_self.$post_content.summernote({ 
					"height" : 200, 
					"focus" : true,
					"toolbar" : _self._snote_bar
				});
				_self.$edit_content_btn.toggleClass('disabled', true);
				_self.$exit_content_btn.toggleClass('disabled', false);
			});
			_self.$exit_content_btn.on('click', function(){
				_self.$post_content.summernote('destroy');
				_self.$edit_content_btn.toggleClass('disabled', false);
				_self.$exit_content_btn.toggleClass('disabled', true);
			});
			
			$(".select2").select2();
		}
	};

	NewPostModal.initial();
});
</script>