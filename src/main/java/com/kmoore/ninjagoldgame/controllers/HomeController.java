package com.kmoore.ninjagoldgame.controllers;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ArrayList;
import java.util.Random;


@Controller
public class HomeController {
    @GetMapping ("/")
    public String home(HttpSession session, Model model) {
        if (session.getAttribute("gold") == null) {
            session.setAttribute("gold", 0);
            session.setAttribute("activities", new ArrayList<String>());
        }
        model.addAttribute("gold", session.getAttribute("gold"));
        model.addAttribute("activities", session.getAttribute("activities"));
        return "index.jsp";
    }

    @PostMapping("/process")
    public String process(HttpSession session, String place) {
        Random rand = new Random();
        int gold = (int) session.getAttribute("gold");
        List<String> activities = (List<String>) session.getAttribute("activities");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String timestamp = dtf.format(now);
        int amount = 0;
        String activity = "";

        switch (place) {
            case "farm":
                amount = rand.nextInt(11) + 10;
                activity = "You entered a farm and earned " + amount + " gold. (" + timestamp + ")";
                System.out.println();
                break;
            case "cave":
                amount = rand.nextInt(6) + 5;
                activity = "You entered a cave and earned " + amount + " gold. (" + timestamp + ")";
                break;
            case "house":
                amount = rand.nextInt(4) + 2;
                activity = "You entered a house and earned " + amount + " gold. (" + timestamp + ")";
                break;
            case "quest":
                amount = rand.nextInt(101) - 50;
                if (amount >= 0) {
                    activity = "You completed a quest and earned " + amount + " gold. (" + timestamp + ")";
                } else {
                    activity = "You failed a quest and lost " + Math.abs(amount) + " gold. (" + timestamp + ")";
                }
                break;
            case "spa":
                amount = -(rand.nextInt(16) + 5);
                activity = "You visited a spa and lost " + Math.abs(amount) + " gold. (" + timestamp + ")";
                break;
            case "reset":
                session.invalidate();
                return "redirect:/";
        }

        gold += amount;
        activities.add(0, activity);
        session.setAttribute("gold", gold);
        session.setAttribute("activities", activities);

        if (gold < -100) {
            return "redirect:/debtors-prison";
        }

        return "redirect:/";
    }
    @RequestMapping("/debtors-prison")
    public String debtorsPrison(HttpSession session, Model model) {
        model.addAttribute("gold", session.getAttribute("gold"));
        return "debtorsPrison.jsp";
    }
}
