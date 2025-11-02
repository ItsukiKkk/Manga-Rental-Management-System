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
<title>タイトル更新確認</title>
<style type="text/css">
	.layui-form-label {
		width:200px;
	}
	.layui-input {
		width:600px;
	}
	.noBorder {
	    border: none;
	    border-bottom: 1px solid #cccccc;
	    outline: none;
	}
</style>
</head>
<body class="layui-view-body">
	<div class="layui-content">
		<div class="layui-page-header">
            <div class="pagewrap">
                <span class="layui-breadcrumb">
                  <a>タイトル詳細</a>
                  <a>タイトル更新フォーム</a>
                  <a><cite>タイトル更新確認</cite></a>
                </span>
                <h2 class="title">タイトル更新</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">				
				<div class="layui-card-header">確認</div>
					<form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toTitleUpdateSuccess" method="post">
						<div class="layui-form-item">
						<label class="layui-form-label">&nbsp;</label>
							<h3>以下の情報でよろしいですか？</h3>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">タイトル：</label>
							<div class="layui-input-inline">
								<input type="text" name="title" class="layui-input noBorder" value="${title.title}" readonly/>
								<input type="hidden" name="titleId" class="layui-input" value="${title.titleId }" >
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">商品コード：</label>
							<div class="layui-input-inline">
								<input type="text" name="temCd" class="layui-input noBorder" value="${title.temCd}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">カテゴリー：</label>
							<div class="layui-input-inline">
								<input type="text" class="layui-input noBorder" value="${category.category}" readonly/>
								<input type="hidden" name="ctgCd" class="layui-input" value="${title.ctgCd}"/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">主演：</label>
							<div class="layui-input-inline">
								<input type="text" name="actor" class="layui-input noBorder" value="${title.actor}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<div class="layui-input-inline">
								<button type="submit" class="layui-btn layui-btn-blue">更新</button>
								<button type="button" class="layui-btn layui-btn-primary" onclick="toUpdateForm()">修正</button>
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
		/*
			更新フォーム画面に戻る
		*/
	    function toUpdateForm() {
			var titleId = document.getElementsByName("titleId")[0].value;
	        window.location.href = "${pageContext.request.contextPath}/toTitleUpdateForm?titleId=" + titleId;
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