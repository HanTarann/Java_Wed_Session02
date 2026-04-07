<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%--
PHẦN 1 — PHÂN TÍCH LOGIC

# | Vị trí | Loại vấn đề | Mô tả chi tiết hậu quả
---------------------------------------------------------------------

1 | <%! private int requestCounter = 0; %> | Race Condition
Declaration tạo biến instance trong servlet JSP. JSP servlet chỉ có 1 instance
phục vụ nhiều request, nên nhiều thread có thể tăng biến cùng lúc → sai số
hoặc lỗi concurrency.

2 | <% requestCounter++; %> | Logic trong View
JSP chỉ nên hiển thị dữ liệu. Logic xử lý (tính toán, tăng biến, business logic)
nên nằm trong Controller hoặc Service, không nên đặt trong View.

3 | <%= student.getName(); %> | Expression Java trong View
Expression <%= %> khiến JSP chứa Java code. Điều này vi phạm nguyên tắc
Thin View, làm code khó bảo trì và khó đọc. Nên dùng EL ${} thay thế.

4 | <!-- <%= student.getScore() %> --> | HTML Comment vs JSP Comment
HTML comment vẫn được server xử lý trước khi gửi về client, nghĩa là Java code
vẫn chạy. Điều này có thể gây lộ dữ liệu hoặc logic không mong muốn.
Nên dùng JSP Comment <%-- --%>.

<%--5 | student.getName() in trực tiếp | XSS (Cross-Site Scripting)--%>
<%--Nếu dữ liệu tên sinh viên chứa script độc hại, ví dụ:--%>
<%--<script>alert(1)</script>--%>
<%--khi in trực tiếp sẽ gây XSS. Cần dùng <c:out> để escape HTML.--%>
<%--    --%>
<%--    6 | for (Student s : students) trong Scriptlet | Logic vòng lặp trong View--%>
<%--    Vòng lặp Java trong JSP làm view phụ thuộc Java code.--%>
<%--    Chuẩn MVC khuyến nghị dùng JSTL <c:forEach>.--%>

<%--        7 | if (score >= 5) trong Scriptlet | Logic điều kiện trong View--%>
<%--        Điều kiện Java trong JSP khiến code khó đọc và vi phạm separation of concerns.--%>
<%--        Nên dùng <c:choose> hoặc <c:if>.--%>

            <html>
            <head>
            <title>Student Report</title>
            </head>

            <body>

            <h2>Student Report</h2>

            <table border="1">

            <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Score</th>
            <th>Status</th>
            </tr>

            <%-- Lặp danh sách sinh viên bằng JSTL thay vì Java loop --%>
            <c:forEach var="student" items="${students}">

                <tr>

                    <td>
                        <c:out value="${student.id}"/>
                    </td>

                    <td>
                        <c:out value="${student.name}"/>
                    </td>

                    <td>
                        <c:out value="${student.score}"/>
                    </td>

                    <td>

                            <%-- Kiểm tra đậu / rớt bằng JSTL thay vì if Java --%>
                        <c:choose>

                            <c:when test="${student.score >= 5}">
                                Pass
                            </c:when>

                            <c:otherwise>
                                Fail
                            </c:otherwise>

                        </c:choose>

                    </td>

                </tr>

            </c:forEach>

            </table>

            </body>
            </html>