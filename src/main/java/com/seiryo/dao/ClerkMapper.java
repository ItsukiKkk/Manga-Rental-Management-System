package com.seiryo.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.seiryo.pojo.Clerk;

/**
 * DAOクラス：DBの店員（Clerk）テーブルを扱う
 */
@Repository
public interface ClerkMapper {
	
	// IDによる検索する
	Clerk getClerkById(@Param("clerkId")String ClerkId);
	
}
