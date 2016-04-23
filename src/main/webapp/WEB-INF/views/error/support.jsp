<%@ page language="java" errorPage="./exception.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<!DOCTYPE html SYSTEM "http://www.thymeleaf.org/dtd/xhtml1-strict-thymeleaf-spring4-4.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"	xmlns:th="http://www.thymeleaf.org">

<head >
</head>

<body>
	<h1>Support Friendly Error Page</h1>
	<p >
		<b>Page:</b> <span >${url}</span>
	</p>
	<p id='created'>
		<b>Occurred:</b> <span >${timestamp}</span>
	</p>
	<p>
		<b>Response Status:</b> <span >${state}</span> 
		<span>${error} ...</span>
	</p>

	<p>Application has encountered an error. Please contact support on
		...</p>

	<p>Support may ask you to right click to view page source.</p>
    <!--
      // Hidden Exception Details  - this is not a recommendation, but here is
      // how you hide an exception in the page using Thymeleaf
      -->
	<div >${url}</div>
	<div >${exception.message}</div>
	<ul >
	 <c:forEach items="${exception.stackTrace}" var="trace">
		<li ><span>${trace}</span></li>
	 </c:forEach>
	</ul>

</body>
</html>
