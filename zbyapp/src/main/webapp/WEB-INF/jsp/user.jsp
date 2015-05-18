<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'my_test.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<script type="text/javascript" src="/com.csst.core.web/js/jquery-1.8.3.js"></script>
 
</head>

<body>
	<TABLE id="testTableList" border=1 cellSpacing=0 width="200">
		<TBODY>
			<TR>
				<TD>ID</TD>
				<TD>名称</TD>
			</TR>
		</TBODY>
	</TABLE>
	<p>
	<hr>
	<p>
	<form id="addForm" action="/ebtSearch/user/add.do"
		method="post">
		name: <input type="text" name="username" value="${user.nickname}"/> <br />
		<p>
			<!-- <input type="text" name="price" /> -->
		<p>
			<input type="submit" id="submitBtn" value="新增" />
	</form>
	
	
	<c:forEach items="${list}" var="t">${t.index}是${t.name}</c:forEach>
</body>
</html>
