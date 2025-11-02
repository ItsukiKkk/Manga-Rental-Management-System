package com.seiryo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.seiryo.pojo.Stock;

/**
 * DAOクラス：DBの在庫（stock）テーブルを扱う
 */
@Repository
public interface StockMapper {
	
	// IDで検索する
	Stock getStockById(@Param("titleId") String titleId,@Param("stockNo") String stockNo);
	
	// すべての在庫情報を検索する
	List<Stock> getAllStocks();
	
	// 入力された条件で在庫情報を検索する
	List<Stock> getStockList(Stock stock);
	
	// タイトルを入庫する
	int insertStock(Stock stock);
	
	// 入庫情報を変更する
	int updateStock(@Param("stock") Stock stock);
	
	// 在庫情報を削除する
	int delStock(@Param("titleId") String titleId,@Param("stockNo") String stockNo);
}
