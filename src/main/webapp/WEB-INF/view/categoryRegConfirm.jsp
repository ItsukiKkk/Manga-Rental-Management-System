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
<title>カテゴリー登録確認</title>
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
                  <a>カテゴリー登録</a>
                  <a><cite>カテゴリー登録確認</cite></a>
                </span>
                <h2 class="title">カテゴリー登録</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">				
				<div class="layui-card-header">確認</div>
					<form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toCategoryRegSuccess" method="post">
						<div class="layui-form-item">
						<label class="layui-form-label">&nbsp;</label>
							<h3>以下の情報でよろしいですか？</h3>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">カテゴリー名：</label>
							<div class="layui-input-inline">
								<input type="text" name="category" class="layui-input noborder" value="${category.category}" readonly/>
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
	        window.location.href = "${pageContext.request.contextPath}/categoryRegForm";
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