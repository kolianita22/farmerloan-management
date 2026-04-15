package com.farmer.Farmerloan.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmer.Farmerloan.model.Farmer;
import com.farmer.Farmerloan.repository.FarmerRepository;

@Service
public class FarmerService {
	 @Autowired
	    private FarmerRepository farmerRepository;

	    public Farmer saveFarmer(Farmer farmers) {
	        return farmerRepository.save(farmers);
	    }

	    public Farmer findByMobile(String mobile) {
	        return farmerRepository.findByMobile(mobile);
	    }


}
