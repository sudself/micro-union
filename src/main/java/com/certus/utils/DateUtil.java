package com.certus.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class DateUtil {
//	private static DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'") ;  
    
	/**
	* 日期转换成字符串
	* @param date 
	* @return str
	*/
	@SuppressWarnings("deprecation")
    public static String DateToStr(int type) {
		// 1、取得本地时间：
        java.util.Calendar cal = java.util.Calendar.getInstance();

        // 2、取得时间偏移量：
        int zoneOffset = cal.get(java.util.Calendar.ZONE_OFFSET);

        // 3、取得夏令时差：
        int dstOffset = cal.get(java.util.Calendar.DST_OFFSET);

        // 4、从本地时间里扣除这些差量，即可以取得UTC时间：
        cal.add(java.util.Calendar.MILLISECOND, -(zoneOffset + dstOffset));

        // 之后调用cal.get(int x)或cal.getTimeInMillis()方法所取得的时间即是UTC标准时间。
        

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
         long currentTime=cal.getTimeInMillis();
        if(type==0){
        	 currentTime=currentTime-(20*60*1000);
        }
        Date date= new Date(currentTime);
        date.setSeconds(0);
	   return sdf.format(date);
	} 

	/**
	* 字符串转换成日期
	* @param str
	* @return date
	*/
	public static Date StrToDate(String str) {
	  
	   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   Date date = null;
	   try {
	    date = format.parse(str);
	   } catch (ParseException e) {
	    e.printStackTrace();
	   }
	   return date;
	}
	
	/*Utc时间转化为本地时间*/
	public static Date utcToLocal(String utcTime) {
		String utcTimePatten="yyyy-MM-dd'T'HH:mm'Z'";
		//String localTimePatten="yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat utcFormater = new SimpleDateFormat(utcTimePatten);
		utcFormater.setTimeZone(TimeZone.getTimeZone("UTC"));
		Date gpsUTCDate = null;
		try {
			gpsUTCDate = utcFormater.parse(utcTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return gpsUTCDate;
	}
    
}
