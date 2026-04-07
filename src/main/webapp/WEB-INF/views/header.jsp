<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/7/2026
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div>
    Xin chào ${sessionScope.loggedUser}
    |
    <a href="<c:url value='/employees'/>">Employees</a>
    |
    <a href="<c:url value='/logoutEmployee'/>">Logout</a>
    <hr>
</div>
