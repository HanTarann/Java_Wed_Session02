# Phân tích Scope và Race Condition

## 1. Tại sao thông báo lỗi đăng nhập phải lưu vào Request Scope?

Thông báo lỗi đăng nhập chỉ cần tồn tại trong một request khi người dùng nhập sai mật khẩu.

Nếu lưu vào Session Scope, thông báo lỗi sẽ tồn tại suốt phiên làm việc và tiếp tục hiển thị kể cả khi người dùng đã đăng nhập thành công hoặc chuyển trang khác.

Do đó Request Scope là phù hợp vì nó chỉ tồn tại trong một lần request-response.

---

## 2. Tại sao totalViewCount phải lưu vào Application Scope?

Application Scope được chia sẻ cho toàn bộ người dùng trong hệ thống.

Do đó biến totalViewCount sẽ được dùng chung cho tất cả nhân viên và thể hiện tổng số lượt xem đơn hàng toàn hệ thống.

Nếu lưu vào Session Scope, mỗi nhân viên sẽ có một bộ đếm riêng.

Ví dụ:
Nhân viên A xem 3 lần → thấy 3  
Nhân viên B xem 1 lần → thấy 1

Như vậy không phản ánh tổng lượt xem thực tế của hệ thống.

---

## 3. Race Condition là gì?

Race Condition xảy ra khi nhiều thread truy cập và thay đổi cùng một dữ liệu đồng thời, dẫn đến kết quả sai.

Ví dụ code:

Integer count = (Integer) application.getAttribute("totalViewCount");
if (count == null) count = 0;
count++;
application.setAttribute("totalViewCount", count);

Nếu 2 người truy cập cùng lúc:

Thread A đọc count = 5  
Thread B đọc count = 5

A tăng thành 6  
B cũng tăng thành 6

Kết quả cuối cùng là 6 thay vì 7.

---

## 4. Cách phòng tránh Race Condition

Sử dụng synchronized để đảm bảo chỉ một thread được cập nhật biến tại một thời điểm.

Ví dụ:

synchronized(application){

Integer count = (Integer) application.getAttribute("totalViewCount");

if(count == null){
count = 0;
}

count++;

application.setAttribute("totalViewCount",count);

}