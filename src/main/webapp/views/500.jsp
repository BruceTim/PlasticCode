<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en-US">
<head>
    <base href="<%=basePath %>">
    <meta charset="utf-8">

    <title>Login</title>

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Varela+Round">
    <link rel="stylesheet" href="resources/css/login.css" >
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>

<body>
<br/><br/><br/>
<div align="center"> <h3>抱歉，系统错误，请联系管理员</h3></div>
<br/><br/><br/>
</body>
</html>