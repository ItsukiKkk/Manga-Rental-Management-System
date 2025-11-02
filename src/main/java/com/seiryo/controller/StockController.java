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
import com.seiryo.service.StockService;
import com.seiryo.service.TitleService;

/**
 * コントロール層：在庫
 */
@Controller
public class StockController {
	@Autowired
	StockService stockService;
	@Autowired
	TitleService titleService;

	/**
	 * 在庫登録フォームに遷移する
	 * 
	 * @param title
	 * @return
	 */
	@RequestMapping("/toStockRegForm")
	public ModelAndView toStockRegForm(@ModelAttribute Title title,
			@RequestParam(name = "titleId", required = false) String titleId) {
		if (titleId != null) {
			title = titleService.getTitleById(titleId);
		}
		ModelAndView modelAndView = new ModelAndView("stockRegForm");
		modelAndView.addObject("title", title);
		return modelAndView;
	}

	/**
	 * 入荷数を確認する
	 * 
	 * @param title
	 * @param stockNum
	 * @param session
	 * @return
	 */
	@RequestMapping("/toCheckInsertNum")
	@ResponseBody
	public Map<String, Object> toCheckInsertNum(@ModelAttribute Title title, @RequestParam("insertNum") int insertNum,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		/*
		 * タイトルによる在庫記録を検索する
		 */
		// タイトルIDが含まれたオブジェクトを代入する
		Stock stock = new Stock(title);
		List<Stock> stockList = null;
		int nowStocks = 0;
		try {
			// タイトルIDなどが含まれた検索条件で在庫リストを取得する
			stockList = stockService.getStockList(stock);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (stockList != null) {
			nowStocks = stockList.size();
		}
		// 現在の在庫数を返す
		result.put("nowStocks", nowStocks);
		if (insertNum <= 999 - nowStocks) {
			// 入荷数が在庫容量を超えない
			result.put("overNum", false);
			session.setAttribute("title", title);
			session.setAttribute("insertNum", insertNum);
		} else {
			// 入荷数が在庫容量を超える
			result.put("overNum", true);
		}
		return result;
	}

	/**
	 * 在庫登録確認画面に遷移する
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/toStockRegConfirm")
	public ModelAndView toStockRegConfirm(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("stockRegConfirm");
		// sessionからモデルを取得する
		modelAndView.addObject("title", session.getAttribute("title"));
		modelAndView.addObject("insertNum", session.getAttribute("insertNum"));
		return modelAndView;
	}

	/**
	 * 在庫登録成功画面に遷移する
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/toStockRegSuccess")
	public ModelAndView toStockRegSuccess(@ModelAttribute Title title, @RequestParam("insertNum") int insertNum,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		// 入庫処理
		Stock stock = new Stock(title.getTitleId(), null, 0, null);
		int insertFlag = 0;
		try {
			insertFlag = stockService.insertStock(stock, insertNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 成功した場合
		if (insertFlag != 0) {
			modelAndView.setViewName("stockRegSuccess");
			modelAndView.addObject("title", title);
			modelAndView.addObject("insertNum", insertNum);
			// sessionから属性を削除する
			session.removeAttribute("title");
			session.removeAttribute("insertNum");
		} else {
			// 登録が失敗した場合、登録確認画面に戻る
			modelAndView.setViewName("stockRegConfirm");
			modelAndView.addObject("errorMsg", "システムエラーが発生しました。しばらくしてから再度お試しください");
		}
		return modelAndView;
	}

	/**
	 * 在庫一覧画面に遷移する
	 * @param title
	 * @param titleId
	 * @param stockNo
	 * @param session
	 * @return
	 */
	@RequestMapping("/toStockSelList")
	public ModelAndView toStockSelList(@ModelAttribute Title title,
			@RequestParam(name = "titleId", required = false) String titleId,
			@RequestParam(name = "stockNo", required = false) String stockNo, HttpSession session) {
		// 検索条件としてのオブジェクト
		Title selStockTitle = null;
		if (titleId == null && stockNo == null && session.getAttribute("selStockTitle") != null) {
			// 検索フォーム以外の画面から一覧画面に戻る場合
			selStockTitle = (Title) session.getAttribute("selStockTitle");
			System.out.println("session-selStock" + selStockTitle);
		} else {
			// 検索フォーム画面から一覧画面に遷移する場合
			selStockTitle = title;
			System.out.println("selStock" + selStockTitle);
		}
		List<Stock> stockList = null;
		try {
			// タイトルリストを検索する
			Stock selStock = new Stock(selStockTitle);
			stockList = stockService.getStockList(selStock);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView modelAndView = new ModelAndView();
		// 検索結果をJSON形式に変換する
		Gson gson = new Gson();
		String jsonStockList = gson.toJson(stockList);
		modelAndView.setViewName("stockSelList");
		// モデルに追加する
		modelAndView.addObject("jsonStockList", jsonStockList);
		session.setAttribute("selStockTitle", selStockTitle);
		return modelAndView;
	}

	/**
	 * 在庫詳細画面に遷移する
	 * @param titleId
	 * @param stockNo
	 * @param session
	 * @return
	 */
	@RequestMapping("/toStockSelDetails")
	public ModelAndView toStockSelDetails(@RequestParam(name = "titleId", required = false) String titleId,
			@RequestParam(name = "stockNo", required = false) String stockNo, HttpSession session) {
		// タイトルIDと在庫番号による在庫情報の検索を行う
		Stock stock = stockService.getStockById(titleId, stockNo);
		stock.setTitleId(titleId);
		stock.setStockNo(stockNo);
		System.out.println("!!!!!!!!!1"+stock);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("stockSelDetails");
		modelAndView.addObject("stock", stock);
		session.setAttribute("stock", stock);
		return modelAndView;
	}
	/**
	 * 在庫更新フォームに遷移する
	 * @param titleId
	 * @return
	 */
	@RequestMapping("/toStockUpdateForm")
	public ModelAndView toStockUpdateForm(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		// モデルに追加する
		Stock stock = null;
		// sessionから属性を取得する
		stock = (Stock) session.getAttribute("stock");
		modelAndView.setViewName("stockUpdateForm");
		modelAndView.addObject("stock", stock);
		return modelAndView;
	}
	/**
	 * 在庫更新確認画面に遷移する
	 * @param category
	 * @return
	 */
	@RequestMapping("/toStockUpdateFormConfirm")
	public ModelAndView toStockUpdateForm(@ModelAttribute Stock stock, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("stockUpdateConfirm");
		System.out.println(stock);
		// sessionから属性を取得する
		Stock oldStock = (Stock) session.getAttribute("stock");
		// 新しい在庫状況を取得する
		oldStock.setStockState(stock.getStockState());
		System.out.println(oldStock);
		session.setAttribute("stock",oldStock);
		modelAndView.addObject("stock", oldStock);
		return modelAndView;
	}
	/**
	 * 在庫更新を行う
	 * @param category
	 * @return
	 */
	@RequestMapping("/toStockUpdateSuccess")
	public ModelAndView toStockUpdateSuccess(@ModelAttribute Stock stock, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		int updateFlag = 0;
		try {
			// 在庫情報を更新する
			Stock oldStock = (Stock) session.getAttribute("stock");
			updateFlag = stockService.updateStock(oldStock);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 成功した場合
		if (updateFlag != 0) {
			// sessionから属性を削除する
			session.removeAttribute("stock");
			modelAndView.setViewName("stockUpdateSuccess");
			modelAndView.addObject("stock", stock);
			System.out.println("buyinggaia");
		} else {
			// 登録が失敗した場合、登録確認画面に戻る
			Stock oldStock = (Stock) session.getAttribute("stock");
			stock.setTitle(oldStock.getTitle());
			modelAndView.addObject("stock", stock);
			modelAndView.setViewName("stockUpdateConfirm");
			modelAndView.addObject("errorMsg", "システムエラーが発生しました。しばらくしてから再度お試しください");
		}
		return modelAndView;
	}
	/**
	 * 在庫削除前に在庫状況を確認する
	 * @param categoryCd
	 * @return
	 */
	@RequestMapping("/checkStockState")
	@ResponseBody
	public Map<String, Object> checkStockState(@RequestParam("stockState") String stockState) {
	    Map<String, Object> result = new HashMap<>();
	    System.out.println("stockState="+stockState);
	    if("1".equals(stockState)) {
	    	// 利用していない場合
	    	result.put("hasStock", true);
	    }else {
	    	// 利用している場合
	    	result.put("hasStock", false);
	    }
//	    // titleオブジェクトを取得する
//	    Title title = new Title();
//	    title.setCtgCd(categoryCd);
//	    System.out.println("title="+title);
//	    List<Title> titleList = null;
//	    try {
//	    	// categoryCdを検索条件としてtitleを検索する
//	    	titleList = titleService.getTitleList(title);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	    if (titleList == null || titleList.size() == 0) {
//	    	// 利用していない場合
//	    	result.put("hasStock", false);
//		} else {
//			// 利用している場合
//			result.put("hasStock", true);
//		}
	    return result;
	}
	/**
	 * 在庫状況削除確認画面に遷移する
	 * @return
	 */
	@RequestMapping("/toStockDelConfirm")
	public ModelAndView toStockDelConfirm(@RequestParam("stockNo") String stockNo, 
			@RequestParam("titleId") String titleId) {
		// IDによる在庫状況を検索する
		Stock stock = stockService.getStockById(titleId, stockNo);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("stockDelConfirm");
		modelAndView.addObject("stock", stock);
		return modelAndView;
		
	}
	/**
	 * 在庫状況削除を行う
	 * @param categoryCd
	 * @return
	 */
	@RequestMapping("/toStockDelSuccess")
	public ModelAndView toStockDelSuccess(@ModelAttribute Stock stock) {
		ModelAndView modelAndView = new ModelAndView();
		Stock delStock = stockService.getStockById(stock.getTitleId(), stock.getStockNo());
		// 削除する在庫状況をモデルに追加する
		modelAndView.addObject("delStock", delStock);
		int flag = 0;
		try {
			// IDによる在庫状況を削除する
			flag = stockService.delStock(stock.getTitleId(), stock.getStockNo());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (flag > 0) {
			// 成功した場合
			modelAndView.setViewName("stockDelSuccess");
		} else {
			// 確認画面に戻る
			modelAndView.setViewName("stockDelConfirm");
			modelAndView.addObject("errorMsg", "システムエラーが発生しました。しばらくしてから再度お試しください");
		}
		return modelAndView;
	}
}
