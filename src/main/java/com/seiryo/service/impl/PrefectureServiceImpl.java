package com.seiryo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seiryo.dao.PrefectureMapper;
import com.seiryo.pojo.City;
import com.seiryo.pojo.MemberData;
import com.seiryo.pojo.Prefecture;
import com.seiryo.service.PrefectureService;
/**
 * サービス実装クラス：都道府県
 */
@Service
@Transactional
public class PrefectureServiceImpl implements PrefectureService{
	@Autowired
	PrefectureMapper prefectureMapper;
	
	@Override
	public List<Prefecture> getAllPrefectures() {
		return prefectureMapper.getAllPrefectures();
	}

	@Override
	public List<MemberData> getAllPrefecturesAndCity() {
		return prefectureMapper.getAllPrefecturesAndCity();
	}

	@Override
	public List<MemberData> getAllPrefecturesMemberData() {
		return prefectureMapper.getAllPrefecturesMemberData();
	}

	@Override
	public List<Prefecture> getAllPrefecturesData() {
		// TODO Auto-generated method stub
		return prefectureMapper.getAllPrefecturesData();
	}

	@Override
	public List<City> getAllCitysData() {
		// TODO Auto-generated method stub
		return prefectureMapper.getAllCitysData();
	}
	
}
