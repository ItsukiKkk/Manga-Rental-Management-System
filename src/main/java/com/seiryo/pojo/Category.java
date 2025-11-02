package com.seiryo.pojo;

/**
 * エンティティクラス：カテゴリー
 */
public class Category {
	private String categoryCd;
	private String category;
	
	public String getCategoryCd() {
		return categoryCd;
	}
	public void setCategoryCd(String categoryCd) {
		this.categoryCd = categoryCd;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public Category(String category) {
		super();
		this.category = category;
	}
	public Category(String categoryCd, String category) {
		super();
		this.categoryCd = categoryCd;
		this.category = category;
	}
	public Category() {
		super();
	}
	@Override
	public String toString() {
		return "Category [categoryCd=" + categoryCd + ", category=" + category + "]";
	}
}
