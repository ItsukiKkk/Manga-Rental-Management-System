package com.seiryo.test;

import java.util.Iterator;
import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.seiryo.dao.CategoryMapper;
import com.seiryo.dao.ClerkMapper;
import com.seiryo.dao.CustomerMapper;
import com.seiryo.dao.PrefectureMapper;
import com.seiryo.dao.StockMapper;
import com.seiryo.dao.TitleMapper;
import com.seiryo.pojo.Customer;
import com.seiryo.pojo.Stock;
import com.seiryo.pojo.Title;

public class DaoTest {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		DaoTest daoTest = new DaoTest();
		// 店員ClerkMapper Test
//		daoTest.testClerkDao(context);
		// 都道府県PrefctureMapper test
//		daoTest.testPrefectureDao(context);
		// 会員CustomerMapper test
//		daoTest.testCostomerDao(context);
		// カテゴリーCategoryMapper test
//		daoTest.testCategoryDao(context);
		// タイトルTitleMapper test
//		daoTest.testTitleDao(context);
		// 在庫StockMapper test
		daoTest.testStockDao(context);
	}
	
	/**
	 * 店員ClerkMapper Test
	 * @param context
	 */
	void testClerkDao(ClassPathXmlApplicationContext context) {
		ClerkMapper clerkMapper = context.getBean("clerkMapper", ClerkMapper.class);
		System.out.println(clerkMapper.getClerkById("001"));
	}
	
	/**
	 * 都道府県PrefctureMapper test
	 * @param context
	 */
	void testPrefectureDao(ClassPathXmlApplicationContext context) {
		PrefectureMapper prefectureMapper = context.getBean("prefectureMapper", PrefectureMapper.class);
		System.out.println(prefectureMapper.getAllPrefectures());
	}
	
	/**
	 * 会員CustomerMapper test
	 * @param context
	 */
	void testCostomerDao(ClassPathXmlApplicationContext context) {		
		CustomerMapper customerMapper = context.getBean("customerMapper",CustomerMapper.class);
		// すべての検索
		System.out.println(customerMapper.getAllCustomers());
		// IDによる検索
//		System.out.println(customerMapper.getCustomerById("00000001"));
		// 複数条件による検索
//		Customer customer = new Customer(null, "田", "ナカ", null, null, null, null, null, null, null, null, null, null, null, 0, null, null, 0);
//		System.out.println(customerMapper.getCustomerList(customer));
		// 情報更新
//		Customer customer = new Customer("00000001", "小松", "コマツ", "菜奈", "ナナ", "2000-10-14", "1234567", "東京都", "港区", "六本木1-1-1",
//			    "080", "4321", "5678", "202cb962ac59075b964b07152d234b70", 0, "2024-02-21","2025-02-21", 0);
//		System.out.println(customerMapper.updateCustomer(customer));
		// 会員退会
//		System.out.println(customerMapper.cancelCustomer("00000021"));
	}
	
	/**
	 * カテゴリーCategoryMapper test
	 * @param context
	 */
	void testCategoryDao(ClassPathXmlApplicationContext context) {
		CategoryMapper categoryMapper = context.getBean("categoryMapper", CategoryMapper.class);
		System.out.println(categoryMapper.getCategoryById("004"));
		System.out.println(categoryMapper.getCategoryList());
	}
	
	/**
	 * タイトルTitleMapper test
	 * @param context
	 */
	void testTitleDao(ClassPathXmlApplicationContext context) {
		TitleMapper titleMapper = context.getBean("titleMapper", TitleMapper.class);
		// すべての検索
		System.out.println(titleMapper.getAllTitles());
		// IDによる検索
//		System.out.println(titleMapper.getTitleById("00000008"));
		// temCdによる検索
//		Title newTitle = titleMapper.getTitleByTemCd("1234567890011");
//		System.out.println(newTitle);
		// 複数条件による検索
//		Title title = new Title("00000020", null, null, null, null, null);
//		System.out.println(titleMapper.getTitleList(title));
		// タイトル情報を登録する
//		Title title = new Title("ユーリ!!! on ICE", "1234567890027", "005", "勝生勇利");
//		System.out.println(titleMapper.insertTitle(title));
		// タイトル情報を更新する
//		Title title = new Title("00000001", "NARUTO-ナルト-", "1234567890001", "001", "ナルト");
//		System.out.println(titleMapper.updateTitle(title));
		// タイトル情報を削除する
	}
	
	/**
	 * 在庫StockMapper test
	 * @param context
	 */
	void testStockDao(ClassPathXmlApplicationContext context) {
		StockMapper stockMapper = context.getBean("stockMapper", StockMapper.class);
		// すべての検索
//		System.out.println(stockMapper.getAllStocks());
		// IDによる検索
//		System.out.println(stockMapper.getStockById("00000020","003"));		
		/*
		 * 複数条件による検索
		 */
		Title title = new Title("00000011", "進撃の巨人", "1234567890011", "006", "エレン", null);
		Stock stock = new Stock(title);
		List<Stock> list = stockMapper.getStockList(stock);
		// 検索結果
		System.out.println(list);
		// 在庫本数
		System.out.println(list.size());
		/*
		 *  在庫情報を登録する
		 */
		// 入荷数n
//		int n = 2;
//		for (int i = 0; i < n; i++) {
//			Stock stock = new Stock("00000020", 0);
//			System.out.println(stockMapper.insertStock(stock));
//		}
//		System.out.println(titleMapper.insertTitle(title));
		// 在庫情報を更新する
		// 在庫情報を削除する
	}
	

}
