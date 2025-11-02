<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>会員登録確認</title>
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
                  <a>会員登録</a>
                  <a><cite>登録確認</cite></a>
                </span>
                <h2 class="title">登録確認</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">				
				<div class="layui-card-header"></div>
					<form class="layui-form layui-card-body" action="toCustRegSuccess" method="post">
						<div class="layui-form-item">
							<label class="layui-form-label">姓：</label>
							<div class="layui-input-inline">
								<input type="text" name="lastname" class="layui-input" value="${customer.lastname}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">名：</label>
							<div class="layui-input-inline">
								<input type="text" name="firstname" class="layui-input" value="${customer.firstname}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">姓カナ：</label>
							<div class="layui-input-inline">
								<input type="text" name="lastkana" class="layui-input" value="${customer.lastkana}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">名カナ：</label>
							<div class="layui-input-inline">
								<input type="text" name="firstkana" class="layui-input" value="${customer.firstkana}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">生年月日：</label>
							<div class="layui-input-inline">
								<input type="text" class="layui-input" value="${custRegForm.year}-${custRegForm.month}-${custRegForm.day}" readonly/>
								<input type="hidden" name="birthdate" value="${customer.birthdate}">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">郵便番号：</label>
							<div class="layui-input-inline">
								<input type="text" name="post" class="layui-input" value="${customer.post}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">住所（都道府県）：</label>
							<div class="layui-input-inline">
								<input type="text" name="addr1"  class="layui-input" value="${customer.addr1}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">住所（区市町村）：</label>
							<div class="layui-input-inline">
								<input type="text" name="addr2" class="layui-input" value="${customer.addr2}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">住所（町名番地）：</label>
							<div class="layui-input-inline">
								<input type="text" name="addr3" class="layui-input" value="${customer.addr3}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">電話番号：</label>
							<div class="layui-input-inline">
								<input type="text"  class="layui-input" value="${customer.tel1}‐${customer.tel2}‐${customer.tel3}" readonly/>
								<input type="hidden" name="tel1" value="${customer.tel1}" />
								<input type="hidden" name="tel2" value="${customer.tel2}" />
								<input type="hidden" name="tel3" value="${customer.tel3}" />
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">パスワード：</label>
							<div class="layui-input-inline">
								<input type="text" name="password" class="layui-input" value="${customer.password}" readonly/>
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
								<input type="text" class="layui-input" value="${custRegForm.applyYear}-${custRegForm.applyMonth}-${custRegForm.applyDay}" readonly/>
								<input type="hidden" name="applyDate" value="${customer.applyDate}"/>
								<input type="hidden" name="expiryDate" value="${customer.expiryDate}"/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<div class="layui-input-inline">
								<button type="submit" class="layui-btn layui-btn-blue">登録</button>
								<button type="button" class="layui-btn layui-btn-primary" onclick="backToRegForm()">修正</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="static/layui.all.js"></script>	
	<script src="static/js/home.js"></script>
	<script>
	    function backToRegForm() {
	        window.location.href = "${pageContext.request.contextPath}/custRegForm";
	    }
	    /*
			エラーメッセージ
		*/
		var errorMsg = "${errorMsg}";
	    if (errorMsg) {
	        layer.msg(errorMsg);
	    }
	</script>
</body>
</html>