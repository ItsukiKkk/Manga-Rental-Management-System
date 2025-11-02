package com.seiryo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seiryo.pojo.Stock;

/**
 * サービスインタフェース：在庫
 */
public interface StockService {
	// IDで検索する
	Stock getStockById(@Param("titleId") String titleId,@Param("stockNo") String stockNo);
	
	// すべての在庫情報を検索する
	List<Stock> getAllStocks();
	
	// 入力された条件で在庫情報を検索する
	List<Stock> getStockList(Stock stock);
	
	// タイトルを入庫する
	int insertStock(Stock stock, int stockNum);
	
	// 入庫情報を変更する
	int updateStock(Stock stock);
	
	// 在庫情報を削除する
	int delStock(@Param("titleId") String titleId,@Param("stockNo") String stockNo);
}
