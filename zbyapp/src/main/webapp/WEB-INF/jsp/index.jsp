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
<title>请假</title>
<link rel="stylesheet" type="text/css" href="${base}/resources/dist/css/bootstrap.min.css" />

<script type="text/javascript" src="${base}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${base}/resources/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/resources/echarts/echarts.js"></script>

<body>　
<jsp:include page="/WEB-INF/jsp/loginLayout.jsp" flush="true"/> 
<div class="container">
<sec:authorize access="hasRole('ROLE_MANAGER')">
	<a href="${base}/admin/showLeaveList" style="display:inline-block; padding-top:20px;">查看员工请假情况</a>
</sec:authorize>
</div>
<!-- <div>
	<a href="report.do">查看公司报表</a>
</div> -->
<hr>


</body>
</html>
