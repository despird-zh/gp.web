<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<div class="modal fade" id="new-file-modal" tabindex="-1" role="dialog" aria-labelledby="new-file-modal-label"><!-- clipboard modal -->
  <div class="modal-dialog" role="document" style="width:550px;">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="select-user-modal-label">New File</h4>
	  </div>
	  <div class="modal-body nav-tabs-custom p-none">
		<ul class="nav nav-tabs">
		  <li class="active"><a data-toggle="tab" href="#base-info">Basic Info</a></li>
		  <li class=""><a data-toggle="tab" href="#ext-info">Ext. Property</a></li>								 
		</ul>
		<div class="tab-content">
			<div id="base-info" class="tab-pane active">
				<div style="padding:0;" class="box-body">
					<div class=" box-form form-horizontal">
						<div class="form-group">
							<label for="doc-name" class="col-sm-2 control-label">Name</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="doc-name" placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="doc-owner" class="col-sm-2 control-label">Owner</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="doc-owner" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<label for="doc-subject" class="col-sm-2 control-label">Subject</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="doc-subject" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<label for="doc-subject" class="col-sm-2 control-label">Description</label>
							<div class="col-sm-9">
								<textarea class="form-control" id="doc-subject" placeholder="description" rows="3"></textarea>
							</div>
						</div>
					</div>			
				</div><!-- /.box-body -->
			</div>
			<div id="ext-info" class="tab-pane">
				<div style="padding:0;" class="box-body">
					<div class=" box-form form-horizontal">
						<div class="form-group">
							<label for="doc-type" class="col-sm-2 control-label">Profile</label>
							<div class="col-sm-5">
								<select class="form-control select2" tabindex="-1">
								  <option>PropertyProfiling1</option>
								  <option>PropertyProfiling2</option>
								  <option>PropertyProfiling3</option>
								  <option>PropertyProfiling4</option>
								  <option>PropertyProfiling5</option>
								</select>								
							</div>
						</div>
						<hr style="margin-bottom:5px;margin-top:5px;">
						<div class="form-group">
							<label for="doc-name" class="col-sm-2 control-label">Pure Text</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="doc-name" placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="doc-name" class="col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
								<select style="width: 100%;" data-placeholder="Select a State" multiple="" class="form-control select2" tabindex="-1">
								  <option>Alabama</option>
								  <option>Alaska</option>
								  <option>California</option>
								  <option>Delaware</option>
								  <option>Tennessee</option>
								  <option>Texas</option>
								  <option>Washington</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="doc-owner" class="col-sm-2 control-label">slect</label>
							<div class="col-sm-5">
								<select class="form-control select2" tabindex="-1" aria-hidden="true">
									<option disabled="" selected="" value="">Please select</option>
								  <option>Sel opt1</option>
								  <option>Sel opt2</option>
								  <option>Sel opt3</option>
								  <option>Sel opt4</option>
								  <option>Sel opt5</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="doc-owner" class="col-sm-2 control-label">Ex Date</label>
							<div class="col-sm-5">
								<input type="text" id="eg-date" placeholder="click to show datepicker" class="form-control">
							</div>
						</div>
					</div>			
				</div><!-- /.box-body -->
			</div><!-- /.tab-pane -->
		</div><!-- /.tab-content -->
	  </div>
	  <div class="modal-footer">
		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
		<button gpid="btn_exec" type="button" class="btn btn-primary btn-sm">Select</button>
	  </div>
	</div>
  </div>
</div><!-- clipboard modal -->

<script type="text/javascript">
$(function (){
	/*
	 * Common dialogue to select user.
	 */	
	var NewFileModal = {
		
		$newfile_modal : $("#new-file-modal"), 
				
		initial : function(){
			
			var _self = this;
			_self.$newfile_modal.modal('hide');
			
		}
	};

	
	/*
	 * show select user dialog
	 */
	NewFileModal.newFileShow = function(_callback){
		
		var _self = this;
		_self.callback = _callback;
		_self.$newfile_modal.modal('show');
	};
	
	NewFileModal.initial();
	
	$.GPContext.showNewFile = function(callback){
		NewFileModal.newFileShow(callback);
	};
});
</script>