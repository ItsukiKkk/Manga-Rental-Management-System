package com.seiryo.pojo;

import java.sql.Date;

/**
 * エンティティクラス：会員統計
 */
public class Statistical {
	private Integer statisticalId;
	private String statisticalName;
	private String statisticalURL;
	private String statisticalNumber;
	private Date statisticalDate;
	public Integer getStatisticalId() {
		return statisticalId;
	}
	public void setStatisticalId(Integer statisticalId) {
		this.statisticalId = statisticalId;
	}
	public String getStatisticalName() {
		return statisticalName;
	}
	public void setStatisticalName(String statisticalName) {
		this.statisticalName = statisticalName;
	}
	public String getStatisticalURL() {
		return statisticalURL;
	}
	public void setStatisticalURL(String statisticalURL) {
		this.statisticalURL = statisticalURL;
	}
	public String getStatisticalNumber() {
		return statisticalNumber;
	}
	public void setStatisticalNumber(String statisticalNumber) {
		this.statisticalNumber = statisticalNumber;
	}
	public Date getStatisticalDate() {
		return statisticalDate;
	}
	public void setStatisticalDate(Date statisticalDate) {
		this.statisticalDate = statisticalDate;
	}
	@Override
	public String toString() {
		return "Statistical [statisticalId=" + statisticalId + ", statisticalName=" + statisticalName
				+ ", statisticalURL=" + statisticalURL + ", statisticalNumber=" + statisticalNumber
				+ ", statisticalDate=" + statisticalDate + "]";
	}
	
	
}
