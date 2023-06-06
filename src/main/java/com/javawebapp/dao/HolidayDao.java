package com.javawebapp.dao;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.javawebapp.Holiday;

public class HolidayDao {
	
	
	public static Holiday getHoliday(String country) throws Exception{
		
		
		LocalDate  now = LocalDate.now();
		
		String s = now.toString();
		
		String [] v = s.split("-");

        int year = Integer.parseInt(v[0]);
        int month = Integer.parseInt(v[1]);


        int day = Integer.parseInt(v[2]);
		
		
		
		HttpRequest reqIndia = HttpRequest.newBuilder()
                .uri(new URI("https://holidays.abstractapi.com/v1/?api_key=d46a0d62897c4306a16a73abac72a566&country="+country+"&year="+year+"&month="+month+"&day="+day))
                .GET()
                .build();

        HttpClient client = HttpClient.newHttpClient();
        HttpResponse<String> resIndia = client.send(reqIndia, HttpResponse.BodyHandlers.ofString());
        
        
       List<Holiday> list = new ArrayList<>();
        Object obj= JSONValue.parse(resIndia.body());
        JSONArray jsonArray = (JSONArray) obj;
        
        Holiday h = null;
        if(jsonArray.size() > 0){       	
            JSONObject jsonObject = (JSONObject) jsonArray.get(0);
            String holidayName = String.valueOf(jsonObject.get("name"));
            String location = String.valueOf(jsonObject.get("location"));
            String type = String.valueOf(jsonObject.get("type"));
            String dt = String.valueOf(jsonObject.get("date"));
            String dy = String.valueOf(jsonObject.get("week_day"));
            h = new Holiday(holidayName,location,type,dt,dy);
            
            
        }else{
        	h = new Holiday("N/A","N/A","N/A","N/A","N/A");
        	
        }
        
        
        
       
        
		
		return h;
		
	}
	
	


}
