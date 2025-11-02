package com.seiryo.pojo;
/**
 * エンティティクラス：タイトル
 */
public class Title {
	private String titleId;
	private String title;
	private String temCd;
	private String ctgCd;
	private String actor;
	private Category category;
	public String getTitleId() {
		return titleId;
	}
	public void setTitleId(String titleId) {
		this.titleId = titleId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTemCd() {
		return temCd;
	}
	public void setTemCd(String temCd) {
		this.temCd = temCd;
	}
	public String getCtgCd() {
		return ctgCd;
	}
	public void setCtgCd(String ctgCd) {
		this.ctgCd = ctgCd;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	public Title() {
		super();
	}
	public Title(String titleId, String title, String temCd, String ctgCd, String actor, Category category) {
		super();
		this.titleId = titleId;
		this.title = title;
		this.temCd = temCd;
		this.ctgCd = ctgCd;
		this.actor = actor;
		this.category = category;
	}
	@Override
	public String toString() {
		return "Title [titleId=" + titleId + ", title=" + title + ", temCd=" + temCd + ", ctgCd=" + ctgCd + ", actor="
				+ actor + ", category=" + category + "]";
	}
	
}
