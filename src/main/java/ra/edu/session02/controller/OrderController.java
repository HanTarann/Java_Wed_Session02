package ra.edu.session02.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ra.edu.session02.model.Order;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {

    @GetMapping("/orders")
    public String orders(HttpSession session, Model model) {

        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/login";
        }

        List<Order> orders = new ArrayList<>();

        orders.add(new Order("OD01", "Laptop", 15000000, new Date()));
        orders.add(new Order("OD02", "Chuột", 200000, new Date()));
        orders.add(new Order("OD03", "Bàn phím", 500000, new Date()));

        model.addAttribute("orders", orders);

        ServletContext application = session.getServletContext();

        synchronized (application) {
            Integer count = (Integer) application.getAttribute("totalViewCount");

            if (count == null) {
                count = 0;
            }

            count++;

            application.setAttribute("totalViewCount", count);
            model.addAttribute("totalViewCount", count);
        }

        return "orders";
    }
}