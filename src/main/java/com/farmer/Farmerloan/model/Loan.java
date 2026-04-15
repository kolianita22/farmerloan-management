package com.farmer.Farmerloan.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Loan {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Long id;

    private String mobile;
    private String crop;
    private Double amount;
    private String season;
    private String status;
    
    private String aadhaarPath;
    private String landDocPath;
    private String bankPath;
    
    private double income;
    @Column(name = "land_size")
    private double landSize;
    private boolean hasPreviousLoan;
   
    //for Talathi
    private boolean landveryfied;
    private String verificationRemark;
    
    //for Bank
    private int creditScore;
    private double eligibleAmount;
    private boolean bankApproved;
    public double getIncome() {
		return income;
	}
	public void setIncome(double income) {
		this.income = income;
	}
	public double getLandSize() {
		return landSize;
	}
	public void setLandSize(double landSize) {
		this.landSize = landSize;
	}
	
    
    public int getCreditScore() {
		return creditScore;
	}
	public void setCreditScore(int creditScore) {
		this.creditScore = creditScore;
	}
	public double getEligibleAmount() {
		return eligibleAmount;
	}
	public void setEligibleAmount(double eligibleAmount) {
		this.eligibleAmount = eligibleAmount;
	}
	public boolean isBankApproved() {
		return bankApproved;
	}
	public void setBankApproved(boolean bankApproved) {
		this.bankApproved = bankApproved;
	}
	
    public boolean isLandveryfied() {
		return landveryfied;
	}
	public void setLandveryfied(boolean landveryfied) {
		this.landveryfied = landveryfied;
	}
	public String getAadhaarPath() {
		return aadhaarPath;
	}
	public void setAadhaarPath(String aadhaarPath) {
		this.aadhaarPath = aadhaarPath;
	}
	public String getLandDocPath() {
		return landDocPath;
	}
	public void setLandDocPath(String landDocPath) {
		this.landDocPath = landDocPath;
	}
	
	
    public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCrop() {
		return crop;
	}
	public void setCrop(String crop) {
		this.crop = crop;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getVerificationRemark() {
		return verificationRemark;
	}
	public void setVerificationRemark(String verificationRemark) {
		this.verificationRemark = verificationRemark;
	}
	public boolean isHasPreviousLoan() {
		return hasPreviousLoan;
	}
	public void setHasPreviousLoan(boolean hasPreviousLoan) {
		this.hasPreviousLoan = hasPreviousLoan;
	}
	public String getBankPath() {
		return bankPath;
	}
	public void setBankPath(String bankPath) {
		this.bankPath = bankPath;
	}
	
	

}
