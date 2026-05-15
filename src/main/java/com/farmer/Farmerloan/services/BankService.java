package com.farmer.Farmerloan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmer.Farmerloan.model.Loan;
import com.farmer.Farmerloan.repository.LoanRepository;

@Service
public class BankService {
	
	    @Autowired
	    private LoanRepository loanRepository;

	    public List<Loan> getVerifiedLoans() {
	    	return loanRepository.findByStatusIn(
	    	        List.of("Verified", "Approved", "Rejected","Pending")
	    	    );
	    }
	    public List<Loan> getAllLoansForBank() {
	        return loanRepository.findAll(); // show all
	    }
	    public int calculateCreditScore(Loan loan) {

	        int score = 300; // base score

	        // 1. Income Factor
	        if (loan.getIncome() > 50000) {
	            score += 200;
	        } else if (loan.getIncome() > 25000) {
	            score += 150;
	        } else {
	            score += 100;
	        }

	        // 2. Land Size Factor
	        if (loan.getLandSize() > 5) {
	            score += 200;
	        } else if (loan.getLandSize() > 2) {
	            score += 150;
	        } else {
	            score += 100;
	        }

	        // 3. Loan History
	        if (!loan.isHasPreviousLoan()) {
	            score += 100; // good
	        } else {
	            score += 50;  // risk
	        }

	        return score;
	    }

	    public void processLoan(int id) {

	        Loan loan = loanRepository.findById(id).get();

	        // AUTO CREDIT SCORE
	        int creditScore = calculateCreditScore(loan);
	        loan.setCreditScore(creditScore);

	        double requestedAmount = loan.getAmount();
	        double eligibleAmount = 0;

	        if (creditScore >= 750 && requestedAmount <= 500000) {

	            eligibleAmount = requestedAmount;
	            loan.setStatus("Approved");

	        } else if (creditScore >= 650 && requestedAmount <= 300000) {

	            eligibleAmount = requestedAmount * 0.7;
	            loan.setStatus("Approved");

	        } else {

	            eligibleAmount = 0;
	            loan.setStatus("Rejected");
	        }

	        loan.setEligibleAmount(eligibleAmount);
	        loan.setBankApproved(loan.getStatus().equals("Approved"));

	        loanRepository.save(loan);
	    }
	}


