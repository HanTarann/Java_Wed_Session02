package ra.edu.session02.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ra.edu.session02.model.Employee;
import ra.edu.session02.service.EmployeeService;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/employees")
    public String employees(Model model, HttpSession session) {
        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/loginEmployee";
        }
        model.addAttribute("employees", employeeService.getAll());
        model.addAttribute("techSalary", employeeService.totalTechSalary());
        return "employees";
    }

    @GetMapping("/employees/{code}")
    public String detail(@PathVariable("code") String code,
                         Model model,
                         HttpSession session) {

        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/loginEmployee";
        }
        Employee emp = employeeService.findByCode(code);
        if (emp == null) {
            model.addAttribute("errorMessage", "Nhân viên " + code + " không tồn tại");
            return "error";
        }
        model.addAttribute("emp", emp);
        return "employeeDetail";
    }
}