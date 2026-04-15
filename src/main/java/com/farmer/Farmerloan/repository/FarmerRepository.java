package com.farmer.Farmerloan.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.farmer.Farmerloan.model.Farmer;

@Repository
public interface FarmerRepository extends JpaRepository<Farmer, Integer> {
	 Farmer findByMobile(String mobile);

}
