package com.seiryo.pojo;

public class City {
	private Integer cityId;
	private String preCd;
	private String cityName;
	private Integer currentMonthCount;
    private Integer lastMonthCount;
    private Integer changeFromLastMonth;
	public String getPreCd() {
		return preCd;
	}
	public void setPreCd(String preCd) {
		this.preCd = preCd;
	}
	public Integer getCityCd() {
		return cityId;
	}
	public void setCityCd(Integer cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
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
		return "City [cityId=" + cityId + ", preCd=" + preCd + ", cityName=" + cityName + ", currentMonthCount="
				+ currentMonthCount + ", lastMonthCount=" + lastMonthCount + ", changeFromLastMonth="
				+ changeFromLastMonth + "]";
	}
	
	
}
