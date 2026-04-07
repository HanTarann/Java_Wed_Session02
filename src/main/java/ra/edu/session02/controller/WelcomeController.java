package ra.edu.session02.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {
    @GetMapping("/welcome")
    public String welcome(Model model) {
        model.addAttribute("name", "Tran Khanh An");
        return "welcome";
    }
}
