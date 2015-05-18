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
<script type="text/javascript" src="${base}/resources/js/jquery-1.11.2.min.js"></script>

<link rel="stylesheet" type="text/css" href="${base}/resources/css/jquery.bs_pagination.css" />
<script type="text/javascript" src="${base}/resources/js/jquery.bs_pagination.min.js"></script>
<script type="text/javascript" src="${base}/resources/js/bs_pagination_en.js"></script> 
<style type="text/css">
	label{line-height:34px;}
	label.lb{width:93px;}
	.mb20{ margin-bottom:20px;}
	.int{ width:45% !important;}
</style>

<body>
<jsp:include page="/WEB-INF/jsp/loginLayout.jsp" flush="true"/> 


<div class="container">
<form action="${base}/admin/showLeaveList" onsubmit="return checkDate()"  method="get">
<input type="hidden" name="pageNum" >
<div class="form-horizontal">
	<div class="form-group">
		<label class="col-sm-1">请假人：</label>
		<div class="col-sm-11"><input name="name" class="form-control int" placeholder="请输入要查询的用户" value="${leaveeVo.name }"/></div>
	</div>
	<div class="form-group">
		<label class="col-sm-1">请假类型:</label>
		<div class="col-sm-11"><input name="type" class="form-control int" placeholder="请输入要查询请假类型" value="${(leaveeVo.type==-1)?'':leaveeVo.type}"/></div>
	</div>
</div>

<div class="form-inline">
	<div class="form-group">
		<label class="lb">开始时间:</label>
		<input type="date" class="form-control" name="starttime" value="<fmt:formatDate value="${leaveeVo.starttime}" pattern="yyyy-MM-dd"/>"/>&nbsp;&nbsp;~~&nbsp;&nbsp;
	</div>
	<div class="form-group">
		<label class="lb">结束时间:</label>
		<input type="date" class="form-control" name="endtime" value="<fmt:formatDate value="${leaveeVo.endtime}" pattern="yyyy-MM-dd"/>"/>
	</div>
</div>
<div class="mb20"><button class="btn btn-primary" type="submit" value="">查询</button></div>
<div class="mb20">
	<a class="btn btn-success" href="${base}/admin/showLeaveList" target="_blank">查询全部</a>
	<a class="btn btn-success" href="${base}/admin/showLeaveList?pageNum=&name=&type=&starttime=<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>" target="_blank">查询有效</a>
</div>

<sec:authorize access="hasRole('ROLE_MANAGER')">
	<table class="table  table-bordered table-striped table-hover"> 
	<thead>
	<th> 用户名</th>
	<th><a href="javascript:refreshOrder('starttime')">开始时间</a></th>
	<th><a  href="javascript:refreshOrder('endtime')">结束时间</a></th>
	<th>请假类型</th>
	<th>请假理由</th>
	<th><a  href="javascript:refreshOrder('createtime')">申请时间</a></th>
	<th><a  href="javascript:refreshOrder('examres')">审批结果</a></th>
	<th><a  href="javascript:refreshOrder('examtime')">审批时间</a></th>
	</thead>
	<tbody>
	   <c:forEach items="${leaves}" var="cur" >
	   <tr>
	   <td>${cur.name}</td>
	   <td><fmt:formatDate value="${cur.starttime}" pattern="yyyy/MM/dd"/></td>
	   <td><fmt:formatDate value="${cur.endtime}" pattern="yyyy/MM/dd"/></td>
	   <td>${cur.type}</td>
	   <td>${cur.content}</td>
	   <td><fmt:formatDate value="${cur.createtime}" pattern="yyyy/MM/dd"/></td>
	   <td>${cur.examres}</td>
	   <td><fmt:formatDate value="${cur.examtime}" pattern="yyyy/MM/dd"/></td>
	   </tr>
	   </c:forEach>
	</tbody>
	</table>
	  <div  id="demo_pag1"></div>
</sec:authorize>
</form>
</div>

<hr>
<script type="text/javascript">
var pages = ${pageInfo.pages};
var pageNum = ${pageInfo.pageNum};
var pageSize = ${pageInfo.pageSize};
var totalRows = ${pageInfo.total};

//分页
$("#demo_pag1").bs_pagination({
	  currentPage: pageNum,		  
	  totalPages: pages,      
	  totalRows :totalRows,
	  visiblePageLinks: 10	,
	  rowsPerPage: pageSize,		 
	  showGoToPage: true,
	  showRowsPerPage: false,
	  showRowsInfo: true,
	  showRowsDefaultInfo: true,
	  
	  onChangePage: function(event, data) {
		    // your code here e.g.
		    
		    $('input[name=pageNum]').val(data.currentPage);     			    
		 	$("form").submit();
	 }
	});
	
/* $('input[name=starttime],input[name=endtime]').on('change',function(){
   
	 
   } */
   
   function checkDate(){
	   var starttime =$('input[name=starttime]').val();
	   var endtime =$('input[name=endtime]').val();
	   var result =true;
	   if(starttime!='' && endtime!=''){
		   
		   starttime>endtime?result=false:result=true;
		   
  		}
	   if(!result){
		alert("开始日期大于结束日期");
	   }
	   return result;
}
   
   function refreshOrder(orderName){
	   var oldOrder = get_param('orderName');
	   if(oldOrder==orderName){
		   var sort = get_param('sort');
		   (sort==1)?sort=-1:sort=1;
		   set_param('sort',sort);
		   
	   }else{
		   set_param('orderName',orderName);
	   }
	   
   }
   
// 获取当前窗口url中param参数的值
   function get_param(param){
       var query = location.search.substring(1).split('&');
       for(var i=0;i<query.length;i++){
           var kv = query[i].split('=');
           if(kv[0] == param){
               return kv[1];
           }
       }
       return null;
   }
   // 设置当前窗口url中param的值
   function set_param(param,value){
       var query = location.search.substring(1);
       var p = new RegExp("(^|"+param+")=[^&]*");
       if(p.test(query)){
           query = query.replace(p,"$1="+value);
           location.search = '?'+query;
       }else{
           if(query == ''){
               location.search = '?'+param+'='+value;
           }else{
        	   location.search = '?'+query+'&'+param+'='+value;
           }
       }    
   }   

	
	
</script>

</body>
</html>
