package com.seiryo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.seiryo.pojo.Statistical;

/**
 * DAOクラス：会員統計（STATISTICAL_LOG）テーブルを扱う
 */
@Repository
public interface StatisticalMapper {
	List<Statistical> allStatistical();
	void updateStatisticalNumber(@Param("id")String id, @Param("number")int number);
	int getDownloadNumber(@Param("id")String id);
	void insertStatistical(@Param("statistical")Statistical statistical);
}
