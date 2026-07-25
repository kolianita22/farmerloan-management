package com.farmer.Farmerloan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

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
	    public void verifyLoan(Long id) {

	        Loan loan = loanRepository.findById(id)
	                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Loan not found"));

	        
	        loan.setLandveryfied(true);
	        
	        loan.setStatus("Verified");

	        loanRepository.save(loan);
	    }

	    // Reject Loan
	    public void rejectLoan(Long id, String reason) {

	        Loan loan = loanRepository.findById(id)
	                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Loan not found"));

	        loan.setStatus("Rejected");
	        loan.setVerificationRemark(reason);

	        loanRepository.save(loan);
	    }
	    
}
