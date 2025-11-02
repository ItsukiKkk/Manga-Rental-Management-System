package com.seiryo.pojo;
/**
 * 会員登録フォーム
 */
public class CustRegForm {
	private String lastname;
    private String firstname;
    private String lastkana;
    private String firstkana;
    private int year;
    private int month;
    private int day;
    private String post;
    private String addr1;
    private String addr2;
    private String addr3;
    private String tel1;
    private String tel2;
    private String tel3;
    private String password;
    private int idFlag;
    private int applyYear;
    private int applyMonth;
    private int applyDay;
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastkana() {
		return lastkana;
	}
	public void setLastkana(String lastkana) {
		this.lastkana = lastkana;
	}
	public String getFirstkana() {
		return firstkana;
	}
	public void setFirstkana(String firstkana) {
		this.firstkana = firstkana;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
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
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getIdFlag() {
		return idFlag;
	}
	public void setIdFlag(int idFlag) {
		this.idFlag = idFlag;
	}
	public int getApplyYear() {
		return applyYear;
	}
	public void setApplyYear(int applyYear) {
		this.applyYear = applyYear;
	}
	public int getApplyMonth() {
		return applyMonth;
	}
	public void setApplyMonth(int applyMonth) {
		this.applyMonth = applyMonth;
	}
	public int getApplyDay() {
		return applyDay;
	}
	public void setApplyDay(int applyDay) {
		this.applyDay = applyDay;
	}
	public CustRegForm(String lastname, String firstname, String lastkana, String firstkana, int year, int month,
			int day, String post, String addr1, String addr2, String addr3, String tel1, String tel2, String tel3,
			String password, int idFlag, int applyYear, int applyMonth, int applyDay) {
		super();
		this.lastname = lastname;
		this.firstname = firstname;
		this.lastkana = lastkana;
		this.firstkana = firstkana;
		this.year = year;
		this.month = month;
		this.day = day;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.password = password;
		this.idFlag = idFlag;
		this.applyYear = applyYear;
		this.applyMonth = applyMonth;
		this.applyDay = applyDay;
	}
	public CustRegForm() {
		super();
	}
	@Override
	public String toString() {
		return "custRegForm [lastname=" + lastname + ", firstname=" + firstname + ", lastkana=" + lastkana
				+ ", firstkana=" + firstkana + ", year=" + year + ", month=" + month + ", day=" + day + ", post=" + post
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", tel1=" + tel1 + ", tel2=" + tel2
				+ ", tel3=" + tel3 + ", password=" + password + ", idFlag=" + idFlag + ", applyYear=" + applyYear
				+ ", applyMonth=" + applyMonth + ", applyDay=" + applyDay + "]";
	}
    
}
