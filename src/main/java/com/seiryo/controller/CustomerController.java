package com.seiryo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.seiryo.pojo.CustRegForm;
import com.seiryo.pojo.Customer;
import com.seiryo.pojo.DateDTO;
import com.seiryo.pojo.Prefecture;
import com.seiryo.pojo.Statistical;
import com.seiryo.service.CustomerService;
import com.seiryo.service.PrefectureService;
import com.seiryo.service.StatisticalService;
import com.seiryo.utils.DateUtils;
import com.seiryo.utils.MD5Utils;

/**
 * コントロール層：店員情報
 */
@Controller
public class CustomerController {
	private static final String FILE_DIRECTORY = "D:/tempData/";
	@Autowired
	CustomerService customerService;
	@Autowired
	PrefectureService prefectureService;
	@Autowired
	StatisticalService statisticalService;
	/**
	 * 会員登録確認画面に遷移する
	 * 
	 * @param custRegForm
	 * @return
	 */
	@RequestMapping("/toCustRegConfirm")
	public ModelAndView toCustRegConfirm(@ModelAttribute CustRegForm custRegForm, HttpSession session) {
		String lastname = custRegForm.getLastname();
		String firstname = custRegForm.getFirstname();
		String lastkana = custRegForm.getLastkana();
		String firstkana = custRegForm.getFirstkana();
		int year = custRegForm.getYear();
		int month = custRegForm.getMonth();
		int day = custRegForm.getDay();
		String post = custRegForm.getPost();
		String addr1 = custRegForm.getAddr1();
		String addr2 = custRegForm.getAddr2();
		String addr3 = custRegForm.getAddr3();
		String tel1 = custRegForm.getTel1();
		String tel2 = custRegForm.getTel2();
		String tel3 = custRegForm.getTel3();
		String password = custRegForm.getPassword();
		int idFlag = custRegForm.getIdFlag();
		int applyYear = custRegForm.getApplyYear();
		int applyMonth = custRegForm.getApplyMonth();
		int applyDay = custRegForm.getApplyDay();
		// 生年月日の文字列を設定する
		String birthdate = String.format("%04d-%02d-%02d", year, month, day);
		// 入会日
		String applyDate = String.format("%04d-%02d-%02d", applyYear, applyMonth, applyDay);
		// 更新日
		String expiryDate = String.format("%04d-%02d-%02d", applyYear, applyMonth, applyDay);
		// 会員のオブジェクト
		Customer customer = new Customer(lastname, lastkana, firstname, firstkana, birthdate, post, addr1, addr2, addr3,
				tel1, tel2, tel3, password, idFlag, applyDate, expiryDate, 0);
		ModelAndView modelAndView = new ModelAndView("custRegConfirm");
		modelAndView.addObject("customer", customer);
		modelAndView.addObject("custRegForm", custRegForm);
		// custRegFormオブジェクトをセッションに保存する
		session.setAttribute("custRegForm", custRegForm);
		return modelAndView;
	}

