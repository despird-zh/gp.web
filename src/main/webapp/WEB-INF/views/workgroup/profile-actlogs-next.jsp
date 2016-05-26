<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<div class="col-md-12">
	<!-- The time line -->
	<ul id="actlogs-container" class="timeline">
	<c:forEach var="actlog" items="${actlogs}">
	<c:if test="${actlog.timeLabel != ''}">
	<!-- timeline time label -->
	<li class="time-label infinite-actlog-item">
	  <span class="bg-red label label-sm">
		${actlog.timeLabel}
	  </span>
	</li>
	<!-- /.timeline-label -->
	</c:if>
	<!-- timeline item -->
	<li class="infinite-actlog-item">
	  <i class="fa fa-envelope bg-blue"></i>
	  <div class="timeline-item">
		<span class="time"><i class="fa fa-clock-o"></i>${actlog.activityTime}</span>
		<div class="timeline-header"><a href="#">${actlog.userName}</a> 评论了你的帖子 ${actlog.objectExcerpt}</div>
		<div class="timeline-body">
		  ${actlog.predicateExcerpt}
		</div>
	  </div>
	</li>
	<!-- END timeline item -->
	</c:forEach>	
	</ul>
	<c:if test="${hasMore}">
	<a class="infinite-more-actlog-link" href="actlogs-next.do?pageNumber=${nextPage}&wgroup_id=${wgroup_id}&tailDate=${tailDate}">More</a>
	</c:if>	
</div>

