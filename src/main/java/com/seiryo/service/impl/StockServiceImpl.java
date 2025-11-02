package com.seiryo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seiryo.dao.StockMapper;
import com.seiryo.pojo.Stock;
import com.seiryo.service.StockService;

/**
 * サービス実装クラス：在庫
 */
@Service
@Transactional
public class StockServiceImpl implements StockService{
	@Autowired
	StockMapper stockMapper;
	@Override
	public Stock getStockById(String titleId, String stockNo) {
		return stockMapper.getStockById(titleId, stockNo);
	}

	@Override
	public List<Stock> getAllStocks() {
		return stockMapper.getAllStocks();
	}

	@Override
	public List<Stock> getStockList(Stock stock) {
		return stockMapper.getStockList(stock);
	}

	
	@Override
	public int insertStock(Stock stock, int stockNum) {
	    int insertedCount = 0;
	    // 入荷数に応じて在庫レコードを作成する
	    for (int i = 0; i < stockNum; i++) {
	        if (stockMapper.insertStock(stock) > 0) {
	            insertedCount++;
	        }
	    }
	    return insertedCount;
	}

	@Override
	public int updateStock(Stock stock) {
		return stockMapper.updateStock(stock);
	}

	@Override
	public int delStock(String titleId, String stockNo) {
		return stockMapper.delStock(titleId, stockNo);
	}

	
}
