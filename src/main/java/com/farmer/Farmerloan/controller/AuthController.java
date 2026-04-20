package com.farmer.Farmerloan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.farmer.Farmerloan.model.Farmer;
import com.farmer.Farmerloan.services.FarmerService;
import com.farmer.Farmerloan.services.Otpservice;


import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {
	@Autowired
    private FarmerService farmerService;

    @Autowired
    private Otpservice otpService;
    
    @GetMapping("/")
    public String home() {
        return "home";
    }
    

    // 1. Open Login Page
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }
    @GetMapping("/register")
    public String showRegisterPage() {
        return "register"; // loads register.jsp
    }
    @PostMapping("/register")
    public String registerUser(@RequestParam String name,
                               @RequestParam String mobile,
                               @RequestParam String aadhaar) {

        System.out.println(name + " " + mobile + " " + aadhaar);

        // Save to database here

        return "redirect:/login";
    }
  
    @PostMapping("/send-otp")
    public String sendOtp(@RequestParam String name,
                          @RequestParam String mobile,
                          @RequestParam String aadhaar,
                          Model model) {

        otpService.generateOtp(mobile);

        //pass data to next page
        model.addAttribute("name", name);
        model.addAttribute("mobile", mobile);
        model.addAttribute("aadhaar", aadhaar);
        model.addAttribute("error", "Invalid OTP");

        return "verify-otp";
    }

    @PostMapping("/verify-otp")
    public String verifyOtp(@RequestParam String name,
                            @RequestParam String mobile,
                            @RequestParam String aadhaar,
                            @RequestParam String otp,
                            HttpSession session) {

        boolean isValid = otpService.verify(mobile, otp);

        if (isValid) {

            Farmer farmer = farmerService.findByMobile(mobile);

            if (farmer == null) {
                farmer = new Farmer();
                farmer.setName(name);
                farmer.setMobile(mobile);
                farmer.setAadhaar(aadhaar);

                farmerService.saveFarmer(farmer);
            }

            // ✅ FIX 1: store mobile in session
            session.setAttribute("mobile", mobile);

            // (optional)
            session.setAttribute("user", name);

            // ✅ FIX 2: redirect (not direct return)
            return "redirect:/dashboard";
        }
        
        return "verify-otp";
    }

}
