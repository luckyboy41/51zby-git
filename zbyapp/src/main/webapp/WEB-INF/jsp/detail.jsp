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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>index</title>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
  <script>
      alert("该页面不兼容IE8及以下浏览器,请升级IE浏览器或使用其他浏览器");
  </script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${base}/resources/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${base}/resources/css/default.css" />
<link rel="stylesheet" type="text/css" href="${base}/resources/css/detail.css" />
<script type="text/javascript" src="${base}/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${base}/resources/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/resources/echarts/echarts.js"></script>
</head>

<body>
    <!--header-->
    <header class="header">
        <div class="container">
            <h1>
                <a href="${base}">
                    <img class="logo" src="${base}/resources/imgs/logo_zi.png" alt="" />
                    <img class="logot" src="${base}/resources/imgs/logoT_zi.png" alt="" />   
                </a>
            </h1>   
        </div>
    </header>
    
    <!--detailheader-->
    <div class="detailheader">
        <section class="container">
            <div class="col-md-3 pdl0">
                <div class="delogo">
                    <figure><img src="${base}/${source.img}" alt="" /></figure>
                </div>
                <span><a href="${detail.sourceurl}" target="_blank">进入平台</a></span>  
                <span><a href="/ebtSearch/queryP2pList?datasource=${sourcename}" target="_blank">查看投资列表</a></span>    
            </div> 
            <div class="col-md-9 pdr0">
                <h2>${sourcename}<strong>${score.score}</strong></h2>
                <section class="detaillist">
                    <dl>
                        <dt>平均收益：</dt>
                        <dd>${detail.avgbenefit}%</dd>
                    </dl>
                    <dl>
                        <dt>投资期限：</dt>
                        <dd>${detail.investhorizon}</dd>
                    </dl>
                    <dl>
                        <dt>注册资金：</dt>
                        <dd>${detail.registcapital}万元</dd>
                    </dl>
                    <dl>
                        <dt>自动投标：</dt>
                        <dd>${detail.automaticbid}</dd>
                    </dl>
                    <dl>
                        <dt>债券转让：</dt>
                        <dd>${detail.debtassignment}</dd>
                    </dl>
                </section>
                <section class="detaillist">
                    <dl>
                        <dt>资金托管：</dt>
                        <dd>${detail.trustfund}</dd>
                    </dl>
                    <dl>
                        <dt>投标保障：</dt>
                        <dd>${detail.bidsecurity}</dd>
                    </dl>
                    <dl>
                        <dt>保障模式：</dt>
                        <dd>${detail.securitymode}</dd>
                    </dl>
                    <dl>
                        <dt>担保机构：</dt>
                        <dd>${detail.securityinst}</dd>
                    </dl>
                </section>
            </div>
        </section>    
    </div>
    
    <!--detailmainhead-->
    <div class="detailmainhead">
        <nav class="container">
            <ul>
                <li class="active"><a href="###">数据分析</a></li>
                <li><a href="###">平台简介</a></li>
                <li><a href="###">网站备案</a></li>
                <li><a href="###">平台费用</a></li>
                <li><a href="###">联系方式</a></li>
            </ul>
        </nav>
    </div>
    
    <!--detailmainsec-->
    <div class="container overflow-xh pdl0 pdr0">
        <div class="detailmainsec_zong">
            <section class="container detailmainsec pdl0 pdr0 sjfx active">
                <div class="col-md-6">
                    <section id="develop" class="pdr0"></section>
                </div>
                <div class="col-md-6">
                    <section id="feel" class="pdl0"></section>
                </div>
                <div class="col-md-12">
                    <section id="hot" ></section>
                </div>
                <div class="col-md-12 mb0">
                    <section id="feeldeg" ></section>
                </div>
            </section>
            <section class="container pdl0 pdr0 detailmainsec" style="height:300px;"><c:if test="${fn:trim(source.description)==''}">暂无数据</c:if>${source.description}</section>
            <section class="container pdl0 pdr0 detailmainsec" style="height:300px;">暂无数据</section>
            <section class="container pdl0 pdr0 detailmainsec" style="height:300px;">
            	<dl>
    				<dt>管理费：</dt>	    				
    				<dd><c:if test="${fn:trim(detail.managecost)==''}">-</c:if>${detail.managecost}</dd>
    				<dt>充值费：</dt>
    				<dd><c:if test="${fn:trim(detail.topupcost)==''}">-</c:if>${detail.topupcost}</dd>
    				<dt>提现费：</dt>
    				<dd><c:if test="${fn:trim(detail.withdrawalcost)==''}">-</c:if>${detail.withdrawalcost}</dd>
    				<dt>vip费用：</dt>
    				<dd><c:if test="${fn:trim(detail.vipcost)==''}">-</c:if>${detail.vipcost}</dd>
    				<dt>转让费用：</dt>
    				<dd><c:if test="${fn:trim(detail.transfercost)==''}">-</c:if>${detail.transfercost}</dd>
    				<dt>支付方式：</dt>
    				<dd><c:if test="${fn:trim(detail.payway)==''}">-</c:if>${detail.payway}</dd>
	    		</dl>
            </section>
            <section class="container pdl0 pdr0 detailmainsec" style="height:300px;">暂无数据</section>
        </div>
    </div>
    
<script type="text/javascript">
    $(function(){      
        $('.detailmainhead ul li').each(function(i){
            $(this).find('a').click(function(){
                $(this).parent('li').addClass('active').siblings('li').removeClass('active');
                //$('.detailmainsec').eq(i).addClass('active').siblings('.detailmainsec').removeClass('active');
                $('.detailmainsec_zong').stop().animate({ 'left':-100*i+'%' },500);
            })    
        })
     
    })
    
    var deal = ${score.deal};
    var popular = ${score.popular};
    var income = ${score.income};
    var divergence = ${score.divergence};
    var liquidity = ${score.liquidity};
    var transparency = ${score.transparency};
    var feeling = ${score.feeling};   
    var devscore = ${score.development};
    var datasource = '${score.datasource}';
    var avgfeeling = ${avgfeeling};
        
    var fsize = ${flist.size()};
    var months = new Array();
    var pop = new Array();
    var avgpop = new Array();
 
    var good = new Array();
    var bad = new Array();
    
    <c:forEach items="${flist}" var="cur" >
    	months.push("${cur.month}");
    	pop.push("${cur.popular}");
    	avgpop.push("${cur.averpop}");
    	good.push("${cur.pos/cur.popular*100}");
    	bad.push("${cur.neg/cur.popular*100}");
    </c:forEach>
        
</script>    
<script type="text/javascript" src="${base}/resources/js/detail.js"></script>
</body>
</html>
