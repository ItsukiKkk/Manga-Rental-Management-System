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
    <title>更新完了</title>
<style type="text/css">
	.layui-form-label {
		width:200px;
	}
	.layui-input {
		width:300px;
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
                  <a>会員詳細</a>
                  <a>会員更新フォーム</a>
                  <a>会員更新確認</a>
                  <a><cite>会員更新完了</cite></a>
                </span>
                <h2 class="title">会員更新完了</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">				
				<div class="layui-card-header"></div>
					<form class="layui-form layui-card-body" action="" method="post">
						<div class="layui-form-item">
							<label class="layui-form-label">会員ID：</label>
							<div class="layui-input-inline">
								<input type="text" name="memId" class="layui-input" value="${customer.memId}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">名前：</label>
							<div class="layui-input-inline">
								<input type="text" name="fullname" class="layui-input" value="${customer.lastname} ${customer.firstname}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<div>
								<h2><b><font color="#149BD3">更新が完了しました</font></b></h2>
							</div>
						</div>
						<div class="layui-form-item" id="toMenuBtn">
							<label class="layui-form-label">&nbsp;</label>
								<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/custUpdateForm">メインメニュー</button>	
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
			メインメニューに遷移する
		*/
		function redirectToMainMenu() {
		    window.location.href = "${pageContext.request.contextPath}/topMenu";
		}
	</script>
</body>
</html>