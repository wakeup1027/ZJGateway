package com.solar.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class  CustomUtils {
	public static String addDay(String stringDate){
		try  
		{  
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date = sdf.parse(stringDate);  
		    Calendar cal = Calendar.getInstance();  
	        cal.setTime(date);  
	        cal.add(Calendar.DAY_OF_YEAR, 1);  
	        return sdf.format(cal.getTime()); 
		}  
		catch (ParseException e)  
		{  
		    System.out.println(e.getMessage());  
		    return "";
		} 
	}
}
