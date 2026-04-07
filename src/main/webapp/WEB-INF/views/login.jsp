<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/7/2026
  Time: 9:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Login</title>
</head>
<body>

<h2>Đăng nhập hệ thống</h2>

<form action="login" method="post">

    Username:
    <input type="text" name="username"/>

    <br><br>

    Password:
    <input type="password" name="password"/>

    <br><br>

    <button type="submit">Login</button>

</form>

<p style="color:red">${error}</p>

</body>
</html>
