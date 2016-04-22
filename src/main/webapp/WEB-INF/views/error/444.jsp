<%@ page language="java" errorPage="/WEB-INF/view/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>

<!-- Relogon in case on session timeout -->	
<div class="modal fade" id="relogon-modal" tabindex="-1" role="dialog" aria-labelledby="select-user-modal-label"><!-- clipboard modal -->
  <div class="modal-dialog" role="document" style="width:300px;">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="select-user-modal-label">Relogon System</h4>
	  </div>
	  <div class="modal-body p-t-xxs" style="padding-bottom: 0px;">
			<div class="row m-l-none m-r-none m-b-sm" >
			  <div class="col-md-12">
				 <label gpid="relogon-msg" class="m-t-xs">Please relogon the system to continue. </label>
			  </div>
			</div>
			<div class="row m-l-none m-r-none" >
			  <div class="col-md-3">
					<label class="m-t-xs">User </label>
			  </div>
			  <div class="col-md-9">
					<input type="text" gpid="relogon-account" placeholder="account/name/ email" class="form-control input-sm">
			  </div>
			</div>
			 <div class="row m-l-none m-r-none m-b-sm" >
			 
			  <div class="col-md-3 m-t-xs">
					<label class="m-t-xs">Password </label>
			  </div>
			  <div class="col-md-9 m-t-xs">
					<input type="password" gpid="relogon-password" placeholder="password" class="form-control input-sm">
			  </div>				  
		  </div>		
	  </div>
	  <div class="modal-footer">
		<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
		<button gpid="relogon-submit" type="button" class="btn btn-primary">Logon</button>
	  </div>
	</div>
  </div>
</div><!-- relogon modal -->
