package com.farmer.Farmerloan.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class Otpservice {

    private final Map<String, String> otpMap = new HashMap<>();

    @Value("${sms.api.key:}")
    private String apiKey;

    public String generateOtp(String mobile) {
        String otp = String.format("%06d", (int)(Math.random() * 900000 + 100000));
        otpMap.put(mobile, otp);

        System.out.println("==========================================");
        System.out.println("  OTP Generated for " + mobile + ": " + otp);
        System.out.println("==========================================");

        // Send real SMS if SMS API key is configured
        if (apiKey != null && !apiKey.trim().isEmpty()) {
            sendSms(mobile, otp);
        }

        return otp;
    }

    public boolean verify(String mobile, String otp) {
        if (mobile == null || otp == null) return false;
        String storedOtp = otpMap.get(mobile);
        if (otp.trim().equals(storedOtp)) {
            otpMap.remove(mobile); // One-time use verification
            return true;
        }
        return false;
    }

    public void sendSms(String mobile, String otp) {
        try {
            String message = URLEncoder.encode("Kisan Rin Yojana: Your OTP for login is " + otp + ". Do not share it with anyone.", StandardCharsets.UTF_8);
            String urlStr = "https://www.fast2sms.com/dev/bulkV2?authorization=" + apiKey.trim() +
                            "&route=q&message=" + message +
                            "&language=english&flash=0&numbers=" + mobile.trim();

            URL obj = new URL(urlStr);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("User-Agent", "Mozilla/5.0");
            con.setConnectTimeout(5000);
            con.setReadTimeout(5000);

            int responseCode = con.getResponseCode();
            System.out.println("SMS API Response Code: " + responseCode);

            BufferedReader in = new BufferedReader(new InputStreamReader(
                    responseCode >= 400 ? con.getErrorStream() : con.getInputStream()));
            StringBuilder response = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            System.out.println("SMS API Response Body: " + response.toString());

        } catch (Exception e) {
            System.err.println("Failed to send SMS to " + mobile + ": " + e.getMessage());
        }
    }
}