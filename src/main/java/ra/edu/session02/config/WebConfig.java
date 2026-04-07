package ra.edu.session02.config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
/*
 * Câu 2:
 * Ban đầu cấu hình là:
 *
 * @ComponentScan(basePackages = "ra.edu.service")
 *
 * Annotation này chỉ yêu cầu Spring quét các class trong package
 * "ra.edu.service".
 *
 * Tuy nhiên các lớp Controller của Spring MVC thường nằm trong
 * package "ra.edu.controller".
 *
 * Vì package này không nằm trong phạm vi quét,
 * nên Spring không phát hiện được các lớp có annotation @Controller.
 *
 * Khi người dùng truy cập URL /welcome,
 * DispatcherServlet sẽ tìm Controller để xử lý request
 * thông qua HandlerMapping.
 *
 * Nhưng vì Controller không được đăng ký trong Spring Context,
 * nên hệ thống không thể ánh xạ URL tới Controller
 * và kết quả là trả về lỗi HTTP 404.
 *
 * Do đó cần sửa ComponentScan để quét toàn bộ package ứng dụng.
 */

@ComponentScan("ra.edu.session02")
public class WebConfig {

    @Bean
    public ViewResolver viewResolver() {

        InternalResourceViewResolver resolver =
                new InternalResourceViewResolver();

        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");

        return resolver;
    }
}
/*
 * Câu 3:
 *
 * Nếu chỉ sửa lỗi Servlet Mapping (từ "/api/*" thành "/")
 * nhưng không sửa lỗi ComponentScan,
 * thì ứng dụng vẫn không chạy đúng.
 *
 * Khi đó DispatcherServlet sẽ nhận được request "/welcome",
 * nhưng Spring vẫn không tìm thấy Controller nào để xử lý
 * vì package chứa @Controller không được quét.
 *
 * Kết quả là HandlerMapping không tìm được handler phù hợp,
 * và server vẫn trả về HTTP 404 - Not Found.
 *
 * Vì vậy cần sửa cả hai lỗi:
 *
 * 1. DispatcherServlet mapping phải là "/"
 * 2. ComponentScan phải quét đúng package chứa Controller
 *
 * Khi đó Spring MVC mới có thể:
 * DispatcherServlet -> HandlerMapping -> Controller -> ViewResolver -> View
 * và trang /welcome sẽ hiển thị đúng.
 */
