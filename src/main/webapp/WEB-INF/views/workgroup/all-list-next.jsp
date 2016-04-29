<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<c:forEach var="wgroup" items="${wgroups}">
	<li class="list-group-item clearfix infinite-item">
		<div class="media">
		  <div class="item-type">
			<div class="img-32x32-repo-item img-repo-folder">
			</div>
		  </div>
		  <div class="repo-item bd">
			<ul class="action-list">
			  <li class="action">
				<a  href="#"><i class="fa fa-share-alt"></i></a>
			  </li>
			  <li class="action">
				<a  href="#"><i class="fa fa-star"></i></a>
			  </li>
			  <li class="action" data-toggle="tooltip" title="detail information">
				<a  href="#"><i class="fa fa-info"></i></a>
			  </li>									
			</ul>

			<ul class="inline-list" >
			  <li>
			<div class="item-name-container">
			  <a class="item-link " href="#">
				${wgroup.workgroupName}
			  </a>
			  <span class="time"><i class="fa fa-clock-o"></i> 2015-5-12 12:13:23</span>								  
			</div>
			  </li>
			  <li class="">
				managed by 
				<a class="hoverlight profile_link">
				  ${wgroup.adminName}
				</a>
			  </li>
			  <li title="13 Files, 8.4 MB" data-toggle="tooltip" class="item-stat">
				<span class="">
				  <span><i class="fa fa-database"></i></span>
				  13
				</span>
			  </li>
			  <li title="12 People (13) external " data-toggle="tooltip" class="item-stat">
				<span class="">
				  <span><i class="fa fa-user "></i></span>
				  25
				</span>
			  </li>
			  <li title="25 done, 10 pending,3 in-prcess " data-toggle="tooltip" class="item-stat">
				<span class="">
				  <span><i class="fa fa-flag text-yellow"></i> </span>
				  35
				</span>
			  </li>
			</ul>
			<ul class="inline-list">
			  <li class="">
				<div class="description-text-container">
				  <span class="" >
					${wgroup.description}
				  </span>
				</div>
			  </li>
			</ul>
		  </div>
		</div>
	</li>	
</c:forEach>	
<c:if test="${hasMore}">
	<a class="infinite-more-link" href="all-list-next.do?pageNumber=${nextPage}&wgroup_name=${wgroup_name}&${tags}">More</a>
</c:if>	