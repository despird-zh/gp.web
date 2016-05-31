<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<div class="panel-body popover-content">
	<ul class="list-group">
<c:forEach var="version" items="${versions}">
		<li class="list-group-item ">
			<div class="version-item">
				<span class="label label-default ">V1.0</span> <span>Gary - </span> <span style="font-style:italic;">this is demo description</span>
			</div>
		</li>
</c:forEach>
	</ul>
</div>