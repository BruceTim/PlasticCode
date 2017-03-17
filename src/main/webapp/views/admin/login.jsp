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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login</title>

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Varela+Round">
    <link rel="stylesheet" href="resources/css/login.css" >
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>

<body>

<div id="login">

    <h2><span class="fontawesome-lock"></span>Sign In</h2>

    <form action="users/login" method="POST">

        <fieldset>

            <p><label for="username">E-mail address</label></p>
            <p><input type="text" id="username" name="username" value=""></p> <!-- JS because of IE support; better: placeholder="mail@address.com" -->

            <p><label for="password">Password</label></p>
            <p><input type="password" id="password" name="password" value="" /></p> <!-- JS because of IE support; better: placeholder="password" -->

            <p><input type="submit" value="Sign In"></p>

        </fieldset>

    </form>

</div> <!-- end login -->

</body>
</html>