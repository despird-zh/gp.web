<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<div class="panel-body">
	<ul class="list-group">
<c:forEach var="version" items="${data}">
		<li class="list-group-item ">
			<div class="version-item">
				<span class="label label-default ">V1.0</span> <span>Gary - </span> <span style="font-style:italic;">this is demo description</span>
			</div>
		</li>
</c:forEach>
<c:if test="${empty data}">
		<li class="list-group-item ">
			<div class="version-item">
				<span style="font-style:italic;">No Version information</span>
			</div>
		</li>
</c:if>
	</ul>
</div>