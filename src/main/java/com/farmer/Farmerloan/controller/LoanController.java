package com.farmer.Farmerloan.controller;

import java.io.*;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.farmer.Farmerloan.model.Loan;
import com.farmer.Farmerloan.services.LoanService;
import com.farmer.Farmerloan.services.NotificationService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoanController {

    @Autowired
    private LoanService loanService; 
    @GetMapping("/track-loan")
    public String trackPage() {
        return "track-loan";
    }

    // 👉 TRACK RESULT
    @PostMapping("/track-loan")
    public String trackLoan(@RequestParam String mobile, Model model) {

        List<Loan> loans = loanService.getLoansByMobile(mobile);

        model.addAttribute("loans", loans);

        return "track-loan";
    }

    // Show Loan Form
    @GetMapping("/loan")
    public String showLoanForm(HttpSession session) {

        if (session.getAttribute("mobile") == null) {
            return "redirect:/login";
        }

        return "loan";
    }
    @GetMapping("/myLoan")
    public String myLoans(HttpSession session, Model model) {

        String mobile = (String) session.getAttribute("mobile");

        model.addAttribute("loans", loanService.getLoansByMobile(mobile));

        return "my-loan";
    }
    // Apply Loan
    @PostMapping("/applyLoan")
    public String applyLoan(
            @RequestParam MultipartFile aadhaarFile,
            @RequestParam MultipartFile landFile,
            @RequestParam MultipartFile bankFile,
            @RequestParam String crop,
            @RequestParam double amount,
            @RequestParam String season,
            @RequestParam double income,
            @RequestParam double landSize,
            HttpSession session
    ) throws IOException {

        String mobile = (String) session.getAttribute("mobile");

        if (mobile == null) {
            return "redirect:/login";
        }

        String uploadDir = System.getProperty("user.dir") + "/uploads/";
        File dir = new File(uploadDir);
        if (!dir.exists()) dir.mkdirs();

        // Unique file names (BEST)
        String aadhaarName = UUID.randomUUID() + "_" + aadhaarFile.getOriginalFilename();
        String landName = UUID.randomUUID() + "_" + landFile.getOriginalFilename();
        String bankName = UUID.randomUUID() + "_" + bankFile.getOriginalFilename();

        // SAVE FILES
        aadhaarFile.transferTo(new File(uploadDir + aadhaarName));
        landFile.transferTo(new File(uploadDir + landName));
        bankFile.transferTo(new File(uploadDir + bankName));

        // SAVE DATA
        Loan loan = new Loan();
        loan.setCrop(crop);
        loan.setAmount(amount);
        loan.setSeason(season);
        loan.setMobile(mobile);
        loan.setIncome(income);
        loan.setLandSize(landSize);

        loan.setAadhaarPath(aadhaarName);
        loan.setLandDocPath(landName);
        loan.setBankPath(bankName);
        

        loanService.saveLoan(loan);

        return "redirect:/dashboard";
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model,HttpSession session) {

    	 if(session.getAttribute("mobile") == null) {
             return "redirect:/login";
         }
        List<Loan> loans = loanService.getAllLoans();
       

        long approvedCount = loans.stream()
                .filter(l -> "Approved".equalsIgnoreCase(l.getStatus()))
                .count();
       

        long pendingCount = loans.stream()
                .filter(l -> "Pending".equalsIgnoreCase(l.getStatus()))
                .count();

        long rejectedCount = loans.stream()
                .filter(l -> "Rejected".equalsIgnoreCase(l.getStatus()))
                .count();

        model.addAttribute("loans", loans);
        model.addAttribute("total", loans.size());
        model.addAttribute("approved", approvedCount);
        model.addAttribute("pending", pendingCount);
        model.addAttribute("rejected", rejectedCount);
        
        

        return "dashboard";
    }
    // Download File (SAFE)
    @GetMapping("/download/{type}/{id}")
    public void downloadFile(@PathVariable String type,
                             @PathVariable Long id,
                             HttpServletResponse response) throws IOException {

        Loan loan = loanService.getLoanById(id);

        if (loan == null) {
            response.getWriter().write("Loan not found");
            return;
        }

        String uploadDir = System.getProperty("user.dir") + "/uploads/";
        String fileName = "";

        switch (type) {
            case "aadhaar":
                fileName = loan.getAadhaarPath();
                break;
            case "land":
                fileName = loan.getLandDocPath();
                break;
            case "bank":
                fileName = loan.getBankPath();
                break;
            default:
                response.getWriter().write("Invalid file type");
                return;
        }

        if (fileName == null || fileName.trim().isEmpty()) {
            response.getWriter().write("File not found");
            return;
        }

        File baseDir = new File(uploadDir);
        File file = new File(baseDir, fileName);

        if (!file.exists() || !file.getCanonicalPath().startsWith(baseDir.getCanonicalPath())) {
            response.getWriter().write("File not found");
            return;
        }

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "inline; filename=" + file.getName());

        FileInputStream fis = new FileInputStream(file);
        OutputStream os = response.getOutputStream();

        byte[] buffer = new byte[1024];
        int bytesRead;

        while ((bytesRead = fis.read(buffer)) != -1) {
            os.write(buffer, 0, bytesRead);
        }

        fis.close();
        os.flush();
    }

    // View Photo
    @GetMapping("/view/photo/{id}")
    public void viewPhoto(@PathVariable Long id, HttpServletResponse response) throws IOException {

        Loan loan = loanService.getLoanById(id);

        if (loan == null || loan.getBankPath() == null) {
            response.getWriter().write("Not found");
            return;
        }

        String uploadDir = System.getProperty("user.dir") + "/uploads/";
        File baseDir = new File(uploadDir);
        File file = new File(baseDir, loan.getBankPath());

        if (!file.exists() || !file.getCanonicalPath().startsWith(baseDir.getCanonicalPath())) {
            response.getWriter().write("Image not found");
            return;
        }

        response.setContentType("image/jpeg");

        FileInputStream fis = new FileInputStream(file);
        OutputStream os = response.getOutputStream();

        byte[] buffer = new byte[1024];
        int bytesRead;

        while ((bytesRead = fis.read(buffer)) != -1) {
            os.write(buffer, 0, bytesRead);
        }

        fis.close();
        os.flush();
    }
    
 
    //  Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}