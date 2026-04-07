<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/7/2026
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<h2>Dang nhap he thong HR</h2>
<form action="<c:url value='/loginEmployee'/>" method="post">
    Username:
    <input type="text" name="username"/>
    <br><br>
    Password:
    <input type="password" name="password"/>
    <br><br>
    <button type="submit">Login</button>
</form>
<p style="color:red">
    <c:out value="${errorMessage}"/>
</p>