package com.seiryo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seiryo.pojo.Category;

/**
 * サービスインタフェース：カテゴリー
 */
public interface CategoryService {
	// IDによる検索する
	Category getCategoryById(@Param("categoryCd") String categoryCd);
	
	// 名前による検索する
	Category getCategoryByCategory(String category);
	
	// すべてのカテゴリーを検索する
	List<Category> getCategoryList();
	
	// IDとカテゴリーによるすべてのカテゴリーを検索する
	List<Category> selctCategoryList(Category category);
	
	// カテゴリー新規登録
	int insertCategory(String category);
	
	// カテゴリー更新
	int updateCategory(Category category);
	
	// カテゴリー削除
	int deleteCategory(String categoryCd);
}
