package com.farmer.Farmerloan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.farmer.Farmerloan.model.Loan;
import com.farmer.Farmerloan.repository.LoanRepository;
import com.farmer.Farmerloan.services.BankService;
import com.farmer.Farmerloan.services.NotificationService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BankController {

    @Autowired
    private BankService bankService;
    @Autowired
    private LoanRepository loanRepository;
    @Autowired
    private NotificationService notificationService;

    @GetMapping("/bank-login")
    public String bankLoginPage() {
        return "bank-login";
    }

    @PostMapping("/bankLogin")
    public String bankLogin(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        if ("bank".equals(username) && "1234".equals(password)) {
            session.setAttribute("bank", username);
            return "redirect:/bank-dashboard";
        }

        model.addAttribute("error", "Invalid Username or Password");
        return "bank-login";
    }

    @GetMapping("/bank-dashboard")
    public String bankDashboard(Model model, HttpSession session) {

        if (session.getAttribute("bank") == null) {
            return "redirect:/bank-login";
        }

        List<Loan> loans = bankService.getVerifiedLoans();

        model.addAttribute("loans", loans);
        model.addAttribute("total", loans.size());
        model.addAttribute("approved", loans.stream().filter(l -> "Approved".equals(l.getStatus())).count());
        model.addAttribute("pending", loans.stream().filter(l -> "Pending".equals(l.getStatus())).count());
        model.addAttribute("rejected", loans.stream().filter(l -> "Rejected".equals(l.getStatus())).count());
        model.addAttribute("notifications", notificationService.getLatest());
        model.addAttribute("unreadCount", notificationService.getUnreadCount());

        return "bank-dashboard";
    }

    @GetMapping("/process-loan/{id}")
    public String processLoan(@PathVariable Long id, HttpSession session) {

        if (session.getAttribute("bank") == null) {
            return "redirect:/bank-login";
        }

        bankService.processLoan(id);

        Loan loan = loanRepository.findById(id).orElse(null);
        if (loan != null) {
            if ("Approved".equalsIgnoreCase(loan.getStatus())) {
                notificationService.addNotification("Loan #" + id + " Approved & Sanctioned by Bank (₹" + loan.getEligibleAmount() + ")", "SUCCESS");
            } else {
                notificationService.addNotification("Loan #" + id + " Declined by Bank", "DANGER");
            }
        }

        return "redirect:/bank-dashboard";
    }
}
