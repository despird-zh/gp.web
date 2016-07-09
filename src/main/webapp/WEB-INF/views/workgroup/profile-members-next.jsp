<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<div class="repo-list col-md-12">
	<ul id="members-container" class="infinite-container list-group list-group-unbordered">
<c:forEach var="member" items="${members}">
		<li class="list-group-item clearfix">
			<div class="media">
			  <div class="item-type">
				<img class="direct-chat-img" src="/gp/dist/img/user1-128x128.jpg" alt="message user image">
			  </div>
			  <div class="repo-item bd">
				<ul class="action-list">
					<li title="" data-toggle="tooltip" class="action" data-original-title="Remove this member">
						<a href="#">
						  <i class="fa fa-times"></i>
						</a>
					</li>												
				</ul>
				<div class="item-name-container">
				  <a href="#" class="item-link ">
					${member.uname}
				  </a>
				  <span class="badge long-badge ellipsis">
					${member.role}
				  </span>
				</div>
				<ul class="inline-list">
				  <li class="">
					来自
					<a class="hoverlight profile_link">
					  ${member.sourceName}
					</a>
				  </li>
				  <li class="item-stat" data-toggle="tooltip" title="" data-original-title="12 Group 300,000 topics">
					<span class="">
					  <span>
						<i class="fa fa-sun-o"></i>
					  </span>
					  13
					</span>
				  </li>
				  <li class="item-stat" data-toggle="tooltip" title="3 Members">
					<span class="">
					  <span>
						<i class="fa fa-user"></i>
					  </span>
					  2
					</span>
				  </li>
				</ul>											
			  </div>
			</div>
		</li>
</c:forEach>	
	</ul>
<c:if test="${hasMore}">
	<a class="infinite-more-link hidden" href="members-next.do?pageNumber=${nextPage}&wgroup_id=${wgroup_id}">More</a>
</c:if>	
</div>

