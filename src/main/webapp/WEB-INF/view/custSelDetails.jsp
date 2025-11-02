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
    <title>会員詳細画面</title>
<style type="text/css">
	.layui-form-label {
		width:200px;
	}
	.layui-input {
		width:400px;
	}
</style>
</head>
<body class="layui-view-body">
	<div class="layui-content">
		<div class="layui-page-header">
            <div class="pagewrap">
                <span class="layui-breadcrumb">
                  <a>会員検索</a>
                  <a>会員一覧</a>
                  <a><cite>会員詳細情報</cite></a>
                </span>
                <h2 class="title">会員詳細情報</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">				
				<div class="layui-card-header"></div>
					<form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toCustUpdateForm" method="post">
						<div class="layui-form-item">
							<label class="layui-form-label">会員ID：</label>
							<div class="layui-input-inline">
								<input type="text" name="memId" class="layui-input" value="${customer.memId}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">氏名：</label>
							<div class="layui-input-inline">
								<input type="text" name="fullname" class="layui-input" value="${customer.lastname} ${customer.firstname}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">氏名カナ：</label>
							<div class="layui-input-inline">
								<input type="text" name="fullkana" class="layui-input" value="${customer.lastkana} ${customer.firstkana}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">生年月日：</label>
							<div class="layui-input-inline">
								<input type="text" name="birthdate" class="layui-input" value="${customer.birthdate}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">郵便番号：</label>
							<div class="layui-input-inline">
								<input type="text" name="post" class="layui-input" value="${customer.post}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">住所：</label>
							<div class="layui-input-inline">
								<input type="text" name="fulladdr" class="layui-input" value="${customer.addr1} ${customer.addr2} ${customer.addr3}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">電話番号：</label>
							<div class="layui-input-inline">
								<input type="text" name="fulltel" class="layui-input" value="${customer.tel1}‐${customer.tel2}‐${customer.tel3}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">身分証明書：</label> 
							<div class="layui-input-inline">
								<input type="text" name="idType" class="layui-input" value="${customer.idFlag == 0 ? '運転免許証' : customer.idFlag == 1 ? '健康保険証' : customer.idFlag == 9 ? 'そのほか' : ''}" readonly/>
								<input type="hidden" name="idFlag" class="layui-input" value="${customer.idFlag}"/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">入会日：</label>
							<div class="layui-input-inline">
								<input type="text" name="applyDate"  class="layui-input" value="${customer.applyDate}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">更新日：</label>
							<div class="layui-input-inline">
								<input type="text" name="expiryDate" class="layui-input" value="${customer.expiryDate}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
								<button type="submit" class="layui-btn layui-btn-blue">更新</button>
								<button type="button" class="layui-btn layui-btn-blue" onclick="toCustCancleConfirm()">退会</button>
								<button type="button" class="layui-btn layui-btn-primary" onclick="backToCustList()">会員一覧</button>
						</div>
						<div class="layui-form-item" id="toMenuBtn">
							<label class="layui-form-label">&nbsp;</label>
								<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/custSelForm">メインメニュー</button>	
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
			会員退会画面に遷移する
		*/
		function　toCustCancleConfirm() {
			var memId = "${customer.memId}"
			window.location.href = "${pageContext.request.contextPath}/toCustCancleConfirm?memId="+ memId;
		}
		/*
			会員一覧画面に戻る
		*/
		function backToCustList() {
		    window.location.href = "${pageContext.request.contextPath}/toCustSelList";
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