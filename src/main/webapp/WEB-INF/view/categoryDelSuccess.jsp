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
    <title>カテゴリー削除完了</title>
<style type="text/css">
	.layui-form-label {
		width:200px;
	}
	.layui-input {
		width:600px;
	}
</style>
</head>
<body class="layui-view-body">
	<div class="layui-content">
		<div class="layui-page-header">
            <div class="pagewrap">
                <span class="layui-breadcrumb">
                  <a>カテゴリー詳細</a>
                  <a>カテゴリー削除確認</a>
                  <a><cite>カテゴリー削除完了</cite></a>
                </span>
                <h2 class="title">カテゴリー削除</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">				
				<div class="layui-card-header">完了</div>
					<form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toTitleSelList" method="post">
						<div class="layui-form-item">							
							<input type="hidden" name="categoryCd" class="layui-input" value="${delCategory.categoryCd}"/>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<div>
								<h2><b><font color="#149BD3">${delCategory.category}</font>を削除しました。</b></h2>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<button type="button" class="layui-btn layui-btn-primary" id="toSelListBtn">カテゴリー一覧</button>
						</div>
						<div class="layui-form-item" id="toMenuBtn">
							<label class="layui-form-label">&nbsp;</label>
							<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/categoryForm">メインメニュー</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="static/layui.all.js"></script>	
	<script src="static/js/home.js"></script>
	<script>
		$(document).ready(function() {
	        /*
	            カテゴリー一覧画面に遷移する
	        */
	        $('#toSelListBtn').click(function() {
	            window.location.href = "${pageContext.request.contextPath}/toCategorySelList";
	        });
	
	        /*
	            メインメニューに遷移する
	        */
	        function redirectToMainMenu() {
	            window.location.href = "${pageContext.request.contextPath}/topMenu";
	        }
	    });
	</script>
</body>
</html>