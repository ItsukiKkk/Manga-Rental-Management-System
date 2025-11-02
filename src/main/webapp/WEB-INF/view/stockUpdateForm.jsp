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
<title>在庫更新フォーム</title>
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
                  <a><cite>在庫更新フォーム</cite></a>
                </span>
                <h2 class="title">在庫更新</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">
				<div class="layui-card-header">フォーム</div>
				<form class="layui-form layui-card-body" action="${pageContext.request.contextPath}/toStockUpdateFormConfirm" method="post">
					<input type="hidden" name="stockNo" value="${stock.stockNo}" readonly/>
					<div class="layui-form-item">
							<label class="layui-form-label">タイトルID：</label>
							<div class="layui-input-inline">
								<input type="text" name="titleId" class="layui-input noBorder" value="${stock.titleId}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">タイトル：</label>
							<div class="layui-input-inline">
								<input type="text" name="titleName" class="layui-input noBorder" value="${stock.title.title}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">商品コード：</label>
							<div class="layui-input-inline">
								<input type="text" name="temCd" class="layui-input noBorder" value="${stock.title.temCd}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">主演：</label>
							<div class="layui-input-inline">
								<input type="text" name="actor" class="layui-input noBorder" value="${stock.title.actor}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">カテゴリー：</label>
							<div class="layui-input-inline">
								<input type="text" name="category" class="layui-input noBorder" value="${stock.title.category.category}" readonly/>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">在庫状況：</label>
							<div class="layui-input-inline" style="display: flex; align-items: center; ">
								<select name="stockState" lay-verify="required" id="stockState" >
						        	<option value="0" ${stock.stockState == 0 ? 'selected' : '' }>在庫有</option>
						        	<option value="1" ${stock.stockState == 1 ? 'selected' : '' }>貸出中</option>
						        	<option value="9" ${stock.stockState == 9 ? 'selected' : '' }>その他</option>
						        </select>
					        </div>
						</div>
					<div class="layui-form-item">					
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-block">
							<button type="submit" class="layui-btn layui-btn-blue">更新</button>
							<button type="button" class="layui-btn layui-btn-primary" onclick="toTitleSelDetails()">キャンセル</button>
						</div>
					</div>
					<div class="layui-form-item" id="toMenuBtn">
						<label class="layui-form-label">&nbsp;</label>
						<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/stockSelForm">メインメニューへ</button>
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
			在庫更新フォーム認証の処理
		*/
		$(document).ready(function() {
			$('#stockState').on('change', function() {
			    var selectedValue = $(this).val(); // 获取当前选中的值
			    console.log('Selected value:', selectedValue);
			});

		    // 在庫
		    $('input[name="category"]').blur(function() {
		        var value = $(this).val();
		        if (value.length > 100) {
		            layer.msg('在庫は100桁以内で入力してください', {icon: 2});
		        }
		    });
		 	
		    // submitイベント
		    $('form').submit(function(event) {
		        event.preventDefault();
		        var isValid = true;
		        // 検証
		        $(this).find('input[name="category"]').each(function() {
		            var value = $(this).val().trim();
		            if (value === '') {
		                layer.msg('すべての項目を入力してください', {icon: 2});
		                isValid = false;
		                return false;
		            }
		            
		        });
		        if (isValid) {
		        	$(this).off('submit').submit();
		        }
		    });
		 	
		});
		/*
			在庫詳細画面に戻る
		*/
	    function toTitleSelDetails() {
	    	var titleId = document.getElementsByName("titleId")[0].value;
	    	var stockNo = document.getElementsByName("stockNo")[0].value;
	        window.location.href = "${pageContext.request.contextPath}/toStockSelDetails?titleId="+titleId+"&stockNo="+stockNo;
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