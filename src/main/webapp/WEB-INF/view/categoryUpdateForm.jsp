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
<title>カテゴリー更新フォーム</title>
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
                  <a><cite>カテゴリー更新フォーム</cite></a>
                </span>
                <h2 class="title">カテゴリー更新</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">
				<div class="layui-card-header">フォーム</div>
				<form class="layui-form layui-card-body" action="" method="post">
					<!-- 
						カテゴリー
					 -->
					<div class="layui-form-item">
						<label class="layui-form-label">カテゴリー</label>
						<div class="layui-input-inline">
							<input type="text" name="category"
								lay-verify="required|maxlength" placeholder="必須"
								class="layui-input" maxlength="100" value="${category.category}" >
						<input type="hidden" name="categoryCd" class="layui-input" value="${category.categoryCd }" >

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
						<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/categoryForm">メインメニューへ</button>
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
			カテゴリー更新フォーム認証の処理
		*/
		$(document).ready(function() {
		    // カテゴリー
		    $('input[name="category"]').blur(function() {
		        var value = $(this).val();
		        if (value.length > 100) {
		            layer.msg('カテゴリーは100桁以内で入力してください', {icon: 2});
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
		            var formData = $(this).serialize();
		            var contextPath = "${pageContext.request.contextPath}";
	            	$.ajax({
		            	async : true,
		                url: contextPath + '/toCheckCategory',
		                type: 'POST',
		                data: formData,
		                success: function(data) {
		                	if (data.unique == false) {
		                	    layer.confirm('カテゴリーは既に存在します。<br>もう一度入力してください！', {
		                	        title: '提示',
		                	        btn: ['確認']
		                	    }, function(index){
		                	        layer.close(index);
		                	    });
		                	} else {
		                		window.location.href = '${pageContext.request.contextPath}/toCategoryUpdateConfirm';
		                	}
		                	
		                },
		                error: function(xhr, status, error) {
		                    console.error("エラー発生");
		                }
		            });
		        }
		    });
		 	
		});
		/*
			カテゴリー詳細画面に戻る
		*/
	    function toTitleSelDetails() {
	    	var categoryCd = document.getElementsByName("categoryCd")[0].value;
	        window.location.href = "${pageContext.request.contextPath}/toCategorySelDetails?categoryCd="+ categoryCd;
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