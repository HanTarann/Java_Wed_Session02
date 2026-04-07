<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/7/2026
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>
<head>
    <title>Order List</title>
</head>

<body>

<h2>
    Xin chào, ${sessionScope.loggedUser}!
    Vai trò: ${sessionScope.role}
</h2>

<a href="logout">Đăng xuất</a>

<h3>Danh sách đơn hàng</h3>

<table border="1">

    <tr>
        <th>Mã đơn</th>
        <th>Sản phẩm</th>
        <th>Tổng tiền</th>
        <th>Ngày đặt</th>
    </tr>

    <c:forEach var="o" items="${orders}">

        <tr>

            <td>${o.id}</td>

            <td>${o.productName}</td>

            <td>
                <fmt:formatNumber value="${o.totalPrice}" type="currency" currencySymbol="₫"/>
            </td>

            <td>
                <fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy"/>
            </td>

        </tr>

    </c:forEach>

</table>

<br>

<h3>
    Tổng lượt xem đơn hàng toàn hệ thống:
    ${applicationScope.totalViewCount}
</h3>

</body>
</html>
