<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
    <%
		String base = request.getContextPath();
		request.setAttribute("base", base);
	%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href="${base}/resources/dist/css/bootstrap.min.css" />
<script type="text/javascript" src="${base}/resources/dist/js/bootstrap.min.js"></script>

<body>

<div class="container mb20">
	<h2>欢迎 ${sessionScope.username}</h2>
	<div><a class="btn btn-default" href="${base}/j_spring_security_logout">注销</a></div>
</div>

</body>
</html>
