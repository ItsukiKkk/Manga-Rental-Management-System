package com.seiryo.pojo;

/**
 * エンティティクラス：会員
 */
public class Customer {
	private String memId;
    private String lastname;
    private String lastkana;
    private String firstname;
    private String firstkana;
    private String birthdate;
    private String post;
    private String addr1;
    private String addr2;
    private String addr3;
    private String tel1;
    private String tel2;
    private String tel3;
    private String password;
    private int idFlag;
    private String applyDate;
    private String expiryDate;
    private int delFlag;
    private Integer age;
    private Integer status; 
    private Integer accumulativeDay;
	private Integer accumulativeYear;
	
	
	public Integer getAccumulativeDay() {
		return accumulativeDay;
	}
	public void setAccumulativeDay(Integer accumulativeDay) {
		this.accumulativeDay = accumulativeDay;
	}
	public Integer getAccumulativeYear() {
		return accumulativeYear;
	}
	public void setAccumulativeYear(Integer accumulativeYear) {
		this.accumulativeYear = accumulativeYear;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getLastkana() {
		return lastkana;
	}
	public void setLastkana(String lastkana) {
		this.lastkana = lastkana;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getFirstkana() {
		return firstkana;
	}
	public void setFirstkana(String firstkana) {
		this.firstkana = firstkana;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
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
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public int getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(int delFlag) {
		this.delFlag = delFlag;
	}
	public Customer(String memId, String lastname, String lastkana, String firstname, String firstkana, String birthdate,
			String post, String addr1, String addr2, String addr3, String tel1, String tel2, String tel3,
			String password, int idFlag, String applyDate, String expiryDate, int delFlag) {
		super();
		this.memId = memId;
		this.lastname = lastname;
		this.lastkana = lastkana;
		this.firstname = firstname;
		this.firstkana = firstkana;
		this.birthdate = birthdate;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.password = password;
		this.idFlag = idFlag;
		this.applyDate = applyDate;
		this.expiryDate = expiryDate;
		this.delFlag = delFlag;
	}
	public Customer() {
		super();
	}
	public Customer(String lastname, String lastkana, String firstname, String firstkana, String birthdate, String post,
			String addr1, String addr2, String addr3, String tel1, String tel2, String tel3, String password,
			int idFlag, String applyDate, String expiryDate, int delFlag) {
		super();
		this.lastname = lastname;
		this.lastkana = lastkana;
		this.firstname = firstname;
		this.firstkana = firstkana;
		this.birthdate = birthdate;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.password = password;
		this.idFlag = idFlag;
		this.applyDate = applyDate;
		this.expiryDate = expiryDate;
		this.delFlag = delFlag;
	}
	@Override
	public String toString() {
		return "Customer [memId=" + memId + ", lastname=" + lastname + ", lastkana=" + lastkana + ", firstname="
				+ firstname + ", firstkana=" + firstkana + ", birthdate=" + birthdate + ", post=" + post + ", addr1="
				+ addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3="
				+ tel3 + ", password=" + password + ", idFlag=" + idFlag + ", applyDate=" + applyDate + ", expiryDate="
				+ expiryDate + ", delFlag=" + delFlag + ", age=" + age + ", status=" + status + ", accumulativeDay="
				+ accumulativeDay + ", accumulativeYear=" + accumulativeYear + "]";
	}
	
    
    
}
