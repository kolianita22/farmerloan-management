package com.farmer.Farmerloan.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;

import com.farmer.Farmerloan.model.Loan;

public interface LoanRepository extends JpaRepository<Loan, Long>{

	List<Loan> findByMobile(String mobile);

	
	List<Loan> findByStatus(String status);


	List<Loan> findByStatusIn(List<String> of);
	


	
	


  
}
