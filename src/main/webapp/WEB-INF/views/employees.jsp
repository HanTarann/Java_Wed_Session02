<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/7/2026
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%@ include file="header.jsp" %>

<h2>Danh sách nhân viên</h2>

<table border="1">

    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Phòng ban</th>
        <th>Lương</th>
        <th>Ngày vào làm</th>
        <th>Trạng thái</th>
        <th></th>
    </tr>

    <c:forEach items="${employees}" var="emp" varStatus="st">

        <tr>

            <td>${st.count}</td>

            <td><c:out value="${emp.name}"/></td>

            <td>${emp.department}</td>

            <td>
                <fmt:formatNumber value="${emp.salary}" type="number"/>
            </td>

            <td>
                <fmt:formatDate value="${emp.joinDate}" pattern="dd/MM/yyyy"/>
            </td>

            <td>

                <c:choose>

                    <c:when test="${emp.status == 'Đang làm'}">
                        <span style="color:green">${emp.status}</span>
                    </c:when>

                    <c:when test="${emp.status == 'Nghỉ phép'}">
                        <span style="color:orange">${emp.status}</span>
                    </c:when>

                    <c:otherwise>
                        <span style="color:blue">${emp.status}</span>
                    </c:otherwise>

                </c:choose>

            </td>

            <td>
                <a href="<c:url value='/employees/${emp.code}'/>">
                    Xem chi tiết
                </a>
            </td>

        </tr>

    </c:forEach>

</table>

<h3>
    Tổng lương phòng Kỹ thuật:
    <fmt:formatNumber value="${techSalary}" type="number"/>
</h3>

<%@ include file="footer.jsp" %>
