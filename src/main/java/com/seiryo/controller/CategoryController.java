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
import com.seiryo.pojo.Category;
import com.seiryo.pojo.Category;
import com.seiryo.pojo.Category;
import com.seiryo.service.CategoryService;
import com.seiryo.service.TitleService;
import com.seiryo.service.CategoryService;

/**
 * コントロール層：カテゴリー
 */
@Controller
public class CategoryController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	TitleService titleService;
	/**
	 * カテゴリー名の唯一性を確認する
	 * 
	 * @param category
	 * @return
	 */
	@RequestMapping("/toCheckCategory")
	@ResponseBody
	public Map<String, Object> toCheckCategory(@ModelAttribute Category category,@RequestParam(name = "originalCategory", required = false) String originalCategory , HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		// 現在のCategoryNameを取得する
		String currentCategory = category.getCategory();
		if (originalCategory != null && originalCategory.equals(currentCategory)) {
			// CategoryName更新しない場合
			result.put("unique", true);	
			session.setAttribute("category", category);
		} else {
			/*
			 * CategoryNameの唯一性を検証する
			 */
			Category newCategory = categoryService.getCategoryByCategory(category.getCategory());
			if (newCategory != null) {
				// CategoryNameが既に存在する
				result.put("unique", false);
			} else {
				// CategoryNameが唯一である
				result.put("unique", true);	
				session.setAttribute("category", category);
			}
		}
		return result;
	}
	/**
	 * カテゴリー登録確認画面に遷移する
	 * @param session
	 * @return
	 */
	@RequestMapping("/toCategoryRegConfirm")
	public ModelAndView toCategoryRegConfirm(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("categoryRegConfirm");
		// sessionからモデルを取得する
		modelAndView.addObject("category", session.getAttribute("category"));
		return modelAndView;
	}
	/**
	 * カテゴリー登録を行う
	 * @param session
	 * @return
	 */
	@RequestMapping("/toCategoryRegSuccess")
	public ModelAndView toCategoryRegSuccess(@ModelAttribute Category category, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		// カテゴリー情報をデータベースに登録する
		int insertFlag = 0;
		try {
			insertFlag = categoryService.insertCategory(category.getCategory());
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 成功した場合
		if (insertFlag != 0) {
			modelAndView.setViewName("categoryRegSuccess");
			modelAndView.addObject("category", category);
		} else {
			// 登録が失敗した場合、登録確認画面に戻る
			modelAndView.setViewName("categoryRegConfirm");
			modelAndView.addObject("errorMsg", "システムエラーが発生しました。しばらくしてから再度お試しください");
		}
		return modelAndView;
	}
	/**
	 * カテゴリー一覧画面に遷移する
	 * @param category
	 * @param session
	 * @return
	 */
	@RequestMapping("/toCategorySelList")
	public ModelAndView toCategorySelList(@ModelAttribute Category category ,@RequestParam(name = "categoryCd", required = false) String categoryCd,HttpSession session) {
		session.removeAttribute("category");
		// 検索条件としてのオブジェクト
		Category selCategory = null;		
		if (categoryCd == null && session.getAttribute("selCategory") != null) {
			// 検索フォーム以外の画面から一覧画面に戻る場合
			selCategory = (Category) session.getAttribute("selCategory");
		} else {
			// 検索フォーム画面から一覧画面に遷移する場合
			selCategory = category;
		}
		List<Category> categoryList = null;		
		try {
			// カテゴリーリストを検索する
			categoryList = categoryService.selctCategoryList(selCategory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView modelAndView = new ModelAndView();
		// 検索結果をJSON形式に変換する
		Gson gson = new Gson();
		String jsonCategoryList = gson.toJson(categoryList);		
		modelAndView.setViewName("categoryList");
		// モデルに追加する
		modelAndView.addObject("jsonCategoryList", jsonCategoryList);
		session.setAttribute("selCategory", selCategory);
		return modelAndView;
	}
	/**
	 * カテゴリー詳細画面に遷移する
	 * @param categoryCd
	 * @param session
	 * @return
	 */
	@RequestMapping("/toCategorySelDetails")
	public ModelAndView toCategorySelDetails(@RequestParam("categoryCd") String categoryCd, HttpSession session) {
		// IDによるカテゴリーの検索を行う
		Category category = categoryService.getCategoryById(categoryCd);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("categorySelDetails");
		modelAndView.addObject("category", category);
		session.setAttribute("category", category);
		return modelAndView;
	}
	/**
	 * カテゴリー更新フォームに遷移する
	 * @param categoryCd
	 * @return
	 */
	@RequestMapping("/toCategoryUpdateForm")
	public ModelAndView toCategoryUpdateForm(@RequestParam("categoryCd") String categoryCd, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		// モデルに追加する
		Category category = null;
		// sessionから属性を取得する
		category = (Category) session.getAttribute("category");
		if (category == null) {
			// リクエストからのIDによるカテゴリーオブジェクトを取得する
			category = categoryService.getCategoryById(categoryCd);
		}
		modelAndView.setViewName("categoryUpdateForm");
		modelAndView.addObject("category", category);
		return modelAndView;
	}
	/**
	 * カテゴリー更新確認画面に遷移する
	 * @param category
	 * @return
	 */
	@RequestMapping("/toCategoryUpdateConfirm")
	public ModelAndView toCategoryUpdateConfirm(@ModelAttribute Category category, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("categoryUpdateConfirm");
		// sessionからモデルを取得する
		modelAndView.addObject("category", session.getAttribute("category"));
		return modelAndView;
		
	}
	/**
	 * カテゴリー更新を行う
	 * @param category
	 * @return
	 */
	@RequestMapping("/toCategoryUpdateSuccess")
	public ModelAndView toCategoryUpdateSuccess(@ModelAttribute Category category, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		int updateFlag = 0;
		try {
			// カテゴリー情報を更新する
			updateFlag = categoryService.updateCategory(category);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 成功した場合
		if (updateFlag != 0) {
			// sessionから属性を削除する
			session.removeAttribute("category");
			modelAndView.setViewName("categoryUpdateSuccess");
			modelAndView.addObject("category", category);
			System.out.println("buyinggaia");
		} else {
			// 登録が失敗した場合、登録確認画面に戻る
			modelAndView.setViewName("categoryUpdateConfirm");
			modelAndView.addObject("errorMsg", "システムエラーが発生しました。しばらくしてから再度お試しください");
		}
		return modelAndView;
	}
	/**
	 * カテゴリー削除前に在庫数を確認する
	 * @param categoryCd
	 * @return
	 */
	@RequestMapping("/checkCategory")
	@ResponseBody
	public Map<String, Object> checkCategory(@RequestParam("categoryCd") String categoryCd) {
	    Map<String, Object> result = new HashMap<>();
	    System.out.println("categoryCd="+categoryCd);
	    // titleを検索する
	    Category category = categoryService.getCategoryById(categoryCd);
	    System.out.println("category="+category);
	    // titleオブジェクトを取得する
	    Title title = new Title();
	    title.setCtgCd(categoryCd);
	    System.out.println("title="+title);
	    List<Title> titleList = null;
	    try {
	    	// categoryCdを検索条件としてtitleを検索する
	    	titleList = titleService.getTitleList(title);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    if (titleList == null || titleList.size() == 0) {
	    	// 利用していない場合
	    	result.put("hasStock", false);
		} else {
			// 利用している場合
			result.put("hasStock", true);
		}
	    return result;
	}
	/**
	 * カテゴリー削除確認画面に遷移する
	 * @return
	 */
	@RequestMapping("/toCategoryDelConfirm")
	public ModelAndView toCategoryDelConfirm(@RequestParam("categoryCd") String categoryCd) {
		// IDによるカテゴリーを検索する
		Category category = categoryService.getCategoryById(categoryCd);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("categoryDelConfirm");
		modelAndView.addObject("category", category);
		return modelAndView;
		
	}
	/**
	 * カテゴリー削除を行う
	 * @param categoryCd
	 * @return
	 */
	@RequestMapping("/toCategoryDelSuccess")
	public ModelAndView toCategoryDelSuccess(@RequestParam("categoryCd")String categoryCd) {
		ModelAndView modelAndView = new ModelAndView();
		Category delCategory = categoryService.getCategoryById(categoryCd);
		// 削除するカテゴリーをモデルに追加する
		modelAndView.addObject("delCategory", delCategory);
		int flag = 0;
		try {
			// IDによるカテゴリーを削除する
			flag = categoryService.deleteCategory(categoryCd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (flag > 0) {
			// 成功した場合
			modelAndView.setViewName("categoryDelSuccess");
		} else {
			// 確認画面に戻る
			modelAndView.setViewName("categoryDelConfirm");
			modelAndView.addObject("errorMsg", "システムエラーが発生しました。しばらくしてから再度お試しください");
		}
		return modelAndView;
	}
}
