package com.seiryo.pojo;
/**
 * エンティティクラス：在庫
 */
public class Stock {
	private String titleId;
	private String stockNo;
	private int stockState;
	private Title title;
	public String getTitleId() {
		return titleId;
	}
	public void setTitleId(String titleId) {
		this.titleId = titleId;
	}
	public String getStockNo() {
		return stockNo;
	}
	public void setStockNo(String stockNo) {
		this.stockNo = stockNo;
	}
	public int getStockState() {
		return stockState;
	}
	public void setStockState(int stockState) {
		this.stockState = stockState;
	}
	public Title getTitle() {
		return title;
	}
	public void setTitle(Title title) {
		this.title = title;
	}
	
	public Stock(Title title) {
		super();
		this.title = title;
	}
	public Stock(String titleId, String stockNo, int stockState) {
		super();
		this.titleId = titleId;
		this.stockNo = stockNo;
		this.stockState = stockState;
	}
	public Stock(String titleId, int stockState) {
		super();
		this.titleId = titleId;
		this.stockState = stockState;
	}
	public Stock(String titleId, String stockNo, int stockState, Title title) {
		super();
		this.titleId = titleId;
		this.stockNo = stockNo;
		this.stockState = stockState;
		this.title = title;
	}
	public Stock() {
		super();
	}
	@Override
	public String toString() {
		return "Stock [titleId=" + titleId + ", stockNo=" + stockNo + ", stockState=" + stockState + ", title=" + title
				+ "]";
	}
}
