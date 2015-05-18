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
<title>没有权限</title>
<link rel="stylesheet" type="text/css" href="${base}/resources/dist/css/bootstrap.min.css" />

<script type="text/javascript" src="${base}/resources/js/jquery-1.11.2.min.js"></script>



<body>　
<div>您不是管理员，无法察看此页面。</div>
<hr>


</body>
</html>
