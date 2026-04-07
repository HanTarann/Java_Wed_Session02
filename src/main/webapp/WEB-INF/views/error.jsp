<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/7/2026
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<h2>Lỗi</h2>
<p>
    <c:out value="${errorMessage}"/>
</p>
<a href="<c:url value='/employees'/>">Quay lại</a>
