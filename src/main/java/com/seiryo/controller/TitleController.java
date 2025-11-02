package com.seiryo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.seiryo.pojo.Category;
import com.seiryo.pojo.Stock;
import com.seiryo.pojo.Title;
import com.seiryo.service.CategoryService;
import com.seiryo.service.StockService;
import com.seiryo.service.TitleService;

/**
 * コントロール層：タイトル
 */
@Controller
public class TitleController {
	@Autowired
	TitleService titleService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	StockService stockService;
	
	/**
	 * タイトル登録の商品コードの唯一性を確認する
	 * 
	 * @param title
	 * @return
	 */
	@RequestMapping("/toCheckTemCd")
	@ResponseBody
	public Map<String, Object> toCheckTemCd(@ModelAttribute Title title,@RequestParam(name = "originalTemCd", required = false) String originalTemCd , HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		List<Category> categoryList = categoryService.getCategoryList();
		session.setAttribute("categoryLsit", categoryList);
		// 選択されたカテゴリーを取得する
		Category category = categoryService.getCategoryById(title.getCtgCd());
		// 現在のtemCdを取得する
		String currentTemCd = title.getTemCd();
		if (originalTemCd != null && originalTemCd.equals(currentTemCd)) {
			// temCd更新しない場合
			result.put("unique", true);	
			session.setAttribute("category", category);
			session.setAttribute("title", title);
		} else {
			/*
			 *  商品コードtemCdの唯一性を検証する
			 */
			Title newTitle = titleService.getTitleByTemCd(currentTemCd);
			if (newTitle != null) {
				// 商品コードが既に存在する
				result.put("unique", false);
			} else {
				// 商品コードが唯一である
				result.put("unique", true);	
				session.setAttribute("category", category);
				session.setAttribute("title", title);
			}
		}
		
		return result;
	}
	/**
	 * タイトル登録確認画面に遷移する
	 * @param session
	 * @return
	 */
	@RequestMapping("/toTitleRegConfirm")
	public ModelAndView toTitleRegConfirm(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("titleRegConfirm");
		// sessionからモデルを取得する
		modelAndView.addObject("title", session.getAttribute("title"));
	    modelAndView.addObject("category", session.getAttribute("category"));
	    modelAndView.addObject("categoryList", session.getAttribute("categoryList"));
		return modelAndView;
	}
	/**
	 * タイトル登録を行う
	 * @param session
	 * @return
	 */
	@RequestMapping("/toTitleRegSuccess")
	public ModelAndView toTitleRegSuccess(@ModelAttribute Title title, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		// タイトル情報をデータベースに登録する
		int insertFlag = 0;
		try {
			insertFlag = titleService.insertTitle(title);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 成功した場合
		if (insertFlag != 0) {
			modelAndView.setViewName("titleRegSuccess");
			modelAndView.addObject("title", title);
			// sessionから属性を削除する
			session.removeAttribute("title");
			session.removeAttribute("category");
		} else {
			// 登録が失敗した場合、登録確認画面に戻る
			modelAndView.setViewName("titleRegConfirm");
			modelAndView.addObject("errorMsg", "システムエラーが発生しました。しばらくしてから再度お試しください");
		}
		return modelAndView;
	}
	/**
	 * タイトル一覧画面に遷移する
	 * @param title
	 * @param session
	 * @return
	 */
	@RequestMapping("/toTitleSelList")
	public ModelAndView toTitleSelList(@ModelAttribute Title title,@RequestParam(name = "titleId", required = false) String titleId,HttpSession session) {
		session.removeAttribute("title");
		// 検索条件としてのオブジェクト
		Title selTitle = null;		
		if (titleId == null && session.getAttribute("selTitle") != null) {
			// 検索フォーム以外の画面から一覧画面に戻る場合
			selTitle = (Title) session.getAttribute("selTitle");
		} else {
			// 検索フォーム画面から一覧画面に遷移する場合
			selTitle = title;
		}
		List<Title> titleList = null;		
		try {
			// タイトルリストを検索する
			titleList = titleService.getTitleList(selTitle);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView modelAndView = new ModelAndView();
		// 検索結果をJSON形式に変換する
		Gson gson = new Gson();
		String jsonTitleList = gson.toJson(titleList);		
		modelAndView.setViewName("titleSelList");
		// モデルに追加する
		modelAndView.addObject("jsonTitleList", jsonTitleList);
		session.setAttribute("selTitle", selTitle);
		return modelAndView;
	}
	/**
	 * タイトル詳細画面に遷移する
	 * @param titleId
	 * @param session
	 * @return
	 */
	@RequestMapping("/toTitleSelDetails")
	public ModelAndView toTitleSelDetails(@RequestParam("titleId") String titleId, HttpSession session) {
		// IDによるタイトルの検索を行う
		Title title = titleService.getTitleById(titleId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("titleSelDetails");
		modelAndView.addObject("title", title);
		session.setAttribute("title", title);
		return modelAndView;
	}
	/**
	 * タイトル更新フォームに遷移する
	 * @param title
	 * @return
	 */
	@RequestMapping("/toTitleUpdateForm")
	public ModelAndView toTitleUpdateForm(@RequestParam("titleId") String titleId, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		// すべてのカテゴリーを検索する
		List<Category> categoryList = categoryService.getCategoryList();
		// モデルに追加する
		modelAndView.addObject("categoryList", categoryList);
		Title title = null;
		Category category = null;
		// sessionから属性を取得する
		title = (Title) session.getAttribute("title");
		category = (Category) session.getAttribute("category");		
		if (title == null && category == null) {
			// リクエストからのIDによるタイトルオブジェクトを取得する
			title = titleService.getTitleById(titleId);
			// categoryを取得する
			category = categoryService.getCategoryById(title.getCtgCd());
		}
		modelAndView.setViewName("titleUpdateForm");
		modelAndView.addObject("title", title);
		modelAndView.addObject("category", category);
		return modelAndView;
	}
	/**
	 * タイトル更新確認画面に遷移する
	 * @param title
	 * @return
	 */
	@RequestMapping("/toTitleUpdateConfirm")
	public ModelAndView toTitleUpdateConfirm(@ModelAttribute Title title, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("titleUpdateConfirm");
		// sessionからモデルを取得する
		modelAndView.addObject("title", session.getAttribute("title"));
	    modelAndView.addObject("category", session.getAttribute("category"));
		return modelAndView;
		
	}
	/**
	 * タイトル更新を行う
	 * @param title
	 * @return
	 */
	@RequestMapping("/toTitleUpdateSuccess")
	public ModelAndView toTitleUpdateSuccess(@ModelAttribute Title title, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		int updateFlag = 0;
		try {
			// タイトル情報を更新する
			updateFlag = titleService.updateTitle(title);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 成功した場合
		if (updateFlag != 0) {
			// sessionから属性を削除する
			session.removeAttribute("title");
			session.removeAttribute("category");
			modelAndView.setViewName("titleUpdateSuccess");
			modelAndView.addObject("title", title);
			System.out.println("buyinggaia");
		} else {
			// 登録が失敗した場合、登録確認画面に戻る
			modelAndView.setViewName("titleUpdateConfirm");
			modelAndView.addObject("errorMsg", "システムエラーが発生しました。しばらくしてから再度お試しください");
		}
		return modelAndView;
		
	}
	/**
	 * タイトル削除前に在庫数を確認する
	 * @param title
	 * @return
	 */
	@RequestMapping("/checkStock")
	@ResponseBody
	public Map<String, Object> checkStock(@RequestParam("titleId") String titleId) {
	    Map<String, Object> result = new HashMap<>();
	    System.out.println("titleid="+titleId);
	    // titleを検索する
	    Title title = titleService.getTitleById(titleId);
	    System.out.println("title="+title);
	    // stockオブジェクトを取得する
	    Stock stock = new Stock(title);	
	    System.out.println("stock="+stock);
	    List<Stock> stockList = null;
	    try {
	    	// titleIdを検索条件として在庫を検索する
	    	stockList = stockService.getStockList(stock);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    if (stockList == null || stockList.size() == 0) {
	    	// 在庫なしの場合
	    	result.put("hasStock", false);
		} else {
			// 在庫ありの場合
			result.put("hasStock", true);
		}
	    return result;
	}
	/**
	 * タイトル削除確認画面に遷移する
	 * @param title
	 * @return
	 */
	@RequestMapping("/toTitleDelConfirm")
	public ModelAndView toTitleDelConfirm(@RequestParam("titleId") String titleId) {
		// IDによるタイトルを検索する
		Title title = titleService.getTitleById(titleId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("titleDelConfirm");
		modelAndView.addObject("title", title);
		return modelAndView;
		
	}
	/**
	 * タイトル削除を行う
	 * @param title
	 * @return
	 */
	@RequestMapping("/toTitleDelSuccess")
	public ModelAndView toTitleDelSuccess(@RequestParam("titleId")String titleId) {
		ModelAndView modelAndView = new ModelAndView();
		Title delTitle = titleService.getTitleById(titleId);
		// 削除するタイトルをモデルに追加する
		modelAndView.addObject("delTitle", delTitle);
		int flag = 0;
		try {
			// IDによるタイトルを削除する
			flag = titleService.delTitle(titleId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (flag > 0) {
			// 成功した場合
			modelAndView.setViewName("titleDelSuccess");
		} else {
			// 確認画面に戻る
			modelAndView.setViewName("titleDelConfirm");
			modelAndView.addObject("errorMsg", "システムエラーが発生しました。しばらくしてから再度お試しください");
		}
		return modelAndView;
	}
}
