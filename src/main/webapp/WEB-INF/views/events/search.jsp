<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/7/2026
  Time: 9:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<html>
<head>
    <title>Kết quả tìm kiếm</title>

    <style>
        table{
            border-collapse: collapse;
            width: 100%;
        }

        th,td{
            border:1px solid #ccc;
            padding:8px;
            text-align:center;
        }

        .free{
            color:green;
            font-weight:bold;
        }

        .soldout{
            color:red;
            font-weight:bold;
        }

        .low{
            color:orange;
        }

        .available{
            color:green;
        }

        .disabled{
            color:gray;
            pointer-events:none;
            text-decoration:none;
        }
    </style>

</head>

<body>

<h2>
    Kết quả tìm kiếm cho:
    <c:out value="${keyword}" escapeXml="true"/>
</h2>

<p>
    Tìm thấy <c:out value="${fn:length(events)}"/> sự kiện
</p>

<!-- Nếu không có kết quả -->
<c:if test="${empty events}">
    <p>Không tìm thấy sự kiện nào phù hợp.</p>
</c:if>

<!-- Nếu có dữ liệu -->
<c:if test="${not empty events}">

    <table>

        <thead>
        <tr>
            <th>STT</th>
            <th>Tên sự kiện</th>
            <th>Ngày tổ chức</th>
            <th>Giá vé</th>
            <th>Vé còn lại</th>
            <th>Thao tác</th>
        </tr>
        </thead>

        <tbody>

        <c:forEach items="${events}" var="event" varStatus="status">

            <tr>

                <!-- STT -->
                <td>${status.count}</td>

                <!-- tên sự kiện -->
                <td>
                    <c:out value="${event.name}" escapeXml="true"/>
                </td>

                <!-- ngày -->
                <td>
                    <c:out value="${event.date}"/>
                </td>

                <!-- giá -->
                <td>

                    <c:choose>

                        <c:when test="${event.price == 0}">
                            <span class="free">MIỄN PHÍ</span>
                        </c:when>

                        <c:otherwise>
                            <fmt:formatNumber value="${event.price}" type="number"/>
                        </c:otherwise>

                    </c:choose>

                </td>

                <!-- vé còn -->
                <td>

                    <c:choose>

                        <c:when test="${event.remainingTickets == 0}">
                            <span class="soldout">HẾT VÉ</span>
                        </c:when>

                        <c:when test="${event.remainingTickets < 10}">
                        <span class="low">
                            Sắp hết (còn ${event.remainingTickets} vé)
                        </span>
                        </c:when>

                        <c:otherwise>
                        <span class="available">
                                ${event.remainingTickets}
                        </span>
                        </c:otherwise>

                    </c:choose>

                </td>

                <!-- thao tác -->
                <td>

                    <c:choose>

                        <c:when test="${event.remainingTickets == 0}">
                            <a class="disabled">Đặt vé</a>
                        </c:when>

                        <c:otherwise>

                            <a href="<c:url value='/events/${event.id}/book'/>">
                                Đặt vé
                            </a>

                        </c:otherwise>

                    </c:choose>

                </td>

            </tr>

        </c:forEach>

        </tbody>

    </table>

</c:if>


<hr>


<!-- footer -->

<c:if test="${not empty events}">
    <p>
        Sự kiện đầu tiên:
            ${fn:toUpperCase(events[0].name)}
    </p>
</c:if>

<p>
    Độ dài keyword:
    ${fn:length(keyword)} ký tự
</p>

</body>
</html>
