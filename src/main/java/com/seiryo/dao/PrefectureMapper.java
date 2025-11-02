package com.seiryo.dao;

import java.util.List;

import com.seiryo.pojo.City;
import com.seiryo.pojo.MemberData;

import org.springframework.stereotype.Repository;

import com.seiryo.pojo.Prefecture;
/**
 * DAOクラス：都道府県（Prefecture）テーブルを扱う
 */
@Repository
public interface PrefectureMapper {
	
	// すべての都道府県を検索する
	List<Prefecture> getAllPrefectures();
	// すべての都道府県を検索する
	List<MemberData> getAllPrefecturesMemberData();
	// 都道府県と市を検索する
	List<MemberData> getAllPrefecturesAndCity();
	List<Prefecture> getAllPrefecturesData();
	List<City> getAllCitysData();
	

}
