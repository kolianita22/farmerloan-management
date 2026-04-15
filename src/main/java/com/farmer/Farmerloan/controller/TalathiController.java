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
import com.farmer.Farmerloan.services.LoanService;
import com.farmer.Farmerloan.services.TalathiService;

@Controller
public class TalathiController {

	@Autowired
    private TalathiService talathiService;
	@Autowired
    private LoanRepository loanRepository;  
	
	
	@GetMapping("/loan-details/{id}")
	public String loanDetails(@PathVariable int id, Model model) {

	    Loan loan = loanRepository.findById(id).orElse(null);

	    model.addAttribute("loan", loan);

	    return "loan-details";   // JSP file name
	}
    
    @GetMapping("/talathi-dashboard")
    public String dashboard(Model model) {

        List<Loan> loans = talathiService.getPendingLoans();
        model.addAttribute("loans", loans);

        return "talathi-dashboard";
    }

    // Verify
    @GetMapping("/verify/{id}")
    public String verify(@PathVariable int id) {

        talathiService.verifyLoan(id);

        return "redirect:/talathi-dashboard";
    }

    // Reject
    @GetMapping("/reject/{id}")
    public String reject(@PathVariable int id) {

        talathiService.rejectLoan(id, "Invalid Documents");

        return "redirect:/talathi-dashboard";
    }
    @PostMapping("/reject/{id}")
    public String reject(@PathVariable int id, @RequestParam String reason) {
        talathiService.rejectLoan(id, reason);
        return "redirect:/talathi-dashboard";
    }
    
}
