<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

    <head>
        <base href="<%=basePath%>">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
        <link href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/admin/index.css" />
        <script src="resources/plugins/ckeditor/ckeditor.js" type="text/javascript" charset="utf-8"></script>
        <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style type="text/css">
        	body {
        		margin: 20px 50px;
        	}
        </style>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
				<h1>
					<c:if test="${email.urgent}">
						<label class="font-color-red">${email.subject}----请24小时内回复</label>
					</c:if>
					<c:if test="${!email.urgent}">
						${email.subject}
					</c:if>
				</h1>
				<h4>询盘人：${email.sender}</h4>
				<h4>时间：<fmt:formatDate value="${email.createTime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></h4>
			</div><br/>
			<div class="row" style="background-color: #B2DBA1">
				<p>${email.content}</p>
			</div><br/>
			<div class="row">
				<p><label>称呼：${email.senderName}</label></p>
			    <p><label>公司名称：${email.senderCompany}</label></p>
			    <p><label>联系电话：${email.senderPhone}</label></p>
			    <p><label>传真：${email.senderFax}</label></p>
			    <p><label>公司网址：${email.website}</label></p>
			    <p><label>国家：${email.senderCountry}</label></p>
			    <p><label>价格条款：${email.priceTerms}</label></p>
			    <p><label>付款方式：${email.payment}</label></p>
			    <p><label>初始订单：${email.initialOrder}</label></p>
			    <p><label>样品：${email.sampleTerms}</label></p>
			    <p><label>是否需要产品详情：<c:if test="${email.specification}">是</c:if><c:if test="${!email.specification}">否</c:if></label></p>
			    <p><label>是否需要本公司介绍：<c:if test="${email.companyDescription}">是</c:if><c:if test="${!email.companyDescription}">否</c:if></label></p>
			    <p><label>是否需要发货期限：<c:if test="${email.deliverTime}">是</c:if><c:if test="${!email.deliverTime}">否</c:if></label></p>
			    <p><label>是否紧急（24小时内联系）：<c:if test="${email.urgent}">是</c:if><c:if test="${!email.urgent}">否</c:if></label></p>
			    <c:if test="${email.file1 != null}"><p><img src="${email.file1}"></p></c:if>
			    <c:if test="${email.file2 != null}"><p><img src="${email.file2}"></p></c:if>
			    <c:if test="${email.file3 != null}"><p><img src="${email.file3}"></p></c:if>
			</div>
        </div>

        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </body>

</html>
