<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= basePath %>"/>
    <title>系统管理员验证</title>
</head>
<body>
    <br/>
    <br/>
    <br/>
    <div style="text-align: center">
        <h1>系统管理员验证</h1>
        <br/><br/>
        <form method="post" action="security/login">
            UserName：<input type="text" name="securityName" style="width: 120px;"/><br/><br/>
            Password：<input type="password" name="securityPwd" style="width: 120px;"/><br/><br/>
            <input type="submit" value="提交验证"/>
        </form>
    </div>
    <br/>
    <br/>
</body>
</html>
