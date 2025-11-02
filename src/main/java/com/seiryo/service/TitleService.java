package com.seiryo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seiryo.pojo.Title;

/**
 * サービスインタフェース：タイトル
 */
public interface TitleService {
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
