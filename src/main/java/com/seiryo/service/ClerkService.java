package com.seiryo.service;

import com.seiryo.pojo.Clerk;

/**
 * サービスインタフェース：店員
 */
public interface ClerkService {
	
	// IDによる検索する
	Clerk getClerkById(String clerkId);

}
