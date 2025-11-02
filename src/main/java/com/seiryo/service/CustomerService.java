package com.seiryo.service;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;

import com.seiryo.pojo.Customer;
import com.seiryo.pojo.MemberData;

/**
 * サービスインタフェース：会員
 */
public interface CustomerService {
	// IDによる検索する
	Customer getCustomerById(@Param("memId")String memId);
	
	// すべての会員情報を検索する
	List<Customer> getAllCustomers();
	
	// 入力された条件で会員情報を検索する
	List<Customer> getCustomerList(Customer customer);
	    
	// 会員情報を登録する
	int insertCustomer(Customer customer);
	    
	// 会員情報を更新する
	int updateCustomer(Customer customer);
	
	// 退会処理
	int cancelCustomer(@Param("memId")String memId);
	
	//すべて会員情報プラスage、 accumulativeDayを検索する 
	List<Customer> getAllCustomersPlus(LocalDate current);
	
	// 会員年齢よる会員情報を検索する
	List<Customer> getCustomerListByAge(Integer age, LocalDate current);
	
//	// 期間による会員人数統計
//	List<Customer> getCustomerCount(@Param("memberData")MemberData memberData);
		
	// 市による会員情報を検索する
	List<MemberData> getCustomerListByAddr(Date current);
	
	// 県による会員情報を検索する
	List<MemberData> getCustomerListByAddr1(Date current);
	

//	// 地域による会員人数統計
//	List<Customer> getCustomerCountByAddr(@Param("memberData")MemberData memberData);
	
	// 期限が切れているかどうかによる会員情報を検索する
	List<Customer> getCustomerListByExpired(LocalDate current, Integer ifExpired);
	
	// 期限が切れているかどうかによる会員人数統計
	int getCustomerCount(Date current, int ifExpired);
	
	
}
