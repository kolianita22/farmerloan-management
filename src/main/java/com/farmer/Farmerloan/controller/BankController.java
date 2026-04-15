package com.farmer.Farmerloan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


import com.farmer.Farmerloan.model.Loan;
import com.farmer.Farmerloan.services.BankService;
import com.farmer.Farmerloan.services.LoanService;

@Controller
public class BankController {
	 @Autowired
	    private BankService bankService;
	   
	
	 @GetMapping("/bank-dashboard")
	 public String bankDashboard(Model model) {

	     
	     List<Loan> loans = bankService.getVerifiedLoans();

	     model.addAttribute("loans", loans);

	     model.addAttribute("total", loans.size());
	     model.addAttribute("approved", loans.stream().filter(l -> "Approved".equals(l.getStatus())).count());
	     model.addAttribute("pending", loans.stream().filter(l -> "Pending".equals(l.getStatus())).count());
	     model.addAttribute("rejected", loans.stream().filter(l -> "Rejected".equals(l.getStatus())).count());

	     return "bank-dashboard";
	 }

	    @GetMapping("/process-loan/{id}")
	    public String processLoan(@PathVariable int id) {

	        bankService.processLoan(id);

	        return "redirect:/bank-dashboard";
	    }
	    

}
