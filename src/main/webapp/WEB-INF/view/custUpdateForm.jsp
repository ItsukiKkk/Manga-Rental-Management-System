<%@page import="com.seiryo.pojo.DateDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="static/css/layui.css">
    <link rel="stylesheet" href="static/css/view.css">
    <link rel="icon" href="static/images/r.ico">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>更新フォーム</title>
</head>
<body class="layui-view-body">
	<div class="layui-content">
		<div class="layui-page-header">
            <div class="pagewrap">
                <span class="layui-breadcrumb">
                  <a>会員検索</a>
                  <a>会員一覧</a>
                  <a>会員詳細</a>
                  <a><cite>会員更新</cite></a>
                </span>
                <h2 class="title">会員更新フォーム</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">
				<div class="layui-card-header"></div>
				<form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toCustUpdateConfirm" method="post">
					<!-- 
						会員ID、氏名、氏名カナ、生年月日、郵便番号、住所、電話番号、パスワード、身分証明書、入会日、更新日
					 -->
					<div class="layui-form-item">
						<label class="layui-form-label">会員ID</label>
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-inline">
							<input type="text" name="memId" class="layui-input" value="${customer.memId}" readonly/>
						</div>
						<div class="layui-form-mid layui-word-aux"><font color="#149BD3">*更新不可</font></div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">氏名</label>
						<div class="layui-input-block"  style="display: flex; align-items: center;">
							<label class="layui-form-label">姓</label>
							<input type="text"
								name="lastname" lay-verify="required|maxlength" placeholder=""
								class="layui-input" maxlength="20" value="${customer.lastname}">
							<label class="layui-form-label">名</label>
							<input type="text"
								name="firstname" lay-verify="required|maxlength" placeholder=""
								class="layui-input" maxlength="20" value="${customer.firstname}">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">氏名カナ</label>
						<div class="layui-input-block"  style="display: flex; align-items: center;">
							<label class="layui-form-label">姓</label>
							<input type="text"
								name="lastkana" required lay-verify="required|maxlength" placeholder="全角カタカナ"
								class="layui-input" maxlength="40" pattern="[\u30A1-\u30F6]*" value="${customer.lastkana}">
							<label class="layui-form-label">名</label>
							<input type="text"
								name="firstkana" required lay-verify="required|maxLength" placeholder="全角カタカナ"
								class="layui-input" maxLength="40" pattern="[\u30A1-\u30F6]*" value="${customer.firstkana}">
						</div>
					</div>
					<div class="layui-form-item">
					    <label class="layui-form-label">生年月日</label>
						<label class="layui-form-label">&nbsp;</label>
					    <div class="dateDropList" class="layui-input-block"  style="display: flex; align-items: center; ">
					        <select name="year" lay-filter="year" lay-verify="required" id="yearSelect" >
					            <!-- 「年」を動的に生成 -->
					        </select>
					        <label>年</label>
					        <select name="month" lay-filter="month" lay-verify="required" id="monthSelect">
					            <!-- 「月」を動的に生成　-->
					        </select>
					        <label>月</label>
					        <select name="day" lay-filter="day" lay-verify="required" id="daySelect">
					            <!-- 「日」を動的に生成 -->
					        </select>
					        <label>日</label>
					    </div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">郵便番号</label>
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-inline">
							<input type="text" name="post"
								lay-verify="required|number|maxlength" placeholder=""
								class="layui-input" maxlength="7" value="${customer.post}" >
						</div>
					</div>
					<div class="layui-form-item">
					    <label class="layui-form-label">住所</label>
					    <div class="layui-input-block"  style="display: flex; align-items: center;" >
					    	<label class="layui-form-label">都道府県</label>
					        <select name="addr1" lay-verify="required" id="addr1Select" style="width: auto;">
					            <!-- 「都道府県」を動的に生成 -->
					            <c:forEach items="${prefectureList}" var="prefecture">
							        <option value="${prefecture.preName}" ${prefecture.preName == customer.addr1 ? 'selected' : ''}>${prefecture.preName}</option>
							    </c:forEach>
					        </select>
					        <label class="layui-form-label">区市町村</label>
					        <input type="text" name="addr2"
								lay-verify="required|maxlength" placeholder=""
								class="layui-input" style="width: 200px;" maxlength="30" value="${customer.addr2}">
					        <label class="layui-form-label">町名番地</label> 
					        <input type="text" name="addr3"
								lay-verify="required|maxlength" placeholder=""
								class="layui-input" style="width: 400px;" maxlength="100" value="${customer.addr3}">
					    </div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">電話番号</label>
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-block"  style="display: flex; align-items: center;">
							<input type="text"
								name="tel1" required lay-verify="required|number|maxlength" placeholder=""
								class="layui-input" style="width: 80px;" maxlength="4" value="${customer.tel1}">
							<label>&nbsp;——&nbsp;</label>
							<input type="text"
								name="tel2" required lay-verify="required|number|maxLength" placeholder=""
								class="layui-input" style="width: 80px;" maxLength="4" value="${customer.tel2}">
							<label>&nbsp;——&nbsp;</label>
							<input type="text"
								name="tel3" required lay-verify="required|number|maxlength" placeholder=""
								class="layui-input" style="width: 80px;"  maxlength="4" value="${customer.tel3}">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">パスワード</label>
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-inline">
							<input type="password" name="password"
								lay-verify="required|maxlength" placeholder="" class="layui-input" maxlength="20" value="${customer.password}">
						</div>
						<div class="layui-form-mid layui-word-aux">半角数字または英文字で20桁数以内</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">身分証明書</label>
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-block">
							<input type="radio" name="idFlag" value="0" title="運転免許証" checked>
							<input type="radio" name="idFlag" value="1" title="健康保険証" ${customer.idFlag eq 1 ? 'checked' : ''}>
							<input type="radio" name="idFlag" value="9" title="その他" ${customer.idFlag eq 9 ? 'checked' : ''}>
						</div>
					</div>
					<div class="layui-form-item">
					    <label class="layui-form-label">入会日</label>
					    <label class="layui-form-label">&nbsp;</label>
					    <div class="dateDropList" class="layui-input-block"  style="display: flex; align-items: center; ">
					        <select name="applyYear" lay-filter="applyYear" lay-verify="required" id="applyYearSelect">
					            <!-- 「年」を動的に生成 -->
					        </select>
					        <label>年</label>
					        <select name="applyMonth" lay-filter="applyMonth" lay-verify="required" id="applyMonthSelect">
					            <!-- 「月」を動的に生成　-->
					        </select>
					        <label>月</label>
					        <select name="applyDay" lay-filter="applyDay" lay-verify="required" id="applyDaySelect">
					            <!-- 「日」を動的に生成 -->
					        </select>
					        <label>日</label>
					    </div>
					</div>
					<div class="layui-form-item">
					    <label class="layui-form-label">更新日</label>
					    <label class="layui-form-label">&nbsp;</label>
					    <div class="dateDropList" class="layui-input-block"  style="display: flex; align-items: center; ">
					        <select name="expiryYear" lay-filter="expiryYear" lay-verify="required" id="expiryYearSelect">
					            <!-- 「年」を動的に生成 -->
					        </select>
					        <label>年</label>
					        <select name="expiryMonth" lay-filter="expiryMonth" lay-verify="required" id="expiryMonthSelect">
					            <!-- 「月」を動的に生成　-->
					        </select>
					        <label>月</label>
					        <select name="expiryDay" lay-filter="expiryDay" lay-verify="required" id="expiryDaySelect">
					            <!-- 「日」を動的に生成 -->
					        </select>
					        <label>日</label>
					    </div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">会員状況</label>
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-inline">
							<input type="text" name="showDelFlag" class="layui-input" value="${customer.delFlag eq 0 ? '会員' : '退会者' }" readonly/>					
							<input type="hidden" name="delFlag" value="${customer.delFlag}"/>
						</div>
						<div class="layui-form-mid layui-word-aux"><font color="#149BD3">*更新不可</font></div>
					</div>
					<div class="layui-form-item">					
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-block">
							<button type="submit" class="layui-btn layui-btn-blue">確認</button>
							<button type="button" class="layui-btn layui-btn-primary" onclick="backToCustDetails()">キャンセル</button>
						</div>
					</div>
					<div class="layui-form-item" id="toMenuBtn">
						<label class="layui-form-label">&nbsp;</label>
						<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/custUpdateForm">メインメニューへ</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="static/layui.all.js"></script>	
	<script src="static/js/home.js"></script>
	<script>
		/*
			会員登録フォーム認証の処理
		*/
		$(document).ready(function() {			
		    // 氏名
		    $('input[name="lastname"], input[name="firstname"]').blur(function() {
		        var value = $(this).val();
		        if (value.length > 20) {
		            layer.msg('姓、名は20桁数以内で入力してください', {icon: 2});
		            $(this).val(value.substring(0, 20));
		        }
		    });
	
		    // 氏名カナ
		    $('input[name="lastkana"], input[name="firstkana"]').blur(function() {
		        var value = $(this).val();
		        var pattern = /^[\u30A1-\u30F6]*$/;
		        if (!pattern.test(value) || value.length > 40) {
		            layer.msg('姓、名カナは全角カタカナ40桁数以内で入力してください', {icon: 2});
		            $(this).val('');
		        }
		    });
	
		    // 郵便番号
		    $('input[name="post"]').blur(function() {
		        var value = $(this).val();
		        var pattern = /^\d{7}$/;
		        if (!pattern.test(value)) {
		            layer.msg('郵便番号は7桁数の数字で入力してください', {icon: 2});
		            $(this).val('');
		        }
		    });
	
		    // 市外局番
		    $('input[name="tel1"]').blur(function() {
			    var value = $(this).val();
			    var pattern = /^\d{3,4}$/;
			    if (!pattern.test(value)) {
			        layer.msg('電話番号の形式が誤ります', {icon: 2});
			        $(this).val('');
			    }
			});
		    $('input[name="tel2"], input[name="tel3"]').blur(function() {
		        var value = $(this).val();
		        var pattern = /^\d{4}$/; 
		        if (!pattern.test(value)) {
		            layer.msg('電話番号の形式が誤ります', {icon: 2});
		            $(this).val('');
		        }
		    });
		
		    // パスワードが半角数字または英文字で20桁数以内
		    $('input[name="password"]').blur(function() {
		        var value = $(this).val();
		        var pattern = /^[a-zA-Z0-9]{1,20}$/;
		        if (!pattern.test(value)) {
		            layer.msg('パスワードの形式が誤ります', {icon: 2});
		            $(this).val('');
		        }
		    });
	
		    // submitイベント
		    $('form').submit(function(event) {
		        event.preventDefault();
		        // 必須項目認証
		        var isValid = true;
		        $(this).find('input, select').each(function() {
		            if ($(this).val().trim() === '') {
		                layer.msg('すべての項目を入力してください', {icon: 2});
		                isValid = false;
		                return false; 
		            }
		        });
		        if (isValid) {
		            var formData = $(this).serialize();
		            var contextPath = "${pageContext.request.contextPath}";
		            $.ajax({
		            	async : true,
		                url: contextPath + '/toCustUpdateConfirm',
		                type: 'POST',
		                data: formData,
		                success: function(response) {
		                	document.write(response);
		                },
		                error: function(xhr, status, error) {
		                    console.error(error);
		                }
		            });
		        }
		    });
		 	
		});
		
		/* 
			年月日ドロップダウンリストの処理
		*/
		function setupDateDropdowns(yearSelector, monthSelector, daySelector, sessionYear, sessionMonth, sessionDay, monthFilter) {
		    layui.use(['form'], function () {
		        var form = layui.form;
		        var defaultDate = new Date();
		        var currentYear = defaultDate.getFullYear();
		        var currentMonth = defaultDate.getMonth() + 1; 
		        var currentDay = defaultDate.getDate();
		        
		        // デフォルト値を決定する
		        var yearDefaultValue = sessionYear != 0 ? sessionYear : currentYear;
				
		     	// 「年」のドロップダウンリスト（現在より100年までの値を取得する）
		        var yearList = "";
		     	// 有効期限日の場合
		     	if(yearSelector === '.dateDropList select[id=expiryYearSelect]') {
		     		console.log("成功"+ yearSelector);
		     		for (var i = currentYear + 1; i >= currentYear - 100; i--) {
 			            yearList += "<option value='" + i + "'>" + i + "</option>";
 			        }
 		     	} else {
 		     		for (var i = currentYear; i >= currentYear - 100; i--) {
			            yearList += "<option value='" + i + "'>" + i + "</option>";
			    }
 		     	}
		     	
		        $(yearSelector).html(yearList).val(yearDefaultValue);
	
		     	// 「月」のドロップダウンリスト（1～12）
		        var monthDefaultValue = sessionMonth != 0 ? sessionMonth : currentMonth;
		        var monthList = "";
		        for (var j = 1; j < 13; j++) {
		            monthList += '<option value="' + j + '">' + j + '</option>';
		        }
		        $(monthSelector).html(monthList).val(monthDefaultValue);
	
		     	// 「日」のドロップダウンリスト（デフォルト1～31）
		        var dayDefaultValue = sessionDay != 0 ? sessionDay : currentDay;
		        var dayList = "";
		        for (var day = 1; day <= 31; day++) {
		            dayList += '<option value="' + day + '">' + day + '</option>';
		        }
		        $(daySelector).html(dayList).val(dayDefaultValue);
	
		        form.on(monthFilter, function(data) {
		            var total;
		            var flag = $(yearSelector).val();
		            var currentMonth = data.value;
	
		            switch (currentMonth) {
		                case "1":
		                case "3":
		                case "5":
		                case "7":
		                case "8":
		                case "10":
		                case "12":
		                    total = 31;
		                    break;
		                case "4":
		                case "6":
		                case "9":
		                case "11":
		                    total = 30;
		                    break;
		                case "2":
		                    if ((flag % 4 == 0 && flag % 100 != 0) || flag % 400 == 0) {
		                        total = 29;
		                    } else {
		                        total = 28;
		                    }
		                    break;
		                default:
		                    break;
		            }
		            var dayOfMonth = "";
		            for (var day = 1; day <= total; day++) {
		                dayOfMonth += '<option value="' + day + '">' + day + '</option>';
		            }
		            
		            $(daySelector).html(dayOfMonth).val(dayDefaultValue);
		            form.render('select');
		        });
	
		        form.render();
		    });
		}
		/*
			sessionからフォームの年月日情報を取得する
		*/
		var sessionYear = '${birthDateDTO != null ? birthDateDTO.year : 0}';
		var sessionMonth = '${birthDateDTO != null ? birthDateDTO.month : 0}';
		var sessionDay = '${birthDateDTO != null ? birthDateDTO.day : 0}';
		var sessionApplyYear = '${applyDateDTO != null ? applyDateDTO.year : 0}';
		var sessionApplyMonth = '${applyDateDTO != null ? applyDateDTO.month : 0}';
		var sessionApplyDay = '${applyDateDTO != null ? applyDateDTO.day : 0}';
		var sessionExpiryYear = '${expiryDateDTO != null ? expiryDateDTO.year : 0}';
		var sessionExpiryMonth = '${expiryDateDTO != null ? expiryDateDTO.month : 0}';
		var sessionExpiryDay = '${expiryDateDTO != null ? expiryDateDTO.day : 0}';
	    // 代入する
	    setupDateDropdowns('.dateDropList select[id=yearSelect]', '.dateDropList select[id=monthSelect]', '.dateDropList select[id=daySelect]', sessionYear, sessionMonth, sessionDay, 'select(month)');
	    setupDateDropdowns('.dateDropList select[id=applyYearSelect]', '.dateDropList select[id=applyMonthSelect]', '.dateDropList select[id=applyDaySelect]', sessionApplyYear, sessionApplyMonth, sessionApplyDay, 'select(applyMonth)');
	    setupDateDropdowns('.dateDropList select[id=expiryYearSelect]', '.dateDropList select[id=expiryMonthSelect]', '.dateDropList select[id=expiryDaySelect]', sessionExpiryYear, sessionExpiryMonth, sessionExpiryDay, 'select(expiryMonth)');
		/*
			会員情報画面に戻る
		*/
	    function backToCustDetails() {
			var memId = "${customer.memId}";
			window.location.href = "${pageContext.request.contextPath}/toCustSelDetails?memId="+ memId;
		}
	    /*
			メインメニューに遷移する
		*/
		function redirectToMainMenu() {
		    window.location.href = "${pageContext.request.contextPath}/topMenu";
		}
	</script>
	
</body>
</html>