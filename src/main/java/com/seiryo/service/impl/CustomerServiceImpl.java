package com.seiryo.service.impl;

import java.time.LocalDate;
import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seiryo.dao.CustomerMapper;
import com.seiryo.pojo.Customer;
import com.seiryo.pojo.MemberData;
import com.seiryo.service.CustomerService;
import com.seiryo.service.PrefectureService;

/**
 * サービス実装クラス：会員
 */
@Service
@Transactional
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	CustomerMapper customerMapper;
	@Autowired
	PrefectureService prefectureService;
	
	@Override
	public Customer getCustomerById(String memId) {
		return customerMapper.getCustomerById(memId);
	}

	@Override
	public List<Customer> getAllCustomers() {
		return customerMapper.getAllCustomers();
	}

	@Override
	public List<Customer> getCustomerList(Customer customer) {
//		if (customerMapper == null) {
//		    System.out.println("customerMapper is null!");
//		}
		return customerMapper.getCustomerList(customer);
	}

	@Override
	public int insertCustomer(Customer customer) {
		return customerMapper.insertCustomer(customer);
	}

	@Override
	public int updateCustomer(Customer customer) {
		return customerMapper.updateCustomer(customer);
	}

	@Override
	public int cancelCustomer(String memId) {
		return customerMapper.cancelCustomer(memId);
	}
	//传入需要的年龄就行
	@Override
	public List<Customer> getCustomerListByAge(Integer age, LocalDate current) {
		MemberData memberData = new MemberData();
		Date currentSql = Date.valueOf(current);
		memberData.setCurrentDate(currentSql);
		memberData.setAge(age);
		return customerMapper.getCustomerListByAge(memberData);
	}
	//按城市划分
	@Override
	public List<MemberData> getCustomerListByAddr(Date current) {
		List<MemberData> memberDataList = prefectureService.getAllPrefecturesAndCity();
		for(MemberData data: memberDataList) {
			data.setCurrentDate(current);
			List<Customer> custmoters = customerMapper.getCustomerListByAddr(data);
			if(custmoters == null || custmoters.size() == 0) {
				continue;
			}
			data.setCustomers(custmoters);
		}
		return memberDataList;
	}
	//按县划分
	@Override
	public List<MemberData> getCustomerListByAddr1(Date current) {
		List<MemberData> memberDataList = prefectureService.getAllPrefecturesMemberData();
		for(MemberData data: memberDataList) {
			data.setCurrentDate(current);
			List<Customer> custmoters = customerMapper.getCustomerListByAddr(data);
			if(custmoters == null || custmoters.size() == 0) {
				continue;
			}
			data.setCustomers(custmoters);
		}
		return memberDataList;
	}

	//本月登录和过期会员，输入状态
	@Override
	public List<Customer> getCustomerListByExpired(LocalDate current, Integer ifExpired) {
		Date currentSql = Date.valueOf(current);
		LocalDate lastMouth = current.minusMonths(1);
		Date lastMouthSql = Date.valueOf(lastMouth);
		MemberData memberData = new MemberData();
		memberData.setCurrentDate(currentSql);
		memberData.setLastMouth(lastMouthSql);
		memberData.setIfExpired(ifExpired);
		return customerMapper.getCustomerListByExpired(memberData);
	}
	@Override
	public List<Customer> getAllCustomersPlus(LocalDate current) {
		MemberData memberData = new MemberData();
		Date currentSql = Date.valueOf(current);
		memberData.setCurrentDate(currentSql);
		return customerMapper.getAllCustomersPlus(memberData);
	}

	@Override
	public int getCustomerCount(Date current, int ifExpired) {
		MemberData memberData = new MemberData();
		memberData.setCurrentDate(current);
		memberData.setIfExpired(ifExpired);
		return customerMapper.getCustomerCount(memberData);
	}
		
	

	

}
