<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<p style="margin-bottom:0px;" class="tags xsmall">
<c:forEach var="version" items="${data}">
	<a class="tag-red " href="" title="">Fashion</a>
	<a class="tag-yellow " href="" title="">测试</a>
	<a class="tag-blue " href="" title="">学习</a>
	<a class="tag-green  " href="" title="">Java</a>
	<a class="tag-default tag-point-red" href="" title="">工具</a>
	<a class="tag-default tag-point-yellow " href="" title="">专业</a>
	<a class="tag-default tag-point-green" href="" title="">电气</a>
	<a class="tag-default tag-point-blue" href="" title="">评分</a>
	<a class="tag-default  " href="" title="">投票</a>
	<a class="tag-red  " href="" title="">更新</a>
</c:forEach>
</p>