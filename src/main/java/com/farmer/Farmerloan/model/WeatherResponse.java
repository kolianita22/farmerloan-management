package com.farmer.Farmerloan.model;

public class WeatherResponse {
	
	    private String city;
	    private double temperature;
	    private int humidity;
	    private double rainfall;
	    private String riskLevel;
	    private String alertMessage;
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public double getTemperature() {
			return temperature;
		}
		public void setTemperature(double temperature) {
			this.temperature = temperature;
		}
		public int getHumidity() {
			return humidity;
		}
		public void setHumidity(int humidity) {
			this.humidity = humidity;
		}
		public double getRainfall() {
			return rainfall;
		}
		public void setRainfall(double rainfall) {
			this.rainfall = rainfall;
		}
		public String getRiskLevel() {
			return riskLevel;
		}
		public void setRiskLevel(String riskLevel) {
			this.riskLevel = riskLevel;
		}
		public String getAlertMessage() {
			return alertMessage;
		}
		public void setAlertMessage(String alertMessage) {
			this.alertMessage = alertMessage;
		}

	   

}
