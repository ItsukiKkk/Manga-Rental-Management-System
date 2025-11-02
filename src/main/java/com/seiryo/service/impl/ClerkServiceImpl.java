package com.seiryo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seiryo.dao.ClerkMapper;
import com.seiryo.pojo.Clerk;
import com.seiryo.service.ClerkService;

/**
 * サービス実装クラス：店員
 */
@Service
@Transactional
public class ClerkServiceImpl implements ClerkService{
	@Autowired
	private ClerkMapper clerkMapper ;

	@Override
	public Clerk getClerkById(String clerkId) {
		return clerkMapper.getClerkById(clerkId);
	}

}
