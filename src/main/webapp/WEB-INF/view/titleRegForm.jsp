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
<title>タイトル登録フォーム</title>
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
                <h2 class="title">タイトル登録</h2>
            </div>
        </div>
		<div class="layui-row">
			<div class="layui-card">
				<div class="layui-card-header">フォーム</div>
				<form class="layui-form layui-card-body" action="" method="post">
					<!-- 
						タイトル、商品コード、カテゴリー、主演
					 -->
					<div class="layui-form-item">
						<label class="layui-form-label">タイトル</label>
						<div class="layui-input-inline">
							<input type="text" name="title"
								lay-verify="required|maxlength" placeholder="必須"
								class="layui-input" maxlength="100" value="${title.title}" >
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">商品コード</label>
						<div class="layui-input-inline">
							<input type="text" name="temCd"
								lay-verify="required|number|maxlength" placeholder="13桁までの半角数字を入力してください"
								class="layui-input" maxlength="13" value="${title.temCd}" >
						</div>
					</div>
					<div class="layui-form-item">
					    <label class="layui-form-label">カテゴリー</label>
					    <div class="layui-input-inline" style="display: flex; align-items: center; ">
					        <select name="ctgCd" lay-verify="required" id="ctgCd" >
					        	<option value="">-選択-</option>
					            <!-- 「カテゴリー」を動的に生成 -->
					            <c:forEach items="${categoryList}" var="category">
							        <option value="${category.categoryCd}" ${category.categoryCd == title.ctgCd ? 'selected' : '' }>${category.category}</option>
							    </c:forEach>
					        </select>
					    </div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">主演</label>
						<div class="layui-input-inline">
							<input type="text" name="actor" 
								lay-verify="required|maxlength" placeholder="必須" class="layui-input" maxlength="20" value="${title.actor}">
						</div>
					</div>
					<div class="layui-form-item">					
						<label class="layui-form-label">&nbsp;</label>
						<div class="layui-input-block">
							<button type="submit" class="layui-btn layui-btn-blue">確認</button>
							<button type="reset" class="layui-btn layui-btn-primary">リセット</button>
						</div>
					</div>
					<div class="layui-form-item" id="toMenuBtn">
						<label class="layui-form-label">&nbsp;</label>
						<button type="button" class="layui-btn layui-btn-primary" data-url="${pageContext.request.contextPath}/titleRegForm">メインメニューへ</button>
						<!--  onclick="redirectToMainMenu() -->
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
			タイトル登録フォーム認証の処理
		*/
		$(document).ready(function() {
			// 全角数字を半角数字に変換する
			$('input[name="temCd"]').on('input', function() {
			    var value = $(this).val();
			    var halfWidthValue = value.replace(/[０-９]/g, function(s) {
			        return String.fromCharCode(s.charCodeAt(0) - 65248);
			    });
			    if (value !== halfWidthValue) {
			        $(this).val(halfWidthValue);
			    }
			});
		    // タイトル
		    $('input[name="title"]').blur(function() {
		        var value = $(this).val();
		        if (value.length > 100) {
		            layer.msg('タイトルは100桁以内で入力してください', {icon: 2});
		        }
		    });
		 	// 商品コード
		    $('input[name="temCd"]').blur(function() {
		        var value = $(this).val();
		        // 全角数字を半角数字に転換する
		        value = value.replace(/[０-９]/g, function(s) {
		            return String.fromCharCode(s.charCodeAt(0) - 65248);
		        });
		        $(this).val(value);
		        // 13桁の半角数字
		        if (!/^\d{13}$/.test(value)) {
			        layer.msg('商品コードは13桁の半角数字で入力してください', {icon: 2});
    			}
		    });
		 	// 主演
		    $('input[name="actor"]').blur(function() {
		        var value = $(this).val();
		        if (value.length > 100) {
		            layer.msg('主演は100桁以内で入力してください', {icon: 2});
		        }
		    });
		    
		    // submitイベント
		    $('form').submit(function(event) {
		        event.preventDefault();
		        var isValid = true;
		        // 検証
		        $(this).find('input[name="title"], input[name="temCd"], input[name="actor"], #ctgCd').each(function() {
		            var value = $(this).val().trim();
		            if (value === '') {
		                layer.msg('すべての項目を入力してください', {icon: 2});
		                isValid = false;
		                return false;
		            }
		            // 商品コード
		            if ($(this).attr('name') === 'temCd') {
		            	// 全角数字を半角数字に転換する
		                value = value.replace(/[０-９]/g, function(s) {
		                    return String.fromCharCode(s.charCodeAt(0) - 65248);
		                });
		                $(this).val(value);
		                if (!/^\d{13}$/.test(value)) {
		                    layer.msg('商品コードは13桁の半角数字で入力してください', {icon: 2});
		                    $(this).val('');
		                    isValid = false;
		                    return false;
		                }
		            }
		        });
		        if (isValid) {
		            var formData = $(this).serialize();
		            var contextPath = "${pageContext.request.contextPath}";
		            $.ajax({
		            	async : true,
		                url: contextPath + '/toCheckTemCd',
		                type: 'POST',
		                data: formData,
		                success: function(data) {
		                	if (data.unique == false) {
		                	    layer.confirm('商品コードは既に存在します。<br>もう一度入力してください！', {
		                	        title: '提示',
		                	        btn: ['確認']
		                	    }, function(index){
		                	        layer.close(index);
		                	    });
		                	} else {
		                		window.location.href = '${pageContext.request.contextPath}/toTitleRegConfirm';
		                	}
		                	
		                },
		                error: function(xhr, status, error) {
		                    console.error("エラー発生");
		                }
		            });
		        }
		    });
		    $(":reset").click(function(){
		    	$('#ctgCd').prop('selectedIndex', 0);
	    	　　var resetArr = $(this).parents("form").find(":text");
	    	　　for(var i=0; i<resetArr.length; i++){
	    	　　　　resetArr.eq(i).val("");
	    	　　}
	    	　　return false;
	    	});
		 	
		});	
		
	</script>
</body>
</html>