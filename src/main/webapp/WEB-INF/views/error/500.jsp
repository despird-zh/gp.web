<%@ page language="java" contentType="text/html; charset=UTF-8"%>    
<%@ page import="org.apache.log4j.Logger" %>  
<%@page import="java.text.SimpleDateFormat"%>   
<%@taglib prefix="s" uri="/struts-tags"%>     
<html>     
    <head>     
        <title>Exception General Handling Page</title>     
    </head>     
    <body>     
            <!--  
                <s:property value="exceptionStack"/>    
                <s:property value="exception.message"/>     
            -->   
        System Error, Please try later...  
        <%  
        final Logger logger = Logger.getLogger(getClass());  
        logger.error("System Error>>>" 
						+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date())
						+ ">>>"
						+ request.getAttribute("exception.message"));
		logger.error(request.getAttribute("exceptionStack"));
        %>
     </body>     
</html>  