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

import com.farmer.Farmerloan.services.NotificationService;
import com.farmer.Farmerloan.services.TalathiService;

import jakarta.servlet.http.HttpSession;

@Controller
public class TalathiController {

	@Autowired
    private TalathiService talathiService;
	@Autowired
    private LoanRepository loanRepository; 
	@Autowired
	 private NotificationService notificationService;
	 
	 @GetMapping("/talathi-login")
	 public String talathiLoginPage() {
	     return "talathi-login";
	 }

	 @PostMapping("/talathiLogin")
	 public String login(
	         @RequestParam String username,
	         @RequestParam String password,
	         HttpSession session,
	         Model model) {

	     if("talathi".equals(username) &&
	        "1234".equals(password)) {

	         session.setAttribute("talathi", username);

	         return "redirect:/talathi-dashboard";
	     }

	     model.addAttribute("error", "Invalid Username or Password");

	     return "talathi-login";
	 }
	 @GetMapping("/talathi-dashboard")
		public String dashboard(Model model, HttpSession session) {

		    if(session.getAttribute("talathi") == null) {
		        return "redirect:/talathi-login";
		    }

		    List<Loan> loans = talathiService.getPendingLoans();
		    model.addAttribute("loans", loans);
		    model.addAttribute("notifications", notificationService.getLatest());
		    model.addAttribute("unreadCount", notificationService.getUnreadCount());

		    return "talathi-dashboard";
		}

	@GetMapping("/loan-details/{id}")
	public String loanDetails(@PathVariable Long id, Model model, HttpSession session) {

	    if (session.getAttribute("talathi") == null) {
	        return "redirect:/talathi-login";
	    }

	    Loan loan = loanRepository.findById(id).orElse(null);

	    model.addAttribute("loan", loan);

	    return "loan-details";   // JSP file name
	}
    
    // Verify
    @GetMapping("/verify/{id}")
    public String verify(@PathVariable Long id, HttpSession session) {

        if (session.getAttribute("talathi") == null) {
            return "redirect:/talathi-login";
        }

        talathiService.verifyLoan(id);
       
        notificationService.addNotification(
                "Land Record Verified for loan #" + id,
                "SUCCESS"
        ); 

        return "redirect:/talathi-dashboard";
    }

    // Reject
    @PostMapping("/reject/{id}")
    public String reject(@PathVariable Long id, @RequestParam String reason, HttpSession session) {

        if (session.getAttribute("talathi") == null) {
            return "redirect:/talathi-login";
        }

        talathiService.rejectLoan(id, reason);
        notificationService.addNotification(
                "Land Record Verification Rejected for loan #" + id + ": " + reason,
                "DANGER"
        );
        return "redirect:/talathi-dashboard";
    }
}
