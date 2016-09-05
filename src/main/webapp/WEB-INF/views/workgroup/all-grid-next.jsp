<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<div class="box box-widget list-view no-radius">
	<div id="gallery" class="infinite-container gallery row">
<c:forEach var="wgroup" items="${wgroups}">
		<div class="col-md-2 image infinite-item">
			<div class="image-inner">
				<a href="../workgroup/posts.do?wgroup_id=${wgroup.workgroupId}" >
					<img src="${wgroup.imagePath}" alt="" />
				</a>
				<p class="image-caption">
					${wgroup.workgroupName}
				</p>
			</div>
			<div class="image-info">
				<div class="m-b-xs">
					<a class="label label-primary" href="javascript:;"><i class="fa fa-flag"></i></a>
					<a class="label label-primary" href="javascript:;"><i class="fa fa-database"></i></a>
					<a class="label label-primary" href="javascript:;"><i class="fa fa-files-o"></i></a>
				</div>
				<div class="desc">									
					${wgroup.description}
				</div>
			</div>
		</div>
</c:forEach>
	</div>
<c:if test="${hasMore}">
	<a class="infinite-more-link hidden" href="all-grid-next.do?pageNumber=${nextPage}&wgroup_name=${wgroup_name}&${tags}">More</a>
</c:if>
</div><!-- end box -->