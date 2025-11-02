package com.seiryo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.seiryo.pojo.Category;

/**
 * DAOクラス：DBのカテゴリー（Category）テーブルを扱う
 */
@Repository
public interface CategoryMapper {
	
	// IDによる検索する
	Category getCategoryById(@Param("categoryCd") String categoryCd);
	
	// 名前による検索する
	Category getCategoryByCategory(@Param("category") String category);
	
	// すべてのカテゴリーを検索する
	List<Category> getCategoryList();
	    
	// IDとカテゴリーによるすべてのカテゴリーを検索する
	List<Category> selctCategoryList(@Param("category")Category category);
	
	// カテゴリーえを登録する
	int insertCategory(@Param("category")String category);
	
	// カテゴリーを更新する
	int updateCategory(@Param("category")Category category);
	
	// カテゴリーを削除する
	int deleteCategory(@Param("categoryCd")String categoryCd);
	
}
