<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="taglibs.jsp" %>

<ul class="nav nav-tabs navibar-page pull-right page-nav" >
	<c:if test="${param.module=='workspace'}">
		<li>
			<a data-toggle="tooltip" title="查看全部工作组空间" href="../workgroup/all-grid.do" aria-expanded="true">
				<i class="fa fa-lg fa-home"></i>
			</a>
		</li>
		<li><span class="v-separator"></span></li>
		<li>
			<a <c:if test="${param.page=='posts'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看全部个人话题" href="posts.do?user_id=${user_id}" aria-expanded="true">
			<i class="fa fa-lg fa-map-signs"></i>
			</a>
		</li>
		<li>
			<a <c:if test="${param.page=='netdisk'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看个人网盘" href="netdisk.do?user_id=${user_id}" aria-expanded="true">
				<i class="fa fa-lg fa-suitcase"></i>
			</a>
		</li>
		<li>
			<a <c:if test="${param.page=='shares'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看个人分享" href="shares.do?user_id=${user_id}" aria-expanded="true">
				<i class="fa fa-lg fa-link"></i>
			</a>
		</li>
		<li>
			<a <c:if test="${param.page=='tasks'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看个人任务内容" href="tasks.do?user_id=${user_id}" aria-expanded="true">
				<i class="fa fa-lg fa-flag"></i>
			</a>
		</li>
		<li>
			<a <c:if test="${param.page=='messages'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看个人消息" href="messages.do?user_id=${user_id}" aria-expanded="true">
				<i class="fa fa-lg fa-comments"></i>
			</a>
		</li>
		<li>
			<a <c:if test="${param.page=='profile'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看个人设置" href="profile.do?user_id=${user_id}" aria-expanded="false">
				<i class="fa fa-lg fa-info-circle"></i>
			</a>
		</li>
	</c:if>
	<c:if test="${param.module=='dashboard'}">
		<li>
			<a data-toggle="tooltip" title="展现全部工作组并查询" href="../workgroup/all-grid.do" aria-expanded="false" >
				<i class="fa fa-lg fa-globe"></i>
			</a>
		</li>
		<li>
			<a data-toggle="tooltip" title="查看个人相关的工作空间" href="../workspace/notifications.do" aria-expanded="false" >
				<i class="fa fa-lg fa-home"></i>
			</a>
		</li>
	</c:if>
</ul>