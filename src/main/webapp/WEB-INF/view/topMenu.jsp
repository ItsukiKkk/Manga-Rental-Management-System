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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>メニュー一覧</title>
</head>
<body class="layui-view-body">
	<div class="layui-content" id="topMenu">
		<div class="layui-row layui-col-space20">
			<div class="layui-col-sm12 layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body chart-card">
						<div class="chart-header">
							<div class="metawrap">
								<div class="total">メニュー一覧</div>
								<div class="meta">
									<span>*左側のメニューからも選択できます</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-sm6 layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-body chart-card">
						<div class="chart-header">
							<div class="metawrap">
								<div class="total">
									<font color="#149BD3">会員管理</font>
								</div>
							</div>
						</div>
						<div class="chart-footer">
							<div class="layui-form-item menulink">
								<a href="${pageContext.request.contextPath}/custRegForm"><h2>会員登録</h2></a>
							</div>
							<div class="layui-form-item menulink">
								<a href="${pageContext.request.contextPath}/custSelForm"><h2>会員検索</h2></a>
							</div>
							<div class="layui-form-item menulink">
								<a href="${pageContext.request.contextPath}/tocustDataList"><h2>会員統計</h2></a>
							</div>
							<div class="layui-form-item">
								<a href="#"><h2>&nbsp;</h2></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-sm6 layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-body chart-card">
						<div class="chart-header">
							<div class="metawrap">
								<div class="total">
									<font color="#149BD3">商品管理</font>
								</div>
							</div>
						</div>
						<div class="chart-footer">
							<div class="layui-form-item menulink">
								<a href="${pageContext.request.contextPath}/titleRegForm"><h2>タイトル登録</h2></a>
							</div>
							<div class="layui-form-item menulink">
								<a href="${pageContext.request.contextPath}/titleSelForm"><h2>タイトル検索</h2></a>
							</div>
							<div class="layui-form-item menulink">
								<a href="${pageContext.request.contextPath}/stockSelForm"><h2>在庫検索</h2></a>
							</div>
							<div class="layui-form-item menulink">
								<a href="${pageContext.request.contextPath}/categoryRegForm"><h2>カテゴリー登録</h2></a>
							</div>
							<div class="layui-form-item menulink">
								<a href="${pageContext.request.contextPath}/categoryForm"><h2>カテゴリー検索</h2></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-sm6 layui-col-md4">
				<div class="layui-card">
					<div class="layui-card-body chart-card">
						<div class="chart-header">
							<div class="metawrap">
								<div class="total">
									<font color="#149BD3">貸出・返却</font>
								</div>
							</div>
						</div>
						<div class="chart-footer">
							<div class="layui-form-item">
								<a href="#"><h2>&nbsp;</h2></a>
							</div>
							<div class="layui-form-item">
								<a href="#"><h2>&nbsp;</h2></a>
							</div>
							<div class="layui-form-item">
								<a href="#"><h2>&nbsp;</h2></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="static/layui.all.js"></script>
	<script src="static/js/home.js"></script>
</body>
</html>
