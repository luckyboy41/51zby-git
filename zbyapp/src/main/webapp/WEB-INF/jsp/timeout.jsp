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
<title>超时</title>
<link rel="stylesheet" type="text/css" href="${base}/resources/dist/css/bootstrap.min.css" />

<script type="text/javascript" src="${base}/resources/js/jquery-1.11.2.min.js"></script>



<body>　
<div>太长时间没动作了，请重新登陆。</div>

<hr>


</body>
</html>
