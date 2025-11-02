package com.seiryo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.seiryo.pojo.Title;

/**
 * DAOクラス：DBのタイトル（Title）テーブルを扱う
 */
@Repository
public interface TitleMapper {
	
	// IDによる検索する
	Title getTitleById(@Param("titleId") String titleId);
	
	// temCd（商品コード）による検索
	Title getTitleByTemCd(@Param("temCd") String temCd);
	
	// すべてのタイトルを検索する
	List<Title> getAllTitles();
	
	// 入力された条件でタイトルを検索する
	List<Title> getTitleList(Title title);
	    
	// タイトルを登録する
	int insertTitle(Title title);
	    
	// タイトルを更新する
	int updateTitle(Title title);
	
	// タイトルを削除する
	int delTitle(@Param("titleId") String titleId);
}
