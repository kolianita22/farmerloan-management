package com.farmer.Farmerloan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.farmer.Farmerloan.model.WeatherResponse;
import com.farmer.Farmerloan.services.WeatherService;

@Controller
public class WeatherController {
	
	    @Autowired
	    private WeatherService weatherService;

	    @GetMapping("/weather")
	    public String weatherPage(
	            @RequestParam(defaultValue = "Jalgaon")
	            String city,
	            Model model) {

	        WeatherResponse weather =
	                weatherService.getWeather(city);

	        model.addAttribute("weather", weather);

	        return "weather";
	    }
	}


