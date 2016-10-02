<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="taglibs.jsp" %>

<ul class="nav nav-tabs navibar-page pull-right page-nav" >
	<c:if test="${param.module=='workspace'}">
		<li>
			<a data-toggle="tooltip" title="查看全部工作组空间" href="../square/all-grid.do" aria-expanded="true">
				<i class="fa fa-lg fa-globe"></i>
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
	<!-- the workgroup pages entrance -->
	<c:if test="${param.module=='workgroup'}">
		<li>
			<a data-toggle="tooltip" title="查看个人空间" href="../workspace/messages.do" aria-expanded="true">
				<i class="fa fa-lg fa-home"></i>
			</a>
		</li>
		<li><span class="v-separator"></span></li>
		<li>
			<a <c:if test="${param.page=='publish'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看工作组发布文档" href="../workgroup/publish.do?wgroup_id=${wgroup_id}">
			<i class="fa fa-lg fa-map-signs"></i>
			</a>
		</li>
		<li>
			<a <c:if test="${param.page=='netdisk'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看工作组网盘" href="../workgroup/netdisk.do?wgroup_id=${wgroup_id}">
				<i class="fa fa-lg fa-suitcase"></i>
			</a>
		</li>
		<li>
			<a <c:if test="${param.page=='shares'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看工作组分享" href="../workgroup/share.do?wgroup_id=${wgroup_id}">
				<i class="fa fa-lg fa-link"></i>
			</a>
		</li>
		<li>
			<a <c:if test="${param.page=='tasks'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看工作组任务内容" href="../workgroup/tasks.do?wgroup_id=${wgroup_id}">
				<i class="fa fa-lg fa-flag"></i>
			</a>
		</li>
		<li>
			<a <c:if test="${param.page=='posts'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看工作组话题" href="../workgroup/posts.do?wgroup_id=${wgroup_id}">
				<i class="fa fa-lg fa-comments"></i>
			</a>
		</li>
		<li>
			<a <c:if test="${param.page=='profile'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看工作组信息" href="../workgroup/profile.do?wgroup_id=${wgroup_id}">
				<i class="fa fa-lg fa-info-circle"></i>
			</a>
		</li>
	</c:if>
	<!-- the dashboard pages entrance -->
	<c:if test="${param.module=='dashboard'}">
		<li>
			<a data-toggle="tooltip" title="展现全部工作组并查询" href="../square/all-grid.do" aria-expanded="false" >
				<i class="fa fa-lg fa-object-ungroup"></i>
			</a>
		</li>
		<li>
			<a data-toggle="tooltip" title="查看个人所属的工作组" href="../workspace/notifications.do" aria-expanded="false" >
				<i class="fa fa-lg fa-object-group"></i>
			</a>
		</li>
		<li>
			<a data-toggle="tooltip" title="查看个人相关的工作空间" href="../workspace/notifications.do" aria-expanded="false" >
				<i class="fa fa-lg fa-home"></i>
			</a>
		</li>
	</c:if>
	<!-- the dashboard pages entrance -->
	<c:if test="${param.module=='square'}">
		<li>
			<a data-toggle="tooltip" title="查看个人相关的工作空间" href="../workspace/notifications.do">
				<i class="fa fa-lg fa-home"></i>
			</a>
		</li>
		<li><span class="v-separator"></span></li>
		<li>
			<a <c:if test="${param.page=='all-grid'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查询全部协作组" href="../square/all-grid.do">
				<i class="fa fa-lg fa-object-ungroup"></i>
			</a>
		</li>	
		<li>
			<a <c:if test="${param.page=='all-post'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看全部公共话题" href="../square/all-posts.do">
				<i class="fa fa-lg fa-map-signs"></i>
			</a>
		</li>					
		<li>
			<a <c:if test="${param.page=='all-list'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查询全部开放分享" href="../square/all-share.do">
				<i class="fa fa-lg fa-folder-open-o"></i>
			</a>
		</li>
	</c:if>
</ul>
<hr class="m-t-none m-b-xs">