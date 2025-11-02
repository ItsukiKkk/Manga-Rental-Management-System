package com.seiryo.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.seiryo.pojo.DateDTO;


/**
 * 日付に関する処理のクラス
 */
public class DateUtils {
	
	public static void main(String[] args) {
		System.out.println(DateUtils.extractDate("2003-12-01 00:00:00"));
	}
	/**
	 * 日付文字列から年、月、日を抽出し、DateDTO オブジェクトを作成する
	 *
	 * @param dateString 日付文字列（形式：yyyy-MM-dd）
	 * @return DateDTO オブジェクト
	 */
	public static DateDTO extractDate(String dateString) {
	    // 文字列の形式を設定する
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date date = null;
	    try {
	        date = sdf.parse(dateString);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	    
	    // Dateオブジェクトから年、月、日を取得する
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date);
	    int year = calendar.get(Calendar.YEAR);
	    int month = calendar.get(Calendar.MONTH) + 1;
	    int day = calendar.get(Calendar.DAY_OF_MONTH);
	    
	    // 创建并返回 DateDTO 对象
	    DateDTO dateDTO = new DateDTO();
	    dateDTO.setYear(year);
	    dateDTO.setMonth(month);
	    dateDTO.setDay(day);
	    
	    return dateDTO;
	}
	/**
	 * DateDTOオブジェクトから年、月、日を取得し、yyyy-MM-dd形式の日付文字列を作成する
	 * @param dateDTO
	 * @return dateString 文字列
	 */
	public static String concatDate(DateDTO dateDTO) {
	    // 年、月、日を取得する
	    int year = dateDTO.getYear();
	    int month = dateDTO.getMonth();
	    int day = dateDTO.getDay();

	    // 年月日をyyyy-MM-dd形式の文字列に変換する
	    String dateString = String.format("%04d-%02d-%02d", year, month, day);
	    
	    return dateString;
	}
}
