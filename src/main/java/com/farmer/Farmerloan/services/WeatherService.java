package com.farmer.Farmerloan.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.farmer.Farmerloan.model.WeatherResponse;

@Service
public class WeatherService {

	    @Value("${weather.api.key}")
	    private String apiKey;

	    public WeatherResponse getWeather(String city) {

	        WeatherResponse response = new WeatherResponse();

	        try {

	            String urlString =
	                    "https://api.openweathermap.org/data/2.5/weather?q="
	                            + city
	                            + "&appid="
	                            + apiKey
	                            + "&units=metric";

	            URL url = new URL(urlString);

	            HttpURLConnection conn =
	                    (HttpURLConnection) url.openConnection();

	            conn.setRequestMethod("GET");

	            BufferedReader reader =
	                    new BufferedReader(
	                            new InputStreamReader(conn.getInputStream()));

	            StringBuilder result = new StringBuilder();

	            String line;

	            while ((line = reader.readLine()) != null) {
	                result.append(line);
	            }

	            reader.close();

	            JSONObject json = new JSONObject(result.toString());

	            double temp =
	                    json.getJSONObject("main")
	                            .getDouble("temp");

	            int humidity =
	                    json.getJSONObject("main")
	                            .getInt("humidity");

	            double rainfall = 0;

	            if (json.has("rain")) {
	                rainfall =
	                        json.getJSONObject("rain")
	                                .optDouble("1h", 0);
	            }

	            response.setCity(city);
	            response.setTemperature(temp);
	            response.setHumidity(humidity);
	            response.setRainfall(rainfall);

	            // AI Risk Logic
	            String risk;
	            String message;

	            if (rainfall > 50 || temp > 40) {

	                risk = "HIGH";

	                message =
	                        "⚠ Severe weather detected. "
	                                + "Protect crops immediately.";

	            } else if (rainfall > 20 || humidity > 80) {

	                risk = "MEDIUM";

	                message =
	                        "⚠ Moderate weather risk. "
	                                + "Monitor crops carefully.";

	            } else {

	                risk = "LOW";

	                message =
	                        "✅ Weather conditions are normal.";

	            }

	            response.setRiskLevel(risk);
	            response.setAlertMessage(message);

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return response;
	    }
	}

}