	/**
	 * 会員情報を登録し、登録成功画面に遷移する
	 * 
	 * @param customer
	 * @param session
	 * @return
	 */
	@RequestMapping("/toCustRegSuccess")
	public ModelAndView toCustRegSuccess(@ModelAttribute Customer customer, HttpSession session) {
		// パスワードをMD5値に変換する
		String passwordMD5 = MD5Utils.encode(customer.getPassword());
		customer.setPassword(passwordMD5);
		int insertFlag = 0;
		try {
			insertFlag = customerService.insertCustomer(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 会員情報をデータベースに登録する
		ModelAndView modelAndView = new ModelAndView();
		// 成功した場合
		if (insertFlag != 0) {
			modelAndView.setViewName("custRegSuccess");
			modelAndView.addObject("customer", customer);
			// sessionからcustomer属性を削除する
			session.removeAttribute("custRegForm");
		} else {
			// 登録が失敗した場合、登録確認画面に戻る
			modelAndView.setViewName("custRegConfirm");
			modelAndView.addObject("errorMsg", "システムエラーが発生しました。しばらくしてから再度お試しください");
		}
		return modelAndView;
	}

	/**
	 * 検索フォームから検索条件を取得し、会員一覧画面へ遷移する
	 * 
	 * @param memId
	 * @param lastname
	 * @param firstname
	 * @param lastkana
	 * @param firstkana
	 * @return
	 */
	@RequestMapping("/toCustSelList")
	public ModelAndView toCustSelList(@RequestParam(name = "memId", required = false) String memId,
			@RequestParam(name = "lastname", required = false) String lastname,
			@RequestParam(name = "firstname", required = false) String firstname,
			@RequestParam(name = "lastkana", required = false) String lastkana,
			@RequestParam(name = "firstkana", required = false) String firstkana, HttpSession session) {
		// 検索条件をプロジェクトに代入する
		Customer customer = new Customer();
		customer.setMemId(memId);
		customer.setLastname(lastname);
		customer.setFirstname(firstname);
		customer.setLastkana(lastkana);
		customer.setFirstkana(firstkana);
		// 検索を行う
		List<Customer> customerList = customerService.getCustomerList(customer);
		// 検索結果をJSON形式に変換する
		Gson gson = new Gson();
		String jsonCustList = gson.toJson(customerList);
		// 検索されたリストを処理する
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("custSelList");
		modelAndView.addObject("jsonCustList", jsonCustList);
		return modelAndView;
	}

	/**
	 * 会員詳細画面に遷移する
	 * 
	 * @return
	 */
	@RequestMapping("/toCustSelDetails")
	public ModelAndView toCustSelDetails(@RequestParam("memId") String medId, HttpSession session) {
		// セッションから更新用のデータを削除する
		session.removeAttribute("customer");
		session.removeAttribute("birthDateDTO");
		session.removeAttribute("applyDateDTO");
		session.removeAttribute("expiryDateDTO");
		// 会員IDによる会員情報の検索を行う
		Customer customer = customerService.getCustomerById(medId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("custSelDetails");
		modelAndView.addObject("customer", customer);
		return modelAndView;
	}

	/**
	 * 会員情報更新フォーム画面に遷移する
	 * @param medId
	 * @param session
	 * @return
	 */
	@RequestMapping("/toCustUpdateForm")
	public ModelAndView toCustUpdateForm(@RequestParam("memId") String memId, HttpSession session) {
	    // sessionからデータを取得する
	    Customer customer = (Customer) session.getAttribute("customer");
	    DateDTO birthDateDTO = (DateDTO) session.getAttribute("birthDateDTO");
	    DateDTO applyDateDTO = (DateDTO) session.getAttribute("applyDateDTO");
	    DateDTO expiryDateDTO = (DateDTO) session.getAttribute("expiryDateDTO");
	    // 都道府県リストを取得する
	    List<Prefecture> prefectureList = prefectureService.getAllPrefectures();

	    if (customer == null || birthDateDTO == null || applyDateDTO == null || expiryDateDTO == null || prefectureList == null) {
	        // 会員IDによる会員情報の検索を行う
	        customer = customerService.getCustomerById(memId);
	        // 生年月日と入会日と有効期限日を取得する
	        String birthDate = customer.getBirthdate();
	        String applyDate = customer.getApplyDate();
	        String expiryDate = customer.getExpiryDate();
	        // 日付文字列から年、月、日を抽出し、DateDTO オブジェクトを作成する
	        birthDateDTO = DateUtils.extractDate(birthDate);
	        applyDateDTO = DateUtils.extractDate(applyDate);
	        expiryDateDTO = DateUtils.extractDate(expiryDate);
	        
	    }
	    ModelAndView modelAndView = new ModelAndView("custUpdateForm");
	    modelAndView.addObject("prefectureList", prefectureList);
	    modelAndView.addObject("customer", customer);
	    modelAndView.addObject("birthDateDTO", birthDateDTO);
	    modelAndView.addObject("applyDateDTO", applyDateDTO);
	    modelAndView.addObject("expiryDateDTO", expiryDateDTO);
	    return modelAndView;
	}

	
	/**
	 * 会員更新確認画面に遷移する
	 * 
	 * @param medId
	 * @param session
	 * @return
	 */
	@RequestMapping("/toCustUpdateConfirm")
	public ModelAndView toCustUpdateConfirm(@ModelAttribute("customer") Customer customer,
			@RequestParam("year") int year,
            @RequestParam("month") int month,
            @RequestParam("day") int day,
            @RequestParam("applyYear") int applyYear,
            @RequestParam("applyMonth") int applyMonth,
            @RequestParam("applyDay") int applyDay,
            @RequestParam("expiryYear") int expiryYear,
            @RequestParam("expiryMonth") int expiryMonth,
            @RequestParam("expiryDay") int expiryDay, 
            HttpSession session) {
		// DateDTOオブジェクトに生成する
		DateDTO birthDateDTO = new DateDTO(year, month, day);
		DateDTO applyDateDTO = new DateDTO(applyYear, applyMonth, applyDay);
		DateDTO expiryDateDTO = new DateDTO(expiryYear, expiryMonth, expiryDay);
		// sessionに保存する
		session.setAttribute("customer", customer);
		session.setAttribute("birthDateDTO", birthDateDTO);
		session.setAttribute("applyDateDTO", applyDateDTO);
		session.setAttribute("expiryDateDTO", expiryDateDTO);
		// DateDTOオブジェクトから年、月、日を取得し、yyyy-MM-dd形式の日付文字列を作成する
		String birthDate = DateUtils.concatDate(birthDateDTO);
		String applyDate = DateUtils.concatDate(applyDateDTO);
		String expiryDate = DateUtils.concatDate(expiryDateDTO);
		// 会員オブジェクトに代入する
		customer.setBirthdate(birthDate);
		customer.setApplyDate(applyDate);
		customer.setExpiryDate(expiryDate);
		ModelAndView modelAndView = new ModelAndView("custUpdateConfirm");
		modelAndView.addObject("customer",customer);
		return modelAndView;

	}

	/**
	 * 会員情報を更新し、更新完了画面に遷移する
	 * 
	 * @param medId
	 * @param session
	 * @return
	 */
	@RequestMapping("/toCustUpdateSuccess")
	public ModelAndView toCustUpdateSuccess(@ModelAttribute Customer customer, HttpSession session) {
		// 入力されたパスワードを取得する
		String password = customer.getPassword();
		// 更新前のパスワードを取得する
		String oldPassword = customerService.getCustomerById(customer.getMemId()).getPassword();
		
		System.out.println(password);
		System.out.println(oldPassword);
		// パスワードが更新必要の場合
		if (!oldPassword.equals(password)) {
			// パスワードを加工する
			String passwordMd5 = MD5Utils.encode(password);
			customer.setPassword(passwordMd5);
		}
		// 会員情報を更新する
		int updateFlag = customerService.updateCustomer(customer);
		ModelAndView modelAndView = new ModelAndView();
		// 成功した場合
		if (updateFlag != 0) {
			modelAndView.setViewName("custUpdateSuccess");
			modelAndView.addObject("customer", customer);
			// セッションから更新用のデータを削除する
			session.removeAttribute("customer");
			session.removeAttribute("birthDateDTO");
			session.removeAttribute("applyDateDTO");
			session.removeAttribute("expiryDateDTO");
		} else {
			// 登録が失敗した場合、登録フォーム画面に戻る			
			modelAndView.setViewName("custUpdateForm");
			// パスワードリセットする
			customer.setPassword(password);
		}
		return modelAndView;
	}

	/**
	 * 会員退会確認画面に遷移する
	 * 
	 * @param medId
	 * @return
	 */
	@RequestMapping("/toCustCancleConfirm")
	public ModelAndView toCustCancleConfirm(@RequestParam("memId") String medId) {
		// 会員IDによる会員情報の検索を行う
		Customer customer = customerService.getCustomerById(medId);
		ModelAndView modelAndView = new ModelAndView("custCancleConfirm");
		modelAndView.addObject("customer", customer);
		return modelAndView;
	}

	/**
	 * 会員退会を処理し、成功画面に遷移する
	 * 
	 * @param medId
	 * @return
	 */
	@RequestMapping("/toCustCancleSuccess")
	public ModelAndView toCustCancleSuccess(@RequestParam("memId") String medId) {
		// 会員IDによる会員情報の検索を行う
		Customer customer = customerService.getCustomerById(medId);
		ModelAndView modelAndView = new ModelAndView();
		// 退会処理
		customerService.cancelCustomer(medId);
		modelAndView.setViewName("custCancelSuccess");
		modelAndView.addObject("customer", customer);
		return modelAndView;
		}
		/*
		 * 会員統計
		 */
		@RequestMapping("/tocustDataList")
		public ModelAndView tocustDataList() {
			// 検索を行う
			List<Statistical> statisticalList = statisticalService.allStatistical();
			// 検索結果をJSON形式に変換する
			Gson gson = new Gson();
			String jsonStatisticalList = gson.toJson(statisticalList);
			// 検索されたリストを処理する
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("custDataList");
			modelAndView.addObject("jsonStatisticalList", jsonStatisticalList);
			return modelAndView;
		}
		
		/*
		 * 会員統計データダウロート
		 */
		@RequestMapping("/toCustDownload")
		public ResponseEntity<FileSystemResource> downloadFile(@RequestParam String fileName, @RequestParam String id) {
			
			File file = new File(FILE_DIRECTORY + fileName);
	        System.out.println(fileName);
	        if (!file.exists()) {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	        }

	        FileSystemResource resource = new FileSystemResource(file);
	        int number = statisticalService.getDownloadNumber(id) + 1;
	        statisticalService.updateStatisticalNumber(id,number);
	        return ResponseEntity.ok()
	                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + file.getName())
	                .header(HttpHeaders.CONTENT_TYPE, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
	                .body(resource);
	   }
		@RequestMapping("/toProduct")
		public ResponseEntity<Resource> toProduct() throws IOException {
			String fileName = LocalDate.now() + ".xlsx";
			LocalDate beginDateTime = LocalDate.parse("2024-12-31", DateTimeFormatter.ofPattern("yyyy-MM-dd"));

	        File file = statisticalService.exportToExcel(fileName, beginDateTime);  // 调用生成报告的方法

	        // 加载文件为 Resource
	        Path path = file.toPath();
	        Resource resource = new UrlResource(path.toUri());

	        // 设置 Content-Disposition 触发客户端下载
	        return ResponseEntity.ok()
	                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileName)
	                .contentType(MediaType.APPLICATION_OCTET_STREAM)
	                .body(resource);
		}
}


