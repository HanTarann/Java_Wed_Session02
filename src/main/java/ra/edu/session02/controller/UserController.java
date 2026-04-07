package ra.edu.session02.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @GetMapping("/loginEmployee")
    public String loginEmployeePage() {
        return "loginEmployee";
    }

    @PostMapping("/loginEmployee")
    public String doLoginEmployee(@RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  HttpSession session,
                                  Model model) {

        if (username.equals("HanTarann") && password.equals("anan123")) {
            session.setAttribute("loggedUser", username);
            session.setAttribute("role", "hr_manager");
            return "redirect:/employees";
        }

        if (username.equals("TranKhanhAn") && password.equals("trankhanhan123")) {
            session.setAttribute("loggedUser", username);
            session.setAttribute("role", "hr_staff");
            return "redirect:/employees";
        }

        model.addAttribute("errorMessage", "Sai tài khoản hoặc mật khẩu");
        return "loginEmployee";
    }

    @GetMapping("/logoutEmployee")
    public String logoutEmployee(HttpSession session) {
        session.invalidate();
        return "redirect:/loginEmployee";
    }
}