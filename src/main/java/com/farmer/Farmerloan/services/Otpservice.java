package com.farmer.Farmerloan.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;


import org.springframework.stereotype.Service;

@Service
public class Otpservice {

    Map<String, String> otpMap = new HashMap<>();

    public String generateOtp(String mobile) {
        String otp = "" + (int)(Math.random()*900000 + 100000);

        otpMap.put(mobile, otp);

        // ✅ TEMP SOLUTION
        System.out.println("Generated OTP: " + otp);

        return otp;

        /*System.out.println("Generated OTP: " + otp); // 🔥 fallback (IMPORTANT)

        sendSms(mobile, otp); // try sending SMS

        return otp;*/
    }

    public boolean verify(String mobile, String otp) {
        return otp.equals(otpMap.get(mobile));
    }
    /*private void sendSms(String mobile, String otp) {

        try {
            String apiKey = "rNWK8VX0SDJMcHa4QRmPBbdY6Ixn1kfgyptE5vje2U3zuwlOF9RptHWQ3FNgzDO5IViTarn40Myf2b9l"; // 🔴 replace

            String message = "Your OTP is " + otp;

            String url = "https://www.fast2sms.com/dev/bulkV2";

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            con.setRequestMethod("POST");

            con.setRequestProperty("authorization", apiKey);
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            con.setDoOutput(true);

            String postData = "route=q&message=" + message +
                    "&language=english&flash=0&numbers=" + mobile;

            con.getOutputStream().write(postData.getBytes());

            // ✅ Step 1: Get response code
            int responseCode = con.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            // ✅ Step 2: Read API response (ADD THIS HERE)
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getErrorStream()));

            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }

            in.close();

            // ✅ Step 3: Print response
            System.out.println("API Response: " + response.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/
}