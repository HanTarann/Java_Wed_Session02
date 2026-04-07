package ra.edu.session02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class EventController {

    @GetMapping("/events/search")
    public String search(@RequestParam(value = "keyword", required = false) String keyword, Model model) {

        List<Map<String, Object>> events = new ArrayList<>();

        Map<String, Object> e1 = new HashMap<>();
        e1.put("id", 1);
        e1.put("name", "Spring Framework");
        e1.put("date", "20-10-2025");
        e1.put("price", 0);
        e1.put("remainingTickets", 50);

        Map<String, Object> e2 = new HashMap<>();
        e2.put("id", 2);
        e2.put("name", "Java Conference");
        e2.put("date", "25-10-2025");
        e2.put("price", 500000);
        e2.put("remainingTickets", 5);

        Map<String, Object> e3 = new HashMap<>();
        e3.put("id", 3);
        e3.put("name", "Tech Talk");
        e3.put("date", "30-10-2025");
        e3.put("price", 200000);
        e3.put("remainingTickets", 0);

        events.add(e1);
        events.add(e2);
        events.add(e3);

        if (keyword != null && !keyword.trim().isEmpty()) {

            List<Map<String, Object>> filtered = new ArrayList<>();

            for (Map<String, Object> event : events) {
                String name = event.get("name").toString();

                if (name.toLowerCase().contains(keyword.toLowerCase())) {
                    filtered.add(event);
                }
            }

            events = filtered;
        }

        model.addAttribute("keyword", keyword);
        model.addAttribute("events", events);

        return "events/search";
    }
}