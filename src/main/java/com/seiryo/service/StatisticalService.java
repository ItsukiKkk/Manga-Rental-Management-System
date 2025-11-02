package com.seiryo.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seiryo.pojo.Statistical;

/**
 * サービスインタフェース：会員統計
 */
public interface StatisticalService {
	//すべての会員統計を検索する
	List<Statistical> allStatistical();
	//会員統計ダウロード回数を更新する
	void updateStatisticalNumber(String id, int number);
	//会員統計ダウロード回数を取得する
	int getDownloadNumber(String id);
	
	File exportToExcel(String fileName, LocalDate current) throws IOException;
	void generateMonthlyReport() throws IOException;
	void insertStatistical(@Param("statistical")Statistical statistical);
}
