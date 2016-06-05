<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<div class="box-body repo-list">
	<ul class="infinite-container list-group list-group-unbordered">
<c:forEach var="cabitem" items="${entries}">
		<li class="list-group-item infinite-item">
			<div class="media">
			  <div class="item-type">
			<c:choose> 
				<c:when test="${cabitem.itemType == 'FILE'}">
				<div class="img-32x32-repo-item img-repo-file">
				</div>
				</c:when> 
				<c:when test="${cabitem.itemType == 'FOLDER'}">
				<div class="img-32x32-repo-item img-repo-folder">
				</div>
				</c:when> 
			</c:choose>
			  </div>
			  <div class="repo-item bd" data-item-id="${cabitem.itemId}" data-item-type="${cabitem.itemType}">
				<ul class="action-list">
					<li class="action" data-toggle="tooltip" title="Edit tags">
						<a href="javascript:void(0)"><i class="fa fa-tags"></i></a>
					</li>
					<li class="action" data-toggle="tooltip" title="Add to clipboard">
						<a  href="javascript:void(0)"><i class="fa fa-clipboard"></i></a>
					</li>
					<li class="action" data-toggle="tooltip" title="comments information">
						<a  href="javascript:void(0)" gpid="show-comments-btn" ><i class="fa fa-commenting"></i></a>
					</li>
					<li class="action" data-toggle="tooltip" title="Share file">
						<a  href="javascript:void(0)"><i class="fa fa-share-alt"></i></a>
					</li>
					<li class="action" data-toggle="tooltip" title="favorite file">
						<a  href="javascript:void(0)"><i class="fa fa-star"></i></a>
					</li>
					<li class="action">
						<a  href="javascript:void(0)"><i class="fa fa-square-o" ></i></a>
					</li>
				</ul>
				<div class="item-name-container">
				  <a class="item-link " href="#">
					${cabitem.itemName}
				  </a>     
				<c:if test="${cabitem.externalOwned}">
				  <span class="badge long-badge ellipsis" title="${cabitem.sourceStat.statTooltip}" data-toggle="tooltip" >
					${cabitem.sourceStat.statText}
				  </span>
				</c:if>
				  <span class="badge long-badge ellipsis" >
					${cabitem.classification}
				  </span>
				</div>
				<ul class="inline-list">
					<li class="">
						Updated ${cabitem.timeElapse} by 
						<a class="hoverlight profile_link">
						${cabitem.account}
						</a>
					</li>
					<li class="item-stat" data-toggle="tooltip" title="" data-original-title="${cabitem.childStat.statTooltip}">
						<span style="" class="label label-default v-center p-t-xxs"><i class="fa fa-file"></i></span>
						<c:if test="${cabitem.itemType == 'FOLDER'}">
						<div class="countinfo-wrapper">
							<div class="countinfo">
								<span >${cabitem.childStat.statText}</span>
							</div>
							<div class="countinfonub"><s></s><i></i></div>
						</div>
						</c:if>
					</li>
					<li class="item-stat" data-toggle="tooltip" title="" data-original-title="${cabitem.favoriteStat.statTooltip}">
						<span style="" class="label label-default v-center p-t-xxs"><i class="fa fa-star"></i></span>
						<div class="countinfo-wrapper">
							<div class="countinfo">
								<span class="">${cabitem.favoriteStat.statText}</span>
							</div>
							<div class="countinfonub"><s></s><i></i></div>
						</div>
					</li>
					<c:if test="${cabitem.itemType == 'FILE'}">
					<li class="item-stat" data-toggle="tooltip" title="" data-original-title="${cabitem.versionStat.statTooltip}">
						<span class="popup-marker label label-default v-center p-t-xxs" gpid="versionlist"><i class="fa fa-signal"></i></span>
						<div class="countinfo-wrapper">
							<div class="countinfo">
								<span class="">${cabitem.versionStat.statText}</span>
							</div>
							<div class="countinfonub"><s></s><i></i></div>
						</div>
					</li>
					</c:if>
					<li class="item-stat">
						<span class="popup-marker label label-default v-center p-t-xxs" gpid="informationlist"><i class="fa fa-info-circle"></i></span>
					</li>
				</ul>
				<c:if test="${!empty cabitem.description}">
				<ul class="inline-list">
				  <li >
					<div class="description-text-container">
					  <span >
						${cabitem.description}
					  </span>
					</div>
				  </li>
				</ul>
				</c:if>
				<c:if test="${!empty cabitem.tags}">
				<div>
				   <p class="tags xsmall m-b-none">
						<c:forEach var="tag" items="${cabitem.tags}">
							<a class="tag-blue tag-point-${tag.tagColor}" href="javascript:void(0)" title="">${tag.tagName}</a>
						</c:forEach>
					</p>
				</div>
				</c:if>
				<div gpid="comment-list-container" class="hidden">
					<div obid="comment_list" class="direct-chat-messages" style="margin-top:5px;margin-bottom:0px;">
					</div>
					<div class="input-group input-group-sm">
						<input type="text" class="form-control">
						<span class="input-group-btn">
						  <button class="btn btn-info btn-flat" type="button"><i class="fa fa-paper-plane-o"></i></button>
						</span>
					</div>
				</div>
			  </div>
			</div>
		</li>
</c:forEach>
	</ul><!-- end list -->
<c:if test="${hasMore}">
	<a class="infinite-more-link hidden" href="netdisk-next.do?pageNumber=${nextPage}&cabinet_id=${cabinetId}&folder_id=${folderId}">More</a>
</c:if>
</div><!-- /.box-body -->