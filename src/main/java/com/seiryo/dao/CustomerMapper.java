package com.seiryo.dao;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.seiryo.pojo.Customer;
import com.seiryo.pojo.MemberData;

/**
 * DAOクラス：DBの会員（Customer）テーブルを扱う
 */
@Repository
public interface CustomerMapper {
	
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
	List<Customer> getAllCustomersPlus(@Param("memberData")MemberData memberData);
	
	// 会員年齢よる会員情報を検索する
	List<Customer> getCustomerListByAge(@Param("memberData")MemberData memberData);
	
//		// 期間による会員人数統計
//		List<Customer> getCustomerCount(@Param("memberData")MemberData memberData);
		
	// 市による会員情報を検索する
	List<Customer> getCustomerListByAddr(@Param("memberData")MemberData memberData);
	
	// 県による会員情報を検索する
	List<Customer> getCustomerListByAddr1(@Param("memberData")MemberData memberData);
	

//		// 地域による会員人数統計
//		List<Customer> getCustomerCountByAddr(@Param("memberData")MemberData memberData);
	
	// 期限が切れているかどうかによる会員情報を検索する
	List<Customer> getCustomerListByExpired(@Param("memberData")MemberData memberData);
	
	// 期限が切れているかどうかによる会員人数統計
	int getCustomerCount(@Param("memberData")MemberData memberData);
	
	void exportToExcel(HttpServletResponse response);
	
	
}
