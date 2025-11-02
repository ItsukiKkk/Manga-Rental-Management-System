package com.seiryo.service;

import java.util.List;

import com.seiryo.pojo.City;
import com.seiryo.pojo.MemberData;
import com.seiryo.pojo.Prefecture;

/**
 * サービスインタフェース：都道府県
 */
public interface PrefectureService {
	// すべての都道府県を検索する
	List<Prefecture> getAllPrefectures();
	// すべての都道府県を検索する
	List<MemberData> getAllPrefecturesMemberData();
	// 都道府県と市を検索する
	List<MemberData> getAllPrefecturesAndCity();
	List<Prefecture> getAllPrefecturesData();
	List<City> getAllCitysData();
}
