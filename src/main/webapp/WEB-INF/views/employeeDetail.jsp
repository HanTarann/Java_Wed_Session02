<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="header.jsp" %>

<h2>Chi tiết nhân viên</h2>

<p>Mã: ${emp.code}</p>

<p>Tên: <c:out value="${emp.name}"/></p>

<p>Phòng: ${emp.department}</p>

<p>Lương:

    <c:if test="${sessionScope.role == 'hr_manager'}">
        ${emp.salary}
    </c:if>

    <c:if test="${sessionScope.role == 'hr_staff'}">
        ***
    </c:if>

</p>

<a href="<c:url value='/employees'/>">Quay lại</a>

<%@ include file="footer.jsp" %>