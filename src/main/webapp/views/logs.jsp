<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= basePath %>"/>
    <title>日志列表</title>
</head>
<body>
    <br/>
    <br/>
    <br/>
    <div style="text-align: center">
        <h1>日志列表</h1>
        <br/><br/>
        <ul style="list-style: circle;">
            <c:forEach items="${logs}" var="log">
                <li style="height: 20px;"><a href="logs/${log}">${log}</a></li>
            </c:forEach>
        </ul>
    </div>
    <br/>
    <br/>
</body>
</html>
