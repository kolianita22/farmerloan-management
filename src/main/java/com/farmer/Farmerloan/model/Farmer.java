package com.farmer.Farmerloan.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Farmer {
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;
        private String name;
	    private String mobile;
	    private String aadhaar;
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getMobile() {
			return mobile;
		}
		public void setMobile(String mobile) {
			this.mobile = mobile;
		}
		public String getAadhaar() {
			return aadhaar;
		}
		public void setAadhaar(String aadhaar) {
			this.aadhaar = aadhaar;
		}
		

}
