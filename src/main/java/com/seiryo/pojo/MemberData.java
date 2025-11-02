package com.seiryo.pojo;

import java.util.Date;
import java.util.List;

public class MemberData {
	private Integer id;
	private List<Customer> customers;
	private Integer age;
	private String addr1;
	private String addr2;
	private String status; 
	private Date currentDate;
	private Date lastMouth;
	private Integer monthCount;
	//0 期限切れ　1有効
	private Integer ifExpired;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public List<Customer> getCustomers() {
		return customers;
	}
	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}
	public Integer getMonthCount() {
		return monthCount;
	}
	public void setMonthCount(Integer monthCount) {
		this.monthCount = monthCount;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getLastMouth() {
		return lastMouth;
	}
	public void setLastMouth(Date lastMouth) {
		this.lastMouth = lastMouth;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public Date getCurrentDate() {
		return currentDate;
	}
	public void setCurrentDate(Date currentDate) {
		this.currentDate = currentDate;
	}
	public Integer getIfExpired() {
		return ifExpired;
	}
	public void setIfExpired(Integer ifExpired) {
		this.ifExpired = ifExpired;
	}
	@Override
	public String toString() {
		return "MemberData [id=" + id + ", customers=" + customers + ", age=" + age + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", status=" + status + ", currentDate=" + currentDate + ", lastMouth=" + lastMouth
				+ ", monthCount=" + monthCount + ", ifExpired=" + ifExpired + "]";
	}
	
	
	
}
