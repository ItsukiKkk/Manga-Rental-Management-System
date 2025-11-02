package com.seiryo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.seiryo.pojo.Category;
import com.seiryo.pojo.Prefecture;
import com.seiryo.service.CategoryService;
import com.seiryo.service.PrefectureService;

/**
 * コントロール：システムサービス
 */
@Controller
public class SystemController {
	@Autowired
	PrefectureService prefectureService;
	@Autowired
	CategoryService categoryService;
	
	/**
	 * 店員ログイン画面に遷移する
	 */
	@GetMapping("/toClerkLogin")
	public String toClerkLogin(HttpSession session) {
		session.removeAttribute("clerk");
        return "clerkLogin";
    }
	/**
	 * メニュー一覧画面に遷移する
	 */
	@GetMapping("/topMenu")
    public String topMenu(HttpSession session) {
		session.removeAttribute("title");
		session.removeAttribute("category");
		session.removeAttribute("selTitle");
		session.removeAttribute("selStockTitle");
		session.removeAttribute("stock");
		session.removeAttribute("insertNum");
        return "topMenu";
    }
	/**
	 * 会員登録フォームに遷移する
	 * 都道府県のリストをロードする
	 */
	@GetMapping("/custRegForm")
	public String custRegForm(Model model, HttpSession session) {
	    List<Prefecture> prefectureList = prefectureService.getAllPrefectures();
	    session.setAttribute("prefectureList", prefectureList);
	    return "custRegForm";
	}
	/**
	 * 会員検索フォームに遷移する
	 */
	@GetMapping("/custSelForm")
	public String custSelForm() {
		return "custSelForm";
	}
	
	/**
	 * タイトル登録フォームに遷移する
	 */
	@GetMapping("/titleRegForm")
	public String titleRegForm(Model model) {
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "titleRegForm";
	}
	/**
	 * タイトル検索フォームに遷移する
	 */
	@GetMapping("/titleSelForm")
	public String titleSelForm() {
		return "titleSelForm";
	}
	/**
	 * 在庫登録フォームに遷移する
	 */
	@GetMapping("/stockRegForm")
	public String stockRegForm() {
		return "stockRegForm";
	}
	/**
	 * 在庫検索フォームに遷移する
	 */
	@GetMapping("/stockSelForm")
	public String stockSelForm(Model model,HttpSession session) {
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		// 在庫詳細
		session.removeAttribute("stock");
		return "stockSelForm";
	}
	/**
	 * カテゴリー登録フォームに遷移する
	 */
	@GetMapping("categoryRegForm")
	public String categoryRegForm() {
		return "categoryRegForm";
	}
	/**
	 * カテゴリー検索フォームに遷移する
	 */
	@GetMapping("categoryForm")
	public String categoryForm(Model model, HttpSession session) {
		return "categoryForm";
	}
}
