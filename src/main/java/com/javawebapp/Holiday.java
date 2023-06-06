package com.javawebapp;

public class Holiday {
	private String holidayName;
	private String country;
	private String holidayType;
	private String date;
	private String day;
	
	
	
	
	public Holiday(String holidayName, String country, String holidayType, String date, String day) {
		
		this.holidayName = holidayName;
		this.country = country;
		this.holidayType = holidayType;
		this.date = date;
		this.day = day;
	}
	
	public String getHolidayName() {
		return holidayName;
	}
	public void setHolidayName(String holidayName) {
		this.holidayName = holidayName;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getHolidayType() {
		return holidayType;
	}
	public void setHolidayType(String holidayType) {
		this.holidayType = holidayType;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	@Override
	public String toString() {
		return "Holiday [holidayName=" + holidayName + ", country=" + country + ", holidayType=" + holidayType
				+ ", date=" + date + ", day=" + day + "]";
	}
	
	

}
