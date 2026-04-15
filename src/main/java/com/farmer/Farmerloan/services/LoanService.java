package com.farmer.Farmerloan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmer.Farmerloan.model.Loan;
import com.farmer.Farmerloan.repository.LoanRepository;

@Service
public class LoanService {
	 @Autowired
	    private LoanRepository loanRepository;

	    public void saveLoan(Loan loan) {
	    	loan.setStatus("Pending"); 
	        loanRepository.save(loan);
	    }

	    public List<Loan> getLoansByMobile(String mobile) {
	        return loanRepository.findByMobile(mobile);
	    }

	    public Loan getLoanById(int id) {
	        return loanRepository.findById(id).orElse(null);
	    }
	    public List<Loan> getAllLoans() {
	        return loanRepository.findAll();
	    }
	   

}
