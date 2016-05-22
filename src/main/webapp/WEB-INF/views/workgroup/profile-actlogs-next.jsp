<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<c:forEach var="actlog" items="${actlogs}">
<!-- timeline time label -->
<li class="time-label">
  <span class="bg-red label label-sm">
	${actlog.activityDate}
  </span>
</li>
<!-- /.timeline-label -->
<!-- timeline item -->
<li>
  <i class="fa fa-envelope bg-blue"></i>
  <div class="timeline-item">
	<span class="time"><i class="fa fa-clock-o"></i> 27 分钟之前</span>
	<div class="timeline-header"><a href="#">${actlog.userName}</a> 评论了你的帖子 ${actlog.objectExcerpt}</div>
	<div class="timeline-body">
	  ${actlog.predicateExcerpt}
	</div>
  </div>
</li>
<!-- END timeline item -->
</c:forEach>	
<c:if test="${hasMore}">
	<a class="infinite-more-link hidden" href="actlogs-next.do?pageNumber=${nextPage}&wgroup_id=${wgroup_id}">More</a>
</c:if>	

