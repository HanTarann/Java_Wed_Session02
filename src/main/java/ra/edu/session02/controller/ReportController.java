package ra.edu.session02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ra.edu.session02.model.Student;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ReportController {

    @GetMapping("/report")
    public String report(Model model) {

        List<Student> students = new ArrayList<>();

        students.add(new Student(1, "An", 8.5));
        students.add(new Student(2, "Binh", 5.5));
        students.add(new Student(3, "Cuong", 9.0));

        model.addAttribute("students", students);

        return "report";
    }
}