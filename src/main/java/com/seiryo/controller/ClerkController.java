package com.seiryo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.seiryo.pojo.Clerk;
import com.seiryo.service.ClerkService;
import com.seiryo.utils.MD5Utils;
/**
 * コントロール：店員
 */
@Controller
public class ClerkController {
	@Autowired
	private ClerkService clerkService;
	
	/**
	 * 店員ログイン
	 * @param clerkId
	 * @param password
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/clerkLogin")
	public String clerkLogin(@RequestParam("clerkId") String clerkId, @RequestParam("password") String password, HttpSession session,
			Model model) {
		String passwordEncode = MD5Utils.encode(password);
	    Clerk clerk = clerkService.getClerkById(clerkId);
	    if (clerk != null && clerk.getPassword().equals(passwordEncode)) {
	    	session.setAttribute("clerk", clerk);
			return "main";
		} else {
			model.addAttribute("msg", "IDもしくはパスワードが正しくありません！");
			return "clerkLogin";
		}
	}
}
