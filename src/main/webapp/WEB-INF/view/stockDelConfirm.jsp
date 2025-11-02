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
    <title>在庫削除確認</title>
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
                  <a>在庫詳細</a>
                  <a><cite>在庫削除確認</cite></a>
                </span>
                <h2 class="title">在庫削除</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">				
				<div class="layui-card-header">確認</div>
					<form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toStockDelSuccess" method="post">
						<div class="layui-form-item">
							<input type="hidden" name="stockNo" class="layui-input noborder" value="${stock.stockNo}"/>
							<input type="hidden" name="titleId" class="layui-input noborder" value="${stock.titleId}"/>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<div>
								<h2><b><font color="#149BD3">${stock.title.titleId} ${stock.title.title}</font>を削除しますか？</b></h2>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<button type="submit" class="layui-btn layui-btn-blue">削除</button>
							<button type="button" class="layui-btn layui-btn-primary" onclick="toTitleSelDetails()">在庫詳細</button>
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
			在庫詳細画面に戻る
		*/
	    function toTitleSelDetails() {
	    	var stockNo = document.getElementsByName("stockNo")[0].value;
	    	var titleId = document.getElementsByName("titleId")[0].value;
	        window.location.href = "${pageContext.request.contextPath}/toStockSelDetails?stockNo="+stockNo+"&titleId="+titleId;
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