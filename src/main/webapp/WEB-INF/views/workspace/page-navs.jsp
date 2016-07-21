<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<ul class="nav nav-tabs navibar-page pull-right" style="position: absolute; right: 15px; top: 0px; margin-bottom: 0px; border-bottom-width: 1px; margin-top: 6px;">
	<li>
		<a data-toggle="tooltip" title="查看全部工作组空间" href="../workgroup/all-grid.do" aria-expanded="true">
			<i class="fa fa-lg fa-home"></i>
		</a>
	</li>
	<li><span class="v-separator"></span></li>
	<li>
		<a <c:if test="${param.currPage=='topics'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看全部个人话题" href="topics.do?user_id=${user_id}" aria-expanded="true">
		<i class="fa fa-lg fa-map-signs"></i>
		</a>
	</li>
	<li>
		<a <c:if test="${param.currPage=='netdisk'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看个人网盘" href="netdisk.do?user_id=${user_id}" aria-expanded="true">
			<i class="fa fa-lg fa-suitcase"></i>
		</a>
	</li>
	<li>
		<a <c:if test="${param.currPage=='shares'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看个人分享" href="shares.do?user_id=${user_id}" aria-expanded="true">
			<i class="fa fa-lg fa-link"></i>
		</a>
	</li>
	<li>
		<a <c:if test="${param.currPage=='tasks'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看个人任务内容" href="tasks.do?user_id=${user_id}" aria-expanded="true">
			<i class="fa fa-lg fa-flag"></i>
		</a>
	</li>
	<li>
		<a <c:if test="${param.currPage=='messages'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看个人消息" href="messages.do?user_id=${user_id}" aria-expanded="true">
			<i class="fa fa-lg fa-comments"></i>
		</a>
	</li>
	<li>
		<a <c:if test="${param.currPage=='profile'}"> class="bg-aqua-active"</c:if> data-toggle="tooltip" title="查看个人设置" href="profile.do?user_id=${user_id}" aria-expanded="false">
			<i class="fa fa-lg fa-info-circle"></i>
		</a>
	</li>
</ul>