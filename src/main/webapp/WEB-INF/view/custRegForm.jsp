<%@page import="com.seiryo.pojo.CustRegForm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="static/css/layui.css">
<link rel="stylesheet" href="static/css/view.css">
<link rel="icon" href="static/images/r.ico">
<title>会員登録フォーム</title>

</head>
<body class="layui-view-body">
	<div class="layui-content"  id="">
		<div class="layui-page-header">
            <div class="pagewrap">
                <h2 class="title">会員登録</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">
				<div class="layui-card-header">フォーム</div>
				<form class="layui-form layui-card-body">
					<!-- 
						氏名、氏名カナ、生年月日、郵便番号、住所、電話番号、パスワード、身分証明書、入会日
					 -->
					<div class="layui-form-item">
						<label class="layui-form-label">氏名</label>
						<div class="layui-input-block"  style="display: flex; align-items: center;">
							<label class="layui-form-label">姓</label>
							<input type="text"
								name="lastname" lay-verify="required|maxlength" placeholder=""
								class="layui-input" maxlength="20" value="${custRegForm.lastname}">
							<label class="layui-form-label">名</label>
							<input type="text"
								name="firstname" lay-verify="required|maxlength" placeholder=""
								class="layui-input" maxlength="20" value="${custRegForm.firstname}">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">氏名カナ</label>
						<div class="layui-input-block"  style="display: flex; align-items: center;">
							<label class="layui-form-label">姓</label>
							<input type="text"
								name="lastkana" lay-verify="required|maxlength" placeholder="全角カタカナ"
								class="layui-input" maxlength="40" pattern="[\u30A1-\u30F6]*" value="${custRegForm.lastkana}">
							<label class="layui-form-label">名</label>
							<input type="text"
								name="firstkana" lay-verify="required|maxLength" placeholder="全角カタカナ"
								class="layui-input" maxLength="40" pattern="[\u30A1-\u30F6]*" value="${custRegForm.firstkana}">
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
					        <select name="month" lay-filter="month" lay-verify="required" id="monthSelect" >
					            <!-- 「月」を動的に生成　-->
					        </select>
					        <label>月</label>
					        <select name="day" lay-filter="day" lay-verify="required" id="daySelect" >
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
								class="layui-input" maxlength="7" value="${custRegForm.post}" >
						</div>
					</div>
					<div class="layui-form-item">
					    <label class="layui-form-label">住所</label>
					    <div class="layui-input-block"  style="display: flex; align-items: center;" >
					    	<label class="layui-form-label">都道府県</label>
					        <select name="addr1" lay-verify="required" id="addr1Select" style="width: auto;">
					        	<option value="">-選択-</option>
					            <!-- 「都道府県」を動的に生成 -->
					            <c:forEach items="${prefectureList}" var="prefecture">
							        <option value="${prefecture.preName}" ${prefecture.preName == custRegForm.addr1 ? 'selected' : ''}>${prefecture.preName}</option>
							    </c:forEach>
					        </select>
					        <label class="layui-form-label">区市町村</label>
					        <input type="text" name="addr2"
								lay-verify="required|maxlength" placeholder=""
								class="layui-input" style="width: 200px;" maxlength="30" value="${custRegForm.addr2}">
					        <label class="layui-form-label">町名番地</label> 
					        <input type="text" name="addr3"
								lay-verify="required|maxlength" placeholder=""
								class="layui-input" style="width: 400px;" maxlength="100" value="${custRegForm.addr3}">
					    </div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">電話番号</label>
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-block"  style="display: flex; align-items: center;">
							<input type="text"
								name="tel1" lay-verify="required|number|maxlength" placeholder=""
								class="layui-input" style="width: 80px;" maxlength="4" value="${custRegForm.tel1}">
							<label>&nbsp;——&nbsp;</label>
							<input type="text"
								name="tel2" lay-verify="required|number|maxLength" placeholder=""
								class="layui-input" style="width: 80px;" maxLength="4" value="${custRegForm.tel2}">
							<label>&nbsp;——&nbsp;</label>
							<input type="text"
								name="tel3" lay-verify="required|number|maxlength" placeholder=""
								class="layui-input" style="width: 80px;"  maxlength="4" value="${custRegForm.tel3}">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">パスワード</label>
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-inline">
							<input type="password" name="password"
								lay-verify="required|maxlength" placeholder="" class="layui-input" maxlength="20" value="${custRegForm.password}">
						</div>
						<div class="layui-form-mid layui-word-aux">半角数字または英文字で20桁数以内</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">身分証明書</label>
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-block">
							<input type="radio" name="idFlag" value="0" title="運転免許証" checked>
							<input type="radio" name="idFlag" value="1" title="健康保険証" ${custRegForm.idFlag eq 1 ? 'checked' : ''}>
							<input type="radio" name="idFlag" value="9" title="その他" ${custRegForm.idFlag eq 9 ? 'checked' : ''}>
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
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-block">
							<button type="submit" class="layui-btn layui-btn-blue">登録</button>
							<button type="reset" class="layui-btn layui-btn-primary">リセット</button>
						</div>
					</div>
					<div class="layui-form-item" id="toMenuBtn">
						<label class="layui-form-label">&nbsp;</label>
						<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/custRegForm" >メインメニューへ</button>
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
		                url: contextPath + '/toCustRegConfirm',
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
		        for (var i = currentYear; i >= currentYear - 100; i--) {
		            yearList += "<option value='" + i + "'>" + i + "</option>";
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
		// sessionからフォームの年月日情報を取得する
		var sessionYear = "${custRegForm != null ? custRegForm.year : 0}";
	    var sessionMonth = "${custRegForm != null ? custRegForm.month : 0}";
	    var sessionDay = "${custRegForm != null ? custRegForm.day : 0}";
	    var sessionApplyYear = "${custRegForm != null ? custRegForm.applyYear : 0}";
	    var sessionApplyMonth = "${custRegForm != null ? custRegForm.applyMonth : 0}";
	    var sessionApplyDay = "${custRegForm != null ? custRegForm.applyDay : 0}";
	    // 代入する
	    setupDateDropdowns('.dateDropList select[name=year]', '.dateDropList select[name=month]', '.dateDropList select[name=day]', sessionYear, sessionMonth, sessionDay, 'select(month)');
	    setupDateDropdowns('.dateDropList select[name=applyYear]', '.dateDropList select[name=applyMonth]', '.dateDropList select[name=applyDay]', sessionApplyYear, sessionApplyMonth, sessionApplyDay, 'select(applyMonth)');
	
		/*
			メインメニューに遷移する
		*/
		function redirectToMainMenu() {
		    window.location.href = "${pageContext.request.contextPath}/topMenu";
		}
		$(":reset").click(function(){
			$('#addr1Select').prop('selectedIndex', 0);
    	　　var resetArr = $(this).parents("form").find(":text");
    	　　for(var i=0; i<resetArr.length; i++){
    	　　　　resetArr.eq(i).val("");
    	　　}
    	 	setupDateDropdowns('.dateDropList select[name=year]', '.dateDropList select[name=month]', '.dateDropList select[name=day]', sessionYear, sessionMonth, sessionDay, 'select(month)');
 	    	setupDateDropdowns('.dateDropList select[name=applyYear]', '.dateDropList select[name=applyMonth]', '.dateDropList select[name=applyDay]', sessionApplyYear, sessionApplyMonth, sessionApplyDay, 'select(applyMonth)');
 	    	return false;
    	});
	</script>
	
</body>
</html>