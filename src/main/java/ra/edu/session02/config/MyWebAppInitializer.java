package ra.edu.session02.config;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MyWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return null;
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{WebConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        /*
         * Câu 1:
         * Ban đầu mapping được cấu hình là "/api/*".
         *
         * Điều này có nghĩa DispatcherServlet chỉ xử lý các request
         * có URL bắt đầu bằng "/api/".
         *
         * Ví dụ:
         * /api/users
         * /api/products
         * /api/welcome
         *
         * Tuy nhiên khi người dùng truy cập:
         * http://localhost:8080/demo/welcome
         *
         * URL này không bắt đầu bằng "/api/",
         * nên request sẽ không được gửi tới DispatcherServlet.
         *
         * Tomcat sẽ cố tìm tài nguyên tương ứng nhưng không có,
         * nên server trả về lỗi HTTP 404 - Not Found.
         *
         * Vì vậy DispatcherServlet cần được cấu hình mapping "/"
         * để lắng nghe toàn bộ request của ứng dụng.
         */
        return new String[]{"/"};
    }
}