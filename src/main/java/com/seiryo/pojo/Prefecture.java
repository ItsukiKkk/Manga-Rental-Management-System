package com.seiryo.pojo;
/**
 * エンティティクラス：都道府県
 */
public class Prefecture {
	private String preCd;
	private String preName;
	private Integer currentMonthCount;
    private Integer lastMonthCount;
    private Integer changeFromLastMonth;
	public String getPreCd() {
		return preCd;
	}
	public void setPreCd(String preCd) {
		this.preCd = preCd;
	}
	public String getPreName() {
		return preName;
	}
	public void setPreName(String preName) {
		this.preName = preName;
	}
	public Prefecture(String preCd, String preName) {
		super();
		this.preCd = preCd;
		this.preName = preName;
	}
	public Prefecture() {
		super();
	}
	public Integer getCurrentMonthCount() {
		return currentMonthCount;
	}
	public void setCurrentMonthCount(Integer currentMonthCount) {
		this.currentMonthCount = currentMonthCount;
	}
	public Integer getLastMonthCount() {
		return lastMonthCount;
	}
	public void setLastMonthCount(Integer lastMonthCount) {
		this.lastMonthCount = lastMonthCount;
	}
	public Integer getChangeFromLastMonth() {
		return changeFromLastMonth;
	}
	public void setChangeFromLastMonth(Integer changeFromLastMonth) {
		this.changeFromLastMonth = changeFromLastMonth;
	}
	@Override
	public String toString() {
		return "Prefecture [preCd=" + preCd + ", preName=" + preName + ", currentMonthCount=" + currentMonthCount
				+ ", lastMonthCount=" + lastMonthCount + ", changeFromLastMonth=" + changeFromLastMonth + "]";
	}
	
}
