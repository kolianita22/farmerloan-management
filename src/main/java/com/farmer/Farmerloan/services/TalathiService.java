package com.farmer.Farmerloan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.farmer.Farmerloan.model.Loan;
import com.farmer.Farmerloan.repository.LoanRepository;

@Service
public class TalathiService {
 
	 @Autowired
	   private LoanRepository loanRepository;

	    // Get only Pending loans
	    public List<Loan> getPendingLoans() {
	        return loanRepository.findByStatus("Pending");
	    }

	    // Verify Loan
	    public void verifyLoan(int id) {

	        Loan loan = loanRepository.findById(id).get();

	        
	        loan.setLandveryfied(true);
	        
	        loan.setStatus("Verified");

	        loanRepository.save(loan);
	    }

	    // Reject Loan
	    public void rejectLoan(int id, String reason) {

	        Loan loan = loanRepository.findById(id).get();

	        loan.setStatus("Rejected");
	        loan.setVerificationRemark(reason);

	        loanRepository.save(loan);
	    }
	    @GetMapping("/loan-deatails/{id}")
	    public String printLoan(@PathVariable int id, Model model) {

	        Loan loan = loanRepository.findById(id).get();
	        model.addAttribute("loan", loan);

	        return "loan-details"
	        	;
	    }
}
