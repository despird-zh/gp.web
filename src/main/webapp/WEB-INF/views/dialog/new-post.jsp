<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<style>

</style>
<div class="modal fade" id="new-file-modal" tabindex="-1" role="dialog" aria-labelledby="new-file-modal-label"><!-- clipboard modal -->
  <div class="modal-dialog" role="document" style="width:650px;">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="select-user-modal-label">New Post</h4>
	  </div>
	  <div class="modal-body clearfix">
		<div class="row">
			<div class="col-md-6">		
				<div class="box-body no-padding m-b-xs">		
					<table class="table table-bordered table-condensed">
					<tbody>
						<tr>
							<th style="width: 80%">File Name</th>
							<th style="width: 20%">Act.</th>
						</tr>
					</tbody>			
					</table>	
				  <div gpid="upload-files-wrapper" class="no-margin no-padding" style="min-height:237px;">
					  <table  gpid="upload-files" class="table table-condensed table-bordered table-ellipsis" style="table-layout: fixed;margin-bottom:0px;">
						<tbody>
							<tr gpid="blank-row"><td colspan="2">No results ... </td></tr>
						</tbody>
					  </table>
				  </div>			
				</div>	<!--./box-body-->
			</div><!--./col-md-5-->
			<div class="col-md-6">	
				<form class="form-horizontal">
					<div class="form-group">
					  <label for="item-storage-name" class="pull-left m-r-sm m-l-md" >File Detail:</label>
					  <button type="button" gpid="update-file-item-btn" class="btn btn-xs btn-primary pull-left" ><i class="fa fa-fw fa-save"></i></button>
					</div>
					<div class="form-group">
					  <label for="item-storage-name" class="col-sm-3 control-label">Name</label>
					  <div class="col-sm-8">
						<input type="text" class="form-control" id="file-dtl-name" placeholder="file name">					
					  </div>
					</div>
					<div class="form-group">
					  <label for="item-capacity" class="col-sm-3 control-label">Size</label>
					  <div class="col-sm-7">
						<div class="input-group">
							<input type="text" class="form-control" id="file-dtl-size" placeholder="file size">
							<span class="input-group-addon">Bytes</span>
						  </div>
					  </div>
					</div>
					<div class="form-group">
					  <label for="item-used" class="col-sm-3 control-label">Type</label>
					  <div class="col-sm-5">
						<input type="text" class="form-control" id="file-dtl-type" placeholder="doc type">
					  </div>
					</div>
					<div class="form-group">
					  <label for="item-description" class="col-sm-3 control-label">Description</label>
					  <div class="col-sm-8">
						<textarea placeholder="Enter ..." rows="2" id="file-dtl-description" class="form-control"></textarea>
					  </div>
					</div>
				</form>
			</div>
			
			<div class="col-md-12 m-b-n-sm">	
				<div class="progress sm m-b-xs">
					<div gpid="probress-bar" style="width: 0%" class="progress-bar progress-bar-blue progress-bar-striped"></div>
				</div>	
			</div>		
		</div>
	  </div>
	  <div class="modal-footer">
		<span class="btn btn-success fileinput-button pull-left">
			<i class="glyphicon glyphicon-plus"></i>
			<span>Select</span>
			<!-- The file input field used as target for the file upload widget -->
			<input gpid="fileupload" type="file" name="files[]" multiple>
		</span>
		<button type="button" gpid="upload-clear-btn" class="btn btn-default pull-left" >Clear</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button gpid="btn_exec" type="button" class="btn btn-primary">start</button>
	  </div>
	</div>
  </div>
</div><!-- clipboard modal -->
<script src="${path_plugins}/summernote/summernote.js"></script>
<script id="select-file-template" type="x-tmpl-mustache">

</script><!-- /.template:select-user-list-template -->
<!--script src="${path_plugins}/jQueryUpload/js/jquery.fileupload-ui.js"></script>
<script src="${path_plugins}/jQueryUpload/js/jquery.fileupload-process.js"></script-->
<script type="text/javascript">
$(function (){
	"use strict";
	/*
	 * Common dialogue to select user.
	 */	
	var NewPostModal = {
		
		
	};

});
</script>